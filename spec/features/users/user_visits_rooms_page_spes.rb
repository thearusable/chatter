require 'spec_helper'

feature 'User visits rooms page'  do
  let!(:user) { create :user }
  let!(:room) { create :room }

  background do
    sign_in
    expect(page).to have_content 'Signout'
    visit rooms_path
  end

  scenario 'should see rooms list' do
    expect(page).to have_content 'title'
    expect(page).to have_content 'category'
    expect(page).to have_content 'description'
  end

  scenario 'should see option to create new room' do
    expect(page).to have_content 'Create chat room'
    expect(page).to have_content 'No subject restrictions'
    expect(page).to have_content 'You can talk about anything.'
    expect(page).to have_content 'Create public chat room'
  end

  scenario 'should see new room form' do
    visit new_room_path
    expect(page).to have_content 'Title'
    expect(page).to have_field 'room_title'
    expect(page).to have_content 'Category'
    expect(page).to have_field 'room_category'
    expect(page).to have_content 'Description'
    expect(page).to have_field 'room_description'
  end

  scenario 'create new room with valid data' do
    visit new_room_path
    expect(page).to have_field 'room_title'
    expect(page).to have_field 'room_category'
    expect(page).to have_field 'room_description'
    fill_in 'Title', with: "Tytul"
    fill_in 'Category', with: "Kategoria"
    fill_in 'Description', with: "Opis"

    click_on 'Add!'

    expect(page).to have_content 'Tytul'
    expect(page).to have_content 'Kategoria'
    expect(page).to have_content 'Opis'
  end

  scenario 'only when sign in' do
    logout
    visit rooms_path
    expect(page).to have_content 'Log In'
  end
end
