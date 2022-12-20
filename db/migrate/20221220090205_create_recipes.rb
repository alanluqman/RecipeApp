class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.text :descrition
      t.boolean :public
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
