class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex:{men: 0, women: 1, others: 2}

  validates :name, presence: true, length:{maximum: 20}
  validates :kana_name, presence: true
  validates :sex, presence: true
  validates :phone_number, presence: true
end
