class Spending < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups, dependent: :destroy

  # validates :name, presence: true, length: { minimum: 3 }
end
