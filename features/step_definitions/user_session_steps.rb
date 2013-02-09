Then /^I should see my name in the top corner$/ do
  within "#user_session" do
    page.find(".name").should have_content(user.name)
  end
end
