class AddCurrentSessionToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_session_id, :integer
  end
end
