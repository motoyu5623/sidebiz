require 'rails_helper'

RSpec.describe User, type: :system do
  # let!(:user) { create(:user) }
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            visit root_path
            click_link "ユーザー登録する"
            expect(current_path).to eq new_user_registration_path
            expect(page).to have_content "新規登録"
            fill_in 'user_username', with: "FOOBAR"
            fill_in 'user_email', with: "foobar@example.com"
            fill_in 'user_password', with: "foobar"
            fill_in 'user_password_confirmation', with: "foobar"
            expect {
              click_button "登録する"
              expect(current_path).to eq root_path
              expect(page).to have_content "アカウント登録を受け付けました"
            }.to change(User, :count).by(1)
          end
        end
        context 'ユーザーネーム未記入' do
          it 'ユーザーの新規登録が失敗' do
            visit root_path
            click_link "ユーザー登録する"
            expect(current_path).to eq new_user_registration_path
            expect(page).to have_content "新規登録"
            fill_in 'user_username', with: nil
            fill_in 'user_email', with: "foobar@example.com"
            fill_in 'user_password', with: "foobar"
            fill_in 'user_password_confirmation', with: "foobar"
            expect {
              click_button "登録する"
              expect(current_path).to eq users_path
              expect(page).to have_content "Usernameを入力してください"
            }.to_not change(User, :count)
          end
        end
        context 'メールアドレス未記入' do
          it 'ユーザーの新規登録が失敗' do
            visit root_path
            click_link "ユーザー登録する"
            expect(current_path).to eq new_user_registration_path
            expect(page).to have_content "新規登録"
            fill_in 'user_username', with: "FOOBAR"
            fill_in 'user_email', with: nil
            fill_in 'user_password', with: "foobar"
            fill_in 'user_password_confirmation', with: "foobar"
            expect {
              click_button "登録する"
              expect(current_path).to eq users_path
              expect(page).to have_content "Emailを入力してください"
            }.to_not change(User, :count)
          end
        end
        context '登録済メールアドレス' do
          it 'ユーザーの新規作成が失敗する' do
            visit root_path
            click_link "ユーザー登録する"
            expect(current_path).to eq new_user_registration_path
            expect(page).to have_content "新規登録"
            fill_in 'user_username', with: "FOOBAR"
            fill_in 'user_email', with: user.email
            fill_in 'user_password', with: "foobar"
            fill_in 'user_password_confirmation', with: "foobar"
            expect {
              click_button "登録する"
              expect(current_path).to eq users_path
              expect(page).to have_content "Emailはすでに存在します"
            }.to_not change(User, :count)
          end
        end
      end
    end
    describe 'ログイン後' do
      before { login_as(user) }
      describe 'ユーザー編集' do
        describe 'パスワード以外' do
          context 'フォームの入力値が正常' do
            it 'ユーザーの編集が成功' do
              visit edit_user_registration_path(user)
              fill_in 'user_username', with: "NEWFOOBAR"
              fill_in 'user_email', with: 'change@example.com'
              click_button 'プロフィールを更新する'
              expect(current_path).to eq user_path(user)
              expect(page).to have_content 'アカウントを更新しました'
            end
          end
          context 'メールアドレスが未入力' do
            it 'ユーザーの編集が失敗' do
              visit edit_user_registration_path(user)
              fill_in 'user_email', with: nil
              click_button 'プロフィールを更新する'
              expect(current_path).to eq users_path
              expect(page).to have_content 'Emailを入力してください'
            end
          end
        end
        describe 'パスワード' do
          context 'フォームの入力値が正常' do
            it 'ユーザーの編集が成功' do
              visit edit_user_registration_path(user)
              click_link 'パスワードを変更'
              fill_in 'user_password', with: 'newpassword'
              fill_in 'user_password_confirmation', with: 'newpassword'
              fill_in 'user_current_password', with: 'password'
              click_button 'パスワードを変更する'
              expect(current_path).to eq user_path(user)
              expect(page).to have_content 'アカウントを更新しました'
            end
          end
          context '現在のパスワードを未入力' do
            it 'ユーザーの編集が失敗' do
              visit edit_user_registration_path(user)
              click_link 'パスワードを変更'
              fill_in 'user_password', with: 'newpassword'
              fill_in 'user_password_confirmation', with: 'newpassword'
              fill_in 'user_current_password', with: nil
              click_button 'パスワードを変更する'
              expect(current_path).to eq users_path
              expect(page).to have_content 'Current passwordを入力してください'
            end
          end
        end
      end
    end
  end
end
