require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it "nicknamが空だと登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは@を含む必要がある" do
      @user.email = "aaa@aaa"
      expect(@user).to be_valid
      # binding.pry
    end
    
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下登録できない" do
      @user.password = "aaaaa"
      @user.password_confirmation = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードは半角英数字混合である" do
      @user.password = "aaaaaa111"
      @user.password_confirmation = "aaaaaa111"
      expect(@user).to be_valid
    end

    it "family_nameが空だと登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end


    it "family_nameが全角(漢字、ひらがな、カタカナ)で入力しないと登録できない" do
      @user.family_name = "阿あア"
      expect(@user).to be_valid
    end
    it "family_name_kanaが全角(カタカナ)で入力しないと登録できない" do
      @user.family_name_kana = "ア"
      expect(@user).to be_valid
    end


    it "first_nameが全角(漢字、ひらがな、カタカナ)で入力しないと登録できない" do
      @user.first_name = "阿あア"
      expect(@user).to be_valid
    end
    it "first_name_kanaが全角(カタカナ)で入力しないと登録できない" do
      @user.first_name_kana = "ア"
      expect(@user).to be_valid
    end
  


end


  end

