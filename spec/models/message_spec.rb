require 'rails_helper'

RSpec.describe Message do
  describe 'validations' do
    it { is_expected.to validate_presence_of :body}
    it { is_expected.to validate_presence_of :user_id}
    it { is_expected.to validate_presence_of :room_id}
  end

  describe 'database_columns' do
    it { should have_db_column :body}
    it { should have_db_column :user_id}
    it { should have_db_column :room_id}
  end
end
