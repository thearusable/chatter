require 'rails_helper'

RSpec.describe Identity do
  describe 'validations' do
    it { is_expected.to validate_presence_of :uid}
  end

  describe 'database_columns' do
    it { should have_db_column :user_id}
    it { should have_db_column :provider}
    it { should have_db_column :accesstoken}
    it { should have_db_column :refreshtoken}
    it { should have_db_column :uid}
    it { should have_db_column :email}
  end

  describe 'associations' do
    it { is_expected.to belong_to :user}
  end

end
