When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end


Given /^I am not authenticated$/ do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/photographers/sign_out", {}
    page.driver.submit :delete, "/customers/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end