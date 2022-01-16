require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET auth/profile" do
    it "Displays User" do
      get :show
      user = User.create({username: "testing", password: "testing", password_confirmation: "testing", email: "testing@testin.com" })
      expect(expects(:users)).to eq([user])
    end
  end
end

