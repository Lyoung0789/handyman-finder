class CreateTechnicians < ActiveRecord::Migration[6.0]
  def change
    create_table :technicians do |t|
      t.string :name
      t.string :phone_number
      t.integer :rating
      t.string :category
      t.string :email

      t.timestamps
    end
  end
end
