class CreateUsersGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_foreign_key :users_groups, :groups
    add_foreign_key :users_groups, :users
  end
end
