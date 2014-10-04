class DiscussionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @project    = Project.find(params[:project_id])
    @discussion = @project.discussions.new(params.require(:discussion).permit(:title, :description))
    @discussion.user = current_user

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @project, notice: 'Discussion was successfully created.' }
        format.js { render }
        # format.json { render :show, status: :created, location: @discussion }
      else
        flash.now[:alert] = "Discussion can't be saved"
        format.html { render '/projects/show'}
        # format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  # def update
  #   respond_to do |format|
  #     @project = Project.find(params[:project_id])
  #     if @discussion.update(discussion_params)
  #       format.html { redirect_to project_path(@project), notice: 'Discussion was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @discussion }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @discussion.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @project = Project.find params[:project_id]
    @discussion = @project.discussions.find params[:id]
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Discussion was successfully destroyed.' }
      format.js { render }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:title, :description, :project_id)
    end
end
