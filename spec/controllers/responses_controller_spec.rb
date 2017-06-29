require 'rails_helper'

RSpec.describe ResponsesController, type: :controller do

  describe "GET #responses/new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post #responses/create" do
    it "returns http redirect" do
      post :create, params: { response: { city: "London", languages: ["Ruby"], salaries: ['Under £ 25,000'] }}
      expect(response).to have_http_status(302)
    end
  end

  describe "Post #responses/create" do
    it "creates a new response" do
      expect { FactoryGirl.create(:response) }.to change(Response, :count).by(1)
    end
  end

  describe "Post #responses/create" do
    it "creates a new response" do
      expect { post :create, params: { response: { city: "", languages: [] }} }.to change(Response, :count).by(0)
    end
  end

end
