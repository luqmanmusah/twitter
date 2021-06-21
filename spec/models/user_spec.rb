require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new
  end

  it 'will be invalid without a name' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'will be invalid without an email address' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'will be invalid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  describe 'User associations' do
    it { should have_many(:opinions).with_foreign_key(:author_id) }
    it { should have_many(:friendships) }
    it { should have_many(:inverse_friendships) }
  end
end
