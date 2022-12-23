require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    user = User.new(name: 'gordon', email: 'test@test.com', role: 'admin', password: 'pass123')
    Recipe.new(name: 'pizzah', preparation_time: 2, cooking_time: 2, description: 'This is the description',
               public: true, author: user)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'check recipe name' do
    expect(subject.name).to eq('pizzah')
  end

  it 'blank title raises error' do
    subject.name = ''
    expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed)
  end
end
