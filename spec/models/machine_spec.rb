require 'rails_helper'

describe Machine do
  describe 'relationships' do
    it "should belong to an owner" do
      machine = Machine.create(location: "Denver" )

      expect(machine).to respond_to(:owner)
    end
    it "should have many snacks" do
      machine = Machine.create(location: "Denver" )

      expect(machine).to respond_to(:snacks)
    end
    it "should belong to snacks" do
      machine = Machine.create(location: "Denver" )

      expect(machine).to respond_to(:snack)
    end
  end
  describe 'methods' do
    it 'should find #average_price_of_snacks' do
      owner = Owner.create(name: "Alex's Awesome Snacks")
      machine = Machine.create(location: "Seattle", owner_id: owner.id)
      item_1 = machine.snacks.create(name: "Dried Mango", price: 5)
      item_2 = machine.snacks.create(name: "Dried Apples", price: 15)

      expect(machine.average_price_of_snacks).to eq(10)
    end
  end
end
