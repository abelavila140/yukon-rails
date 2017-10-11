class ChangeDefaultValueEarnings < ActiveRecord::Migration[5.0]
  def change
    change_column :earnings, :planned, :float, default: 0
  end
end
