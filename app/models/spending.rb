class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :group
  # validates :name, presence: true, length: { minimum: 3 }
end
