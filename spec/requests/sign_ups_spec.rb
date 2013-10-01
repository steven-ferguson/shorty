require 'spec_helper'

feature "Sign Ups" do
  scenario "A user signs up successfully" do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', :with => 'foo@bar.com'
    fill_in 'Password', :with => 'lalalalalala'
    fill_in 'Password confirmation', :with => 'lalalalalala'
    click_button 'Sign up!'
    page.should have_content 'Thanks'
  end

  scenario "A user doesn't sign up successfully" do 
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up!'
    page.should have_content "can't"
  end
end
