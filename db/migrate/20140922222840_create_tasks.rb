class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :due_date
      t.boolean :status, default: false
      t.references :project, index: true
      t.timestamps
    end
  end
end
