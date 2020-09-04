class CreateBillsTable < ActiveRecord::Migration[6.0]

    def change
      create_table :bills do |t|
        t.integer :user_id
        t.integer :amount
        t.string :description
      end
    end
  
  end
  