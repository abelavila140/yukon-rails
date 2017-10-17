class CreateMonthlyBills < ActiveRecord::Migration[5.0]
  def change
    create_table :monthly_bills do |t|
      t.string :name
      t.integer :group_id
      t.date :due_date
      t.float :planned
      t.float :actual

      t.timestamps
    end
  end
end
