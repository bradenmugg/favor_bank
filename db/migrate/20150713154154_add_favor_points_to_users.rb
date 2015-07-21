class AddFavorPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favor_points, :integer, default: 0
  end
end
