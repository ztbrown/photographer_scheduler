When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^I press "(.*?)"$/) do |arg|
  click_button arg
end

Then(/^I should see "(.*?)"$/) do |arg|
  expect(page).to have_content(arg)
end

Given /^I am not authenticated$/ do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/users/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end
