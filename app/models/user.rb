class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups
  has_many :messages, dependent: :destroy
  has_many :categories

  has_many :users_groups
  has_many :joined_groups, through: :users_groups, source: :group

end
