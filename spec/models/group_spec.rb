require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'First', email: 'first@first.com', password: '123456') }
  let(:group) do
    Group.create(name: 'Category1',
                 icon: 'https://static8.depositphotos.com/1338574/829/i/600/depositphotos_8293001-stock-photo-the-number-1-in-gold.jpg',
                 user_id: user.id)
  end

  describe 'Validations' do
    context 'when valid' do
      it { expect(group).to be_valid }
    end

    it 'should allow valid name' do
      group.name = 'aaaaa'
      expect(group).to be_valid
    end

    it 'should allow valid name' do
      group.name = 'Adam'
      expect(group).to be_valid
    end

    it 'should allow valid user_id' do
      group.user_id = nil
      expect(group).to_not be_valid
    end
  end
end
