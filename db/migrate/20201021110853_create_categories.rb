class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end

    categories = %w[Others Sports Politics Geography History]
    categories.each_with_index do |category_name, index|
      category = Category.new
      category.name = category_name
      category.priority = index
      category.save
    end
  end
end
