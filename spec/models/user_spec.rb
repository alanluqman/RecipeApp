require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'alan', email: 'alan@gmail.com', role: 'admin', password: 'password123') }
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'user name should be alan' do
    expect(subject.name).to eq('alan')
  end

  it 'user role should equal to admin' do
    expect(subject.role).to eq('admin')
  end

  it 'blank name raises error' do
    subject.name = ''
    expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed)
  end
end
