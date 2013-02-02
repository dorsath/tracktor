And /^I have an active sprint with a couple issues$/ do
  @sprint = FactoryGirl.create(:sprint, product: @product, active: true)
  @issues = 3.times.map do
    FactoryGirl.create(:issue, sprint: @sprint)
  end
end

Then /^I should see the issues within the sprint$/ do
  within "#sprint_#{@sprint.id}" do
    @issues.each do |issue|
      page.should have_content(issue.name)
    end
  end
end

Given /^I have an issue$/ do
  @issue = FactoryGirl.create(:issue, sprint: @product.backlog)
end

When /^I drag the issue to the sprint$/ do
  issue  = page.find_by_id("issue_#{@issue.id}")
  sprint = page.find_by_id("sprint_#{@active_sprint.id}")
  issue.drag_to(sprint)
  sleep(0.5)
end

Then /^the issue should be in the sprint$/ do
  @issue.reload.sprint.should == @active_sprint
end


When /^I press "(.*?)"$/ do |string_of_keys|
  page.driver.execute_script("return document.body").send_keys(string_of_keys)
end

Then /^I should see a new issue input$/ do
  within ".backlog" do
    page.should have_field("issue[name]")
  end
end

When /^I fill in a name for the issue$/ do
  @issue_name =  Faker::Name.name
  within ".backlog" do
    fill_in "issue[name]" , with: @issue_name
  end
end

When /^I press enter$/ do
  page.driver.execute_script("return document.getElementById('add_issue')").send_keys(:enter)
  sleep(0.5)
end

Then /^there should be a new issue in the backlog$/ do
  @product.backlog.issues.count.should == 1
  @product.backlog.issues.last.name.should == @issue_name
end
