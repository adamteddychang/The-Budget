class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :set_role
  validates :name, presence: true
  validates :email, presence: true

  has_many :groups, dependent: :destroy
  has_many :expenditures, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }

  def set_role
    update(role: 'user')
  end
end
