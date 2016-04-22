class AddSlugToGroupAndCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :slug, :string
    add_column :categories, :slug, :string
  end
end
