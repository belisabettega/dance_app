require 'rails_helper'

RSpec.describe Booking, type: :model do
  fixtures :bookings

  describe 'booking belong to association' do
    context 'with a user' do
      it { should respond_to(:user) }
    end
    context 'with a slot' do
      it { should respond_to(:slot) }
    end
  end

  context 'when canceling the booking' do
    it 'changes the status to false' do
      booking = bookings(:valid_booking)

      booking.cancel_booking

      expect(booking.status).to eq(false)
    end
    it 'changes the slot provisional to true' do
      booking = bookings(:valid_booking)

      booking.cancel_booking

      expect(booking.slot.provisional).to eq(true)
    end
  end
end
