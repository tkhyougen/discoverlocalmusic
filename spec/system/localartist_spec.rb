# bundle exec rspec spec/system/localartist_spec.rb
require 'rails_helper'
RSpec.describe 'アーティスト投稿一覧', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @localartist = FactoryBot.create(:localartist, user: @user)
    @secondlocalartist = FactoryBot.create(:second_localartist, user: @user)
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    find('#link').click
    sleep 2.0
    expect(current_path).to eq user_path(id: @user.id)
  end

  describe 'アーティスト投稿一覧画面' do
    context 'タスクを作成した場合' do
      it "作成済みのタスクが表示される" do
        visit localartists_path
        current_path
        expect(page).to have_content "Aaa"
      end
    end
  end

end
