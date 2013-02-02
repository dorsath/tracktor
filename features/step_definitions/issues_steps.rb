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

