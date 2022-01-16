require 'rails_helper'

RSpec.describe User, :type => :model do

  it "User is not valid without needed attributes" do
    expect(User.new).to be_invalid
  end
  
  it "Password must match password_confirmation" do
  expect(User.create({username: "testing", password: "testing", password_confirmation: "testin" })).to be_invalid
  end

  it "Password must be 6 or more characters" do 
    expect(User.create({username: "testing", password: "test", password_confirmation: "test" })).to be_invalid
  end

  it "Username must be 5 or more characters" do 
    expect(User.create({username: "test", password: "test", password_confirmation: "test" })).to be_invalid
  end

  it "User is valid if it contains: username, password, password_confirmation,email" do 
    expect(User.create({username: "testing", password: "testing", password_confirmation: "testing", email: "testing@testin.com" })).to be_valid
  end
end