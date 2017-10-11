class ChangeDefaultToNull < ActiveRecord::Migration[5.0]
  def change
    change_column :earnings, :planned, :float, :null => true
  end
end
