class Group < ApplicationRecord
  belongs_to :user
  has_many :spendings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end
