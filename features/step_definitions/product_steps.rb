When /^I create a product$/ do
  @product = FactoryGirl.create(:product)
end

Then /^the product should have a backlog$/ do
  @product.backlog.should be_a(Sprint)
end

