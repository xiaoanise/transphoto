require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての入力情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'introductionが空だと登録できない' do
        @user.introduction = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'languageが空だと登録できない' do
        @user.language = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Language can't be blank")
      end
      it 'hobbyが空だと登録できない' do
        @user.hobby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Hobby can't be blank")
      end
    end
  end
end