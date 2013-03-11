class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :payer_id
      t.integer :recipient_id
      t.decimal :amount
      t.date :paid_period_begins
      t.date :paid_period_ends

      t.timestamps
    end
  end
end
