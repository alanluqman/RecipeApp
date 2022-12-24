require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    user = User.create(name: 'Gordon', email: 'test@test.com', password: 'test12345', role: 'admin')
    Food.create(name: 'orange', measurement_unit: 'grams', price: 3, author: user)
  end

  it '# is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
