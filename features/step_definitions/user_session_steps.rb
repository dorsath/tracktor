Then /^I should see my name in the top corner$/ do
  within "#user_session" do
    page.find(".name").should have_content(user.name)
  end
end

Given /^I am currently working on the issue$/ do
  @issue.start_by(user)
end

Then /^I should see the issue in my user session$/ do
  within "#user_session" do
    page.find(".currently_working_on").should have_content(@issue.name)
  end
end
