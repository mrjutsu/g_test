class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged]
  
  belongs_to :user

  has_many :messages_categories
  has_many :messages, through: :messages_categories

  validates :name, presence: { message: 'La categoría debe tener un nombre.' }

end
