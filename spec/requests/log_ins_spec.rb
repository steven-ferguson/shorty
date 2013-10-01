require 'spec_helper'

feature "Log in" do
  scenario "A user successfully logs in" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log in"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Log In"
    page.should have_content('Logged')
  end

  scenario "an unsuccessful log in" do 
    visit root_path 
    click_link "Log in"
    click_button "Log"
    page.should have_content "Invalid"
  end
end
