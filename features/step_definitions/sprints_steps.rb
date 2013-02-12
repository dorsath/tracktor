Given /^I have a project$/ do
  @project = FactoryGirl.create(:project)
end

Given /^it has an active sprint$/ do
  @active_sprint = FactoryGirl.create(:sprint, project: @project, active: true)
end

Given /^an inactive sprint$/ do
  @inactive_sprint = FactoryGirl.create(:sprint, project: @project, active: false)
end

When /^I take a look at the project$/ do
  visit project_path(@project)
end

Then /^I should only see the active sprint$/ do
  page.should have_content(@active_sprint.name)
  page.should_not have_content(@inactive_sprint.name)
end

When /^I open the form by clicking on "Add sprint"$/ do
  page.find("#add_sprint_button").click
end

Then /^I should see a form for the new sprint$/ do
  page.should have_field("sprint[name]")
end

When /^I fill in the form's name$/ do
  fill_in "sprint[name]", with: "Newly created sprint"
end

Then /^I should have a new sprint$/ do
  Sprint.last.name.should == "Newly created sprint"
  page.should have_selector("#sprint_#{Sprint.last.id}")
end

When /^I click on the sprint's options button$/ do
  within "#sprint_#{@active_sprint.id}" do
    click_link "options"
  end
end

Then /^I should see the sprint's info$/ do
  within "#sprint_#{@active_sprint.id}" do
    within ".options" do
      page.should have_content(@active_sprint.created_at)
    end
  end
end

Then /^I should not be able to see the sprint's info$/ do
  within "#sprint_#{@active_sprint.id}" do
    #page.should_not have_selector('.options')
  end
end

