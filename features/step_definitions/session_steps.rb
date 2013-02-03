Given /^I have a product, sprint and issue$/ do
  @product = FactoryGirl.create(:product)
  @sprint  = FactoryGirl.create(:sprint,product: @product)
  @issue   = FactoryGirl.create(:issue ,sprint:  @sprint, status: :in_progress)
end

When /^I continue the issue$/ do
  visit product_path(@product)
  within "#issue_#{@issue.id}" do
    click_button "continue"
  end
end

Then /^I should have an active session$/ do
  @user.reload
  @user.current_session be_same_time(DateTime.now)
end


And /^the continue button should now be a stop button$/ do
  within "#issue_#{@issue.id}" do
    page.should have_button("stop")
  end
end

Given /^an active issue$/ do
  visit product_path(@product)
  within "#issue_#{@issue.id}" do
    click_button "continue"
  end
end

When /^I stop the issue$/ do
  within "#issue_#{@issue.id}" do
    click_button "stop"
  end
end

Then /^I should no longer have an active session$/ do
  @user.reload
  @user.current_session.should be_nil
end

Then /^the stop button should now be a continue button$/ do
  within "#issue_#{@issue.id}" do
    page.should have_button("continue")
  end
end

RSpec::Matchers.define :be_same_time do |expected|
  match do |actual|
    actual.to_i == expected.to_i
  end
end

