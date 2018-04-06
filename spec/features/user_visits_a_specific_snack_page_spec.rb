require 'rails_helper'

describe 'user visits a specific snack page' do
  scenario 'user sees that snacks information' do
    owner = Owner.create!(name: "Alex's Awesome Snacks")
    snack_1 = Snack.create!(name: "Dried Mango", price: 5)
    snack_2 = Snack.create!(name: "Dried Apples", price: 15)
    machine_1 = snack_1.machines.create!(location: "Seattle", owner_id: owner.id)
    machine_2 = snack_1.machines.create!(location: "San Francisco", owner_id: owner.id)
    machine_3 = snack_1.machines.create!(location: "Buenos Aires", owner_id: owner.id)


    visit snack_path(snack_1)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(machine_1.location)
    expect(page).to have_content(machine_1.price)
    expect(page).to_not have_content(snack_2.name)
    expect(page).to_not have_content(snack_2.price)

  end
end
