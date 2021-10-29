require 'rails_helper'

RSpec.describe Slot, type: :model do
  fixtures :slots

  context 'when creating a slot' do
    it 'validates the duration' do
      slot_with_wrong_duration = slots(:slot_with_wrong_duration)
      
      slot_with_wrong_duration.save
      expect(slot_with_wrong_duration.errors[:duration]).to include("is not included in the list")
    end

    it 'only accept future start times' do
      slot_in_the_past = slots(:slot_in_the_past)

      slot_in_the_past.save
      expect(slot_in_the_past.errors[:base]).to include("start time can't be in the past")
    end

    it 'does not accept same start time slots' do
      slot_in_the_past = slots(:slot_in_the_past)

      slot_in_the_past.save
      expect(slot_in_the_past.errors[:base]).to include("start time can't be in the past")
    end
  end

  describe 'slot belong to association' do
    context 'with a teacher' do
      it { should respond_to(:teacher) }
    end
    context 'with a user through teacher' do
      it { should respond_to(:user) }
    end
  end

end
