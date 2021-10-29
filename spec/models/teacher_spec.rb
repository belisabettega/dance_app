require 'rails_helper'

RSpec.describe Teacher, type: :model do
  fixtures :users
  fixtures :teachers

  context 'when creating a teacher' do
    it 'validates their description' do
      mariana = teachers(:mariana)
      carlos = teachers(:carlos)

      carlos.save

      expect(mariana.valid?).to eq(true)
      expect(carlos.errors[:description]).to include("is too short (minimum is 80 characters)")
    end

    it 'validates their price' do
      luiz = teachers(:luiz)
      luiz.update(price: 'letters')

      expect(luiz.errors[:price]).to include("is not a number")
    end
  end

  describe 'teacher belong to association' do
    context 'with a user' do
      it { should respond_to(:user) }
    end
  end

  context 'when saving address' do
    it 'generates latitude and longitude' do
      mariana = teachers(:mariana)
      mariana.update(address: '68 Battersea Rise, London SW11 1EQ')
      
      expect(mariana.latitude).not_to be_nil
      expect(mariana.longitude).not_to be_nil
    end
  end
end
