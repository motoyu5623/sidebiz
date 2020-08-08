require 'rails_helper'

RSpec.describe User, type: :system do
  # let!(:user) { create(:user) }
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User CRUD' do
    describe 'before log in' do
      describe 'registrate user' do
        context 'with valid input' do
          it 'succeed in creating user' do
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
        context 'without username' do
          it 'fail in creating user' do
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
        context 'without email' do
          it 'fail in craeting user' do
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
        context 'with email already registrated' do
          it 'fail in craeting user' do
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
    describe 'after log in' do
      before { login_as(user) }
      describe 'edit user' do
        describe 'except for password' do
          context 'with valid input' do
            it 'succeed in editing user' do
              visit edit_user_registration_path(user)
              fill_in 'user_username', with: "NEWFOOBAR"
              fill_in 'user_email', with: 'change@example.com'
              click_button 'プロフィールを更新する'
              expect(current_path).to eq user_path(user)
              expect(page).to have_content 'アカウントを更新しました'
            end
          end
          context 'with email form empty' do
            it 'fail in editing user' do
              visit edit_user_registration_path(user)
              fill_in 'user_email', with: nil
              click_button 'プロフィールを更新する'
              expect(current_path).to eq users_path
              expect(page).to have_content 'Emailを入力してください'
            end
          end
        end
        describe 'password' do
          context 'with valid input' do
            it 'succeeded in editing user' do
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
          context 'without current password' do
            it 'fail in editing user' do
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
