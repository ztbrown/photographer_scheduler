Given (/^There is an open session for the date I am searching$/) do
  Repository.for(:session).create({wedding_date: Date.today + 1, photographer_id: 1})
end

When(/^I go to the homepage and search for open sessions on a future date$/) do
  visit path
  fill_in 'wedding_search_date', with: Date.tomorrow.to_s
  click_button 'submit'
end

Then(/^I should get redirected to the results/) do
  expect(page).to have_content('Results')
  expect(page).to have_css('li', :count => 1)
end