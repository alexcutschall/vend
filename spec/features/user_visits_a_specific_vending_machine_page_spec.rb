require 'rails_helper'

describe 'user visits a specific vending machine page' do
  scenario 'it sees all the snacks associated with that machine' do
    owner = Owner.create!(name: "Alex's Awesome Snacks")
    machine = Machine.create!(location: "Seattle", owner_id: owner.id)
    item_1 = machine.snacks.create!(name: "Dried Mango", price: 5)
    item_2 = machine.snacks.create!(name: "Dried Apples", price: 15)

    visit machine_path(machine)
    
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.price)
    expect(page).to have_content("Average Price: 10")
  end
end
