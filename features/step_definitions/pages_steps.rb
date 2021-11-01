Given(/^I am on the home page$/) do
  visit root_path
end

Then(/^I should see "(.*?)"$/) do |text|
  page.has_content?(text)
end

Then(/^I should be able to see the teachers available$/) do
  click_on 'Get to Know our teachers'
  expect(page).to have_current_path(teachers_path)
end

