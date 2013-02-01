And /^I have an active sprint with a couple issues$/ do
  @sprint = FactoryGirl.create(:sprint, product: @product, active: true)
  @issues = 3.times.map do
    FactoryGirl.create(:issue, sprint: @sprint)
  end
end

Then /^I should see the issues within the sprint$/ do
  within ".sprint_#{@sprint.id}" do
    @issues.each do |issue|
      page.should have_content(issue.name)
    end
  end
end
