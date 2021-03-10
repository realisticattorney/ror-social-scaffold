require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:friend) }
  it 'Need Users before creation' do
    expect(Friendship.new).to_not be_valid
  end
end