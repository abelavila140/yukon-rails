class ChangeDaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :earnings, :planned, :float, :deafult => nil
  end
end
