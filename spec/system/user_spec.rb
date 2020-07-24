# bundle exec rspec spec/system/user_spec.rb
require 'rails_helper'
RSpec.describe 'ユーザー登録', type: :system do

  describe "ユーザ登録のテスト" do
    context "ユーザーデータがなくログインしていない場合" do
      it "ユーザー新規登録のテスト" do
        visit new_user_registration_path
        fill_in 'user_name', with: 'sample'
        fill_in 'user_email', with: 'sample@example.com'
        fill_in 'user_password', with: '00000000'
        fill_in 'user_password_confirmation', with: '00000000'
        click_on 'アカウント登録'
        expect(page).to have_content 'sampleのページ'
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
    end
    context "ユーザーのデータがあってログインしていない場合" do
      it "ログインができること" do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        find('#link').click
        sleep 2.0
        expect(current_path).to eq user_path(id: @user.id)
      end
    end
    context "ユーザーのデータがあってログインしている場合" do
      before do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        find('#link').click
        sleep 2.0
      end
      it "ログアウトができること" do
        visit user_path(id: @user.id)
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました。"
      end
    end
  end
end
