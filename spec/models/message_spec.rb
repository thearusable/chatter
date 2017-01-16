require 'rails_helper'

RSpec.describe Message do
  describe 'validations' do
    it { is_expected.to validate_presence_of :body}
    it { is_expected.to validate_presence_of :user_id}
  end

  describe 'database_columns' do
    it { should have_db_column :body}
    it { should have_db_column :user_id}
  end
end
