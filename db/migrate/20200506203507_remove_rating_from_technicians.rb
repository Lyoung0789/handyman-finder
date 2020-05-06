class RemoveRatingFromTechnicians < ActiveRecord::Migration[6.0]
  def change
    remove_column :technicians, :rating, :integer
  end
end
