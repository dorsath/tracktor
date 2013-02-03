class AddStatusIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :status_id, :integer, default: 0
  end
end
