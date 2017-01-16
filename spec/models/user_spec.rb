require 'rails_helper'

RSpec.describe User do

  describe 'database_columns' do
    it { should have_db_column :nickname}
    it { should have_db_column :orientation}
    it { should have_db_column :sex}
    it { should have_db_column :age}
  end

  describe 'associations' do
    it { is_expected.to have_many :rooms}
    it { is_expected.to have_many :conversations}
    it { is_expected.to have_many :messages}
    it { is_expected.to have_many :identities}
  end

end
