require 'rails_helper'

RSpec.describe 'snack show page' do
  before(:each) do
    @owner = Owner.create!(name: "Fred")
    @machine = @owner.machines.create!(location: "Community College")
    @machine2 = @owner.machines.create!(location: "Swim Club")
    @snack = Snack.create!(name: "Flaming Hot Cheetos", price: 2.50)
    @snack2 = Snack.create!(name: "Pop Rocks", price: 1.50)
    @snack3 = Snack.create!(name: "Sunflower Seeds", price: 1.50)
    @snack4 = Snack.create!(name: "Chocolate Almonds", price: 2.50)
    @machine.snacks << @snack
    @machine.snacks << @snack2
    @machine.snacks << @snack3
    @machine2.snacks << @snack
    @machine2.snacks << @snack3
    @machine2.snacks << @snack4
    visit "/snacks/#{@snack.id}"
  end

  it 'shows the name of the snack' do
    expect(page).to have_content("Flaming Hot Cheetos")
  end

  it 'shows the price of the snack' do
    expect(page).to have_content("$2.5")
  end

  it 'shows a list of machine locations that carry the snack' do
    expect(page).to have_content("Community College")
    expect(page).to have_content("Swim Club")
  end

  it 'shows the average price of snacks in each machine' do
    expect(page).to have_content(@machine.avg_price)
    expect(page).to have_content(@machine2.avg_price)
  end

  it 'shows a count of snack types in each machine' do
    expect(page).to have_content("3 kinds of snacks")
  end
end
