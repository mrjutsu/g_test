class CreateGroupsMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_messages do |t|
      t.references :group, foreign_key: true
      t.references :message, foreign_key: true

      t.timestamps
    end
    add_foreign_key :groups_messages, :groups
    add_foreign_key :groups_messages, :messages
  end
end
