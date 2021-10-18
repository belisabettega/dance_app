require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  context 'when creating a user' do
    it 'validates their full_name' do
      mariana = users(:mariana)
      carlos = users(:carlos)
      as12 = users(:as12)

      expect(mariana.valid?).to eq(true)
      expect(carlos.valid?).to eq(false)
      expect(as12.valid?).to eq(false)
    end
  end
end
