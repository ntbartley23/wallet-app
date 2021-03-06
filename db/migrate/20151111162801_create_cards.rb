class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.integer :card_number
    	t.string  :card_type
    	t.integer :expiration_month
    	t.integer :expiration_year
    	t.decimal :balance
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
