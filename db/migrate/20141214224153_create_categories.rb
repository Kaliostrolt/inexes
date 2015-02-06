class CreateCaregories < ActiveRecord::Migration
  def change
    create_table :caregories do |t|
      t.integer :user_id
      t.string :name
      t.string :type
      t.timestamps
    end
  end
end
