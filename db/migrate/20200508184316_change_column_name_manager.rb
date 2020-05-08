class ChangeColumnNameManager < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :technician, :management
  end
end
