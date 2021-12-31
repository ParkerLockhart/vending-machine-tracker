require 'rails_helper'

RSpec.describe 'owners index page' do
  before(:each) do
    @owner = Owner.create!(name: "Fred")
    @machine = @owner.machines.create!(location: "Community College")
    @machine2 = @owner.machines.create!(location: "Swim Club")
    @snack = @machine.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)
    @snack2 = @machine.snacks.create!(name: "Pop Rocks", price: 1.50)
    @snack3 = @machine2.snacks.create!(name: "Sunflower Seeds", price: 1.50)
    @snack4 = @machine2.snacks.create!(name: "Chocolate Almonds", price: 2.50)
    visit '/'
  end

  it 'shows each owner name' do
    expect(page).to have_content(@owner.name)
  end

  it 'shows each owner machines' do
    expect(page).to have_content(@machine.location)
    expect(page).to have_content(@machine2.location)
  end
end
