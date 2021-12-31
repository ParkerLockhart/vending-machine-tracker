require 'rails_helper'

RSpec.describe 'machine show page' do
  before(:each) do
    @owner = Owner.create!(name: "Fred")
    @machine = @owner.machines.create!(location: "Community College")
    @machine2 = @owner.machines.create!(location: "Swim Club")
    @snack = @machine.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)
    @snack2 = @machine.snacks.create!(name: "Pop Rocks", price: 1.50)
    @snack3 = @machine2.snacks.create!(name: "Sunflower Seeds", price: 1.50)
    @snack4 = @machine2.snacks.create!(name: "Chocolate Almonds", price: 2.50)
  end

  it 'shows machine location' do
    visit "/machines/#{@machine.id}"

    expect(page).to have_content(@machine.location)
  end

  it 'shows snack names and prices' do
    visit "/machines/#{@machine.id}"

    expect(page).to have_content(@snack.name)
    expect(page).to have_content(@snack2.name)
    expect(page).to have_content(@snack.price)
    expect(page).to have_content(@snack2.price)
  end

  it 'shows average snack price' do
    visit "/machines/#{@machine.id}"

    expect(page).to have_content(@machine.avg_price)
  end 

end
