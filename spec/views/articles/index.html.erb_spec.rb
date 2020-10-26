require 'rails_helper'

RSpec.describe 'User Access', type: :system do
  describe 'New user' do
    it 'User sign-up is correct' do
      # Access Home Page
      visit('/')

      sleep 4
      # Go to Sign Up page
      click_link('Sign up')

      # Sign up
      sleep 4
      fill_in('name', with: 'Test')
      fill_in('password', with: 'password')
      fill_in('password_confirmation', with: 'password')
      sleep 4
      click_button('Sign up')

      # Logout
      sleep 4
      click_link('Sign Out')
    end
  end

  describe 'User login' do
    it 'User login is correct' do
      # Access Home Page
      visit('/')

      # sign up
      sleep 4
      # Go to Sign Up page
      click_link('Sign up')

      # Sign up
      sleep 4
      fill_in('name', with: 'Test')
      fill_in('password', with: 'password')
      fill_in('password_confirmation', with: 'password')
      sleep 4
      click_button('Sign up')

      # Logout
      sleep 4
      click_link('Sign Out')
      # logged out

      # login
      sleep 4
      fill_in('name', with: 'Test')
      fill_in('password', with: 'password')

      sleep 4
      click_button('Login')

      # Logout
      sleep 4
      click_link('Sign Out')
    end
  end
end
