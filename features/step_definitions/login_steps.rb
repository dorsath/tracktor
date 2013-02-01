include Warden::Test::Helpers

Given /^I am logged in$/ do
  @user = user
  login_as(@user)

  @user
end

def user
  @login_user ||= FactoryGirl.create(:user)
end

