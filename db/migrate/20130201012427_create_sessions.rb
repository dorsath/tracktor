class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :issue_id
      t.datetime :from
      t.datetime :till
      t.integer :user_id

      t.timestamps
    end
  end
end
