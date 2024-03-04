require 'rails_helper'
require 'capybara/rspec'
RSpec.describe "Articles", type: :system do
    it "creates a new articles" do
  model = FactoryBot.create(:model)
  visit new_model_session_path
  fill_in "Email", with: model.email
  fill_in "Password", with: model.password
  click_button "Log in"
  sleep(1)
  visit new_article_path
  fill_in "Title", with: "Wanderlust Words"
  sleep(1)
  fill_in "Body", with: " Unearth the mysteries of uncharted territories within
    the pages of this notebook. With meticulously drawn maps and cryptic annotations,
    it beckons the reader to embark on a cartographer's quest, navigating through realms both real and imagined,
  where the boundaries of the known world dissolve."
  sleep(1)
  select "public", from: "Status"
  sleep(1)
  click_button "Add Article"
  expect(page).to have_content ''
end

end