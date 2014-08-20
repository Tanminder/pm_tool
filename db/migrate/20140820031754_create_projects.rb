class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
