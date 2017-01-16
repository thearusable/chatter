require 'rails_helper'

RSpec.describe FormUser do
  describe 'validations' do
    it { is_expected.to validate_presence_of :email}
    it { is_expected.to validate_length_of :password}
  end

end
