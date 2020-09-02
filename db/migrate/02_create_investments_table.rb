class CreateInvestmentsTable < ActiveRecord::Migration[4.2]

    def change
      create_table :investments do |t|
        t.integer :user_id
        t.integer :amount
        t.content :description
      end
    end
  
  end
  