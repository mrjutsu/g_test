class CreateMessagesCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :messages_categories do |t|
      t.references :category, foreign_key: true
      t.references :message, foreign_key: true

      t.timestamps
    end
    add_foreign_key :messages_categories, :messages
    add_foreign_key :messages_categories, :categories
  end
end
