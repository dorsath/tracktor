class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.integer :sprint_id

      t.timestamps
    end
  end
end
