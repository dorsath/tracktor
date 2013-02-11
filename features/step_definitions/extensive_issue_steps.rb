When /^I click once on the issue$/ do
  page.driver.execute_script("$('#issue_#{@issue.id}').trigger('click')")
end

Then /^it should be in extensive mode$/ do
  page.should have_selector("#issue_#{@issue.id}.extensive")
end

When /^I click on it again$/ do
  page.driver.execute_script("$('#issue_#{@issue.id}').trigger('click')")
end

Then /^it should be in preview mode$/ do
  page.should_not have_selector("#issue_#{@issue.id}.extensive")
end

Then /^I should see the user who created it$/ do
  within "#issue_#{@issue.id}" do
    page.find(".created_by").should have_content(user.name)
  end
end

Then /^I should see when it was created$/ do
  within "#issue_#{@issue.id}" do
    page.find(".created_at").should have_content(@issue.created_at)
  end
end

Then /^I should see how much time there was spent on it$/ do
  within "#issue_#{@issue.id}" do
    page.find(".time_spent").should have_content(@issue.total_time_spent_on)
  end
end
