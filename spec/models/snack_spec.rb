require 'rails_helper'

describe Snack do
  describe 'validations' do
    it "should have a name" do
      machine = Machine.create(location: "Minneapolis")
      snack = Snack.create(price: 5,  machine_id: machine.id )

      expect(snack).to be_invalid
    end
    it "should have a price" do
      machine = Machine.create(location: "Minneapolis")
      snack = Snack.create(name: "Cocomels", machine_id: machine.id )

      expect(snack).to be_invalid
    end
  end
  describe 'relationships' do
    it 'should belong to a machine' do
      machine = Machine.create(location: "Minneapolis")
      snack = Snack.create(name: "Cocomels", price: 5, machine_id: machine.id)

      expect(snack).to respond_to(:machine)
    end
    it 'should have many machines' do
      machine = Machine.create(location: "Minneapolis")
      snack = Snack.create(name: "Cocomels", price: 5, machine_id: machine.id)

      expect(snack).to respond_to(:machines)
    end
  end
end
