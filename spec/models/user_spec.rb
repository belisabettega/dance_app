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

  context 'when checking if user is a teacher' do
    it 'returns true if teacher' do
      mariana = users(:mariana)

      expect(mariana.is_a_teacher?).to eq(true)
    end
    it 'returns false if not a teacher' do
      nicolas = users(:nicolas)

      expect(nicolas.is_a_teacher?).to eq(false)
    end
  end
end
