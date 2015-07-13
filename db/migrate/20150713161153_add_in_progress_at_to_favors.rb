class AddInProgressAtToFavors < ActiveRecord::Migration
  def change
    add_column :favors, :in_progress_at, :datetime
  end
end
