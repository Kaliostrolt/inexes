class CreateInexes < ActiveRecord::Migration
  def change
    create_table :inexes do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.float :cost

      t.timestamps
    end
  end
end
