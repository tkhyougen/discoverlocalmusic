#rspec　
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "nameが空ならバリデーションが通らない" do
    user = User.new(name:"", email:"abc@example.com",comment:"test",password:"abcabc",password_confirmation:"abcabc")
    expect(user).not_to be_valid
  end

  it "commentが空でもバリデーションは通る" do
    user = User.new(name:"abc", email:"abc@example.com",comment:"",password:"abcabc",password_confirmation:"abcabc")
    expect(user).to be_valid
  end
end
