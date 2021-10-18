require 'rails_helper'

RSpec.describe Teacher, type: :model do
  fixtures :users
  fixtures :teachers

  context 'when creating a teacher' do
    it 'validates their full_name' do
      mariana = teachers(:mariana)
      carlos = teachers(:carlos)

      expect(mariana.valid?).to eq(true)
      expect(carlos.valid?).to eq(false)
    end
  end

  describe 'teacher belong to association' do
    context 'with a user' do
      it { should respond_to(:user) }
    end
  end
end
