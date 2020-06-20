class Suggest < ApplicationRecord
  belongs_to :user

  enum status:{掲載中: 0, 契約済: 1, レビュー待ち: 2, 契約完了: 3}

  validates :title, presence: true
  validates :detail, length:{maximum:500}
  validates :price, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
end
