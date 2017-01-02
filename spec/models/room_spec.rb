require 'rails_helper'

RSpec.describe Room do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title}
    it { is_expected.to validate_presence_of :category}
    it { is_expected.to validate_presence_of :description}
    it { is_expected.to validate_presence_of :owner_id}
    it { is_expected.to validate_presence_of :users_count}
  end

  describe 'database_columns' do
    it { should have_db_column :type}
    it { should have_db_column :title}
    it { should have_db_column :category}
    it { should have_db_column :description}
    it { should have_db_column :owner_id}
    it { should have_db_column :users_count}
  end

  describe 'associations' do
    #it { is_expected.to have_many :conversations}
    it { is_expected.to have_many :messages}
  end

  describe 'nested attributes' do
    #it { should accept_nested_attributes_for :users_count}
  end
end
