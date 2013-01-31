Given /^I have a product$/ do
  @product = FactoryGirl.create(:product)
end

Given /^it has an active sprint$/ do
  @active_sprint = FactoryGirl.create(:sprint, product: @product, active: true)
end

Given /^an inactive sprint$/ do
  @inactive_sprint = FactoryGirl.create(:sprint, product: @product, active: false)
end

When /^I take a look at the product$/ do
  visit product_path(@product)
end

Then /^I should only see the active sprint$/ do
  page.should have_content(@active_sprint.name)
  page.should_not have_content(@inactive_sprint.name)
end
