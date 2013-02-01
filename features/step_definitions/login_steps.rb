include Warden::Test::Helpers

Given /^I am logged in$/ do
  login_as(user)
end

def user
  @login_user ||= FactoryGirl.create(:user)
end

