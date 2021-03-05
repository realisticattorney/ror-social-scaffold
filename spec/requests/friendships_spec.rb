 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/friendships", type: :request do
  # Friendship. As you add validations to Friendship, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Friendship.create! valid_attributes
      get friendships_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      friendship = Friendship.create! valid_attributes
      get friendship_url(friendship)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_friendship_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      friendship = Friendship.create! valid_attributes
      get edit_friendship_url(friendship)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Friendship" do
        expect {
          post friendships_url, params: { friendship: valid_attributes }
        }.to change(Friendship, :count).by(1)
      end

      it "redirects to the created friendship" do
        post friendships_url, params: { friendship: valid_attributes }
        expect(response).to redirect_to(friendship_url(Friendship.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Friendship" do
        expect {
          post friendships_url, params: { friendship: invalid_attributes }
        }.to change(Friendship, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post friendships_url, params: { friendship: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested friendship" do
        friendship = Friendship.create! valid_attributes
        patch friendship_url(friendship), params: { friendship: new_attributes }
        friendship.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the friendship" do
        friendship = Friendship.create! valid_attributes
        patch friendship_url(friendship), params: { friendship: new_attributes }
        friendship.reload
        expect(response).to redirect_to(friendship_url(friendship))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        friendship = Friendship.create! valid_attributes
        patch friendship_url(friendship), params: { friendship: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested friendship" do
      friendship = Friendship.create! valid_attributes
      expect {
        delete friendship_url(friendship)
      }.to change(Friendship, :count).by(-1)
    end

    it "redirects to the friendships list" do
      friendship = Friendship.create! valid_attributes
      delete friendship_url(friendship)
      expect(response).to redirect_to(friendships_url)
    end
  end
end
