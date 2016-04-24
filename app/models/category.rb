class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged]

  belongs_to :user

  has_many :messages_categories, dependent: :destroy
  has_many :messages, through: :messages_categories

  validates :name, presence: { message: 'La categoría debe tener un nombre.' }
  validates :name, uniqueness: { message: 'Ya hay una categoría con ese nombre.' }

end
