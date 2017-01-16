require 'spec_helper'

feature 'User visits rooms page'  do
  let!(:user) { create :user }
  let!(:room) { create :room }

  background do
    sign_in
    expect(page).to have_content 'Signout'
    visit edit_user_registration_path
  end

  scenario 'should see form for update account data' do
    expect(page).to have_content 'Avatar'
    expect(page).to have_field 'user_avatar'
    expect(page).to have_content 'Age'
    expect(page).to have_field 'user_age'
    expect(page).to have_content 'Sex'
    expect(page).to have_field 'user_sex'
    expect(page).to have_content 'Orientation'
    expect(page).to have_field 'user_orientation'
  end

  scenario 'should see option to cance account' do
    expect(page).to have_content 'Unhappy?'
    expect(page).to have_button 'Cancel my account'
  end

  scenario 'only when sign in' do
    logout
    visit edit_user_registration_path
    expect(page).to have_content 'Log In'
  end
end
