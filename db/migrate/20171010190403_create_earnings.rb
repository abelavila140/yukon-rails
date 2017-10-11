class CreateEarnings < ActiveRecord::Migration[5.0]
  def change
    create_table :earnings do |t|
      t.string :name
      t.integer :planned
      t.integer :actual
      t.date :date
      t.timestamps
    end
  end
end
