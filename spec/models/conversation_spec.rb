require 'rails_helper'

RSpec.describe Conversation, type: :model do

  describe 'database_columns' do
    it { should have_db_column :sender_id}
    it { should have_db_column :recipient_id}
  end

  describe 'associations' do
    it { is_expected.to belong_to :sender}
    it { is_expected.to belong_to :recipient}
  end

end


