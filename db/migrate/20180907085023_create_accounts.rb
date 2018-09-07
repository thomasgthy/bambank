class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.decimal :balance, default: 0
      t.integer :user_id
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end
