When /^I create a project$/ do
  @project = FactoryGirl.create(:project)
end

Then /^the project should have a backlog$/ do
  @project.backlog.should be_a(Sprint)
end

