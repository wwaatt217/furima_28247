class User < ApplicationRecord
  has_many :items
  has_many :buys
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :birthdate
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates_format_of :family_name, :first_name, with: NAME_REGEX, message: 'お名前は全角で入力してください' 
    NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates_format_of :family_name_kana, :first_name_kana, with: NAME_KANA_REGEX, message: 'お名前は全角カナで入力してください' 
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  end

  end