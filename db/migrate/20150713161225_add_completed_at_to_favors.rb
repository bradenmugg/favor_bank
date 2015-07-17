class AddCompletedAtToFavors < ActiveRecord::Migration
  def change
    add_column :favors, :completed_at, :datetime
  end
end
