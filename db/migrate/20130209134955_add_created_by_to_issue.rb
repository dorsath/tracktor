class AddCreatedByToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :created_by_id, :integer
    Issue.all.each { |i| i.update_attribute(:created_by, User.find(1)) }
  end
end
