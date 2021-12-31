require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'instance methods' do
    before(:each) do
      @owner = Owner.create!(name: "Fred")
      @machine = @owner.machines.create!(location: "Community College")
      @machine2 = @owner.machines.create!(location: "Swim Club")
      @snack = @machine.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)
      @snack2 = @machine.snacks.create!(name: "Pop Rocks", price: 1.50)
      @snack3 = @machine2.snacks.create!(name: "Sunflower Seeds", price: 1.50)
      @snack4 = @machine2.snacks.create!(name: "Chocolate Almonds", price: 2.50)
    end
    describe '#avg_price' do
      it 'returns average price for all machine_snacks' do
        expect(@machine.avg_price).to eq(2)
        expect(@machine2.avg_price).to eq(2)
      end
    end
  end 
end
