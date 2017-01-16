require 'rails_helper'

RSpec.describe Room do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title}
    it { is_expected.to validate_presence_of :category}
    it { is_expected.to validate_presence_of :description}
  end

  describe 'database_columns' do
    it { should have_db_column :title}
    it { should have_db_column :category}
    it { should have_db_column :description}
  end

  describe 'associations' do
    it { is_expected.to have_many :user_rooms}
    it { is_expected.to have_many :messages}
  end

end
