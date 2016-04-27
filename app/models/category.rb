class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged]

  belongs_to :user

  has_many :messages_categories, dependent: :destroy
  has_many :messages, through: :messages_categories

  validates :name, presence: { message: 'La categoría debe tener un nombre.' }, uniqueness: { message: 'Ya hay una categoría con ese nombre.', case_sensitive: false }, format: { with: /[a-zA-Z0-9]/ }

  scope :search_by_name, -> (name) { find_by("lower(name) LIKE ?","%#{name.downcase}%") }

end
