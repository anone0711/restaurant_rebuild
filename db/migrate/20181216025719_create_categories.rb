class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps

      add_column :restaurants, :category_id, :integer
    end
  end
end
