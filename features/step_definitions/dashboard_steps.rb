Given /^the project has seen some work$/ do
  3.times { FactoryGirl.create(:user) }
  @users = User.all
  @active_sprints = 3.times.map do
    FactoryGirl.create(:sprint, project: @project, active: true)
  end

  @inactive_sprints = 2.times.map do
    sprint = FactoryGirl.create(:sprint, project: @project, active: false)
    3.times do
      issue = FactoryGirl.create(:issue, sprint: sprint)
      issue.status = Issue::STATUS[rand(0..(Issue::STATUS.length - 1))]
      3.times do
        usr = @users[rand(0..(@users.length - 1))]
        day = DateTime.now.advance(days: rand(-4..1))
        from = day.advance(hours: rand(-3..-1))
        till = from.advance(hours: rand(1..3))
        issue.sessions.create(user: usr, till: till).update_attribute(:from, from)

      end
    end
    sprint
  end
end

When /^I visit my dashboard$/ do
  visit dashboard_path
end

Then /^I should see the project$/ do
  within ".projects .project_name" do
    page.should have_content(@project.name)
  end
end

Then /^I should see the total time spent on it$/ do
  within ".projects .total_time_spent_on" do
    page.should have_content((@project.total_time_spent_on / 3600).round )
  end
end

Then /^I should see the total time I spent on it$/ do
  within ".projects .my_time_spent_on" do
    page.should have_content((@project.time_spent_by(user) / 3600).round)
  end
end

When /^I fill in a new project name$/ do
  within "#new_project" do
    fill_in("project[name]", with: "New project")
  end
end

When /^I press create$/ do
  within "#new_project" do
    click_button("create")
  end
end

Then /^I should have a project$/ do
  Project.last.name.should == "New project"
end
