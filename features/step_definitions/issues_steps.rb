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
  page.driver.execute_script("return document.activeElement;").send_keys(:enter)
  sleep(0.5)
end

Then /^there should be a new issue in the backlog$/ do
  @product.backlog.issues.count.should == 1
  @product.backlog.issues.last.name.should == @issue_name
end

When /^I start the issue by clicking on start$/ do
  within "#issue_#{@issue.id}" do
    click_button "start"
  end
end

Then /^the issue should be in progress$/ do
  @issue.reload.status.should == :in_progress
end

Then /^the time should be running for me on that issue$/ do
  user.reload.current_session.should == @issue.sessions.last
  user.current_session.should be_in_progress
end

When /^I double click an issue$/ do
  page.driver.execute_script('$("#issue_'+@issue.id.to_s+' .name").trigger("dblclick")')
end

Then /^it should change to an input$/ do
  within "#issue_#{@issue.id}" do
    page.should have_field("issue[name]")
  end
end

When /^I change the name$/ do
  within "#issue_#{@issue.id}" do
    fill_in("issue[name]", with: "New issue name")
  end
end

Then /^the issue should be renamed$/ do
  @issue.reload.name.should == "New issue name"
  within "#issue_#{@issue.id} .name" do
    page.should have_content("New issue name")
  end
end

Given /^I have an issue that's been started$/ do
  @issue = FactoryGirl.create(:issue, sprint: @product.backlog)
  @issue.status = :in_progress
end

Given /^I am currently working on that issue$/ do
  @issue.start_by(user)
end

When /^I put the issue in feedback by clicking on complete$/ do
  within "#issue_#{@issue.id}" do
    click_button "complete"
  end
end

Then /^the issue should be in feedback$/ do
  @issue.reload.status.should == :feedback
end

Then /^I should no longer be working on that issue$/ do
  user.reload.current_issue.should_not eql(@issue)
end

Given /^I have an issue that's on feedback$/ do
  @issue = FactoryGirl.create(:issue, sprint: @product.backlog)
  @issue.status = :feedback
end

When /^I reject the issue by clicking on reject$/ do
  within "#issue_#{@issue.id}" do
    click_button "reject"
  end
end

Then /^the issue should be rejected$/ do
  @issue.reload.status.should == :rejected
end

When /^I accept the issue by clicking on accept$/ do
  within "#issue_#{@issue.id}" do
    click_button "accept"
  end
end

Then /^the issue should be accepted$/ do
  @issue.reload.status.should == :accepted
end

Given /^I have an issue that's been rejected$/ do
  @issue = FactoryGirl.create(:issue, sprint: @product.backlog)
  @issue.status = :rejected
end

