class AddAboutColumnToTechniciansTable < ActiveRecord::Migration[6.0]
  def change
    add_column :technicians, :about, :text
  end
end
