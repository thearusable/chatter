require 'spec_helper'
require 'rails_helper'

feature 'User visits peoples page'  do
  let!(:user) { create :user }

  background do
    sign_in
    expect(page).to have_content 'Signout'
    visit root_path
  end

  scenario 'should see peoples list' do
    expect(page).to have_content user.nickname
  end

  scenario 'only when sign in' do
    logout
    visit root_path
    expect(page).to have_content 'Log In'
  end
end
