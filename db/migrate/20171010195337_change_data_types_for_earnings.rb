class ChangeDataTypesForEarnings < ActiveRecord::Migration[5.0]
  def change
    change_column :earnings, :planned, :float
  end
end
