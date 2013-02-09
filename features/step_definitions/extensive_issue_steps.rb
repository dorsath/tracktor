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
