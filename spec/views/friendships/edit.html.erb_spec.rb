require 'rails_helper'

RSpec.describe 'friendships/edit', type: :view do
  before(:each) do
    @friendship = assign(:friendship, Friendship.create!(
                                        user: nil,
                                        post: nil
                                      ))
  end

  it 'renders the edit friendship form' do
    render

    assert_select 'form[action=?][method=?]', friendship_path(@friendship), 'post' do
      assert_select 'input[name=?]', 'friendship[user_id]'

      assert_select 'input[name=?]', 'friendship[post_id]'
    end
  end
end
