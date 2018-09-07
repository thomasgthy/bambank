class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
		t.decimal :amount
      	t.integer :from_id, null: false
      	t.integer :to_id, null: false
      	t.timestamps
    end
  end
end
