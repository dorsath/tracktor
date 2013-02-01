Given /^I have a product, sprint and issue$/ do
  @product = FactoryGirl.create(:product)
  @sprint  = FactoryGirl.create(:sprint,product: @product)
  @issue   = FactoryGirl.create(:issue ,sprint:  @sprint)
end

When /^I continue the issue$/ do
  visit product_path(@product)
  within ".issue_#{@issue.id}" do
    click_button "continue"
  end
end

Then /^I should have an active session$/ do
  user.reload
  user.current_session be_same_time(DateTime.now)
end


And /^the continue button should now be a stop button$/ do
  within ".issue_#{@issue.id}" do
    page.should have_button("stop")
  end
end

RSpec::Matchers.define :be_same_time do |expected|
  match do |actual|
    actual.to_i == expected.to_i
  end
end

