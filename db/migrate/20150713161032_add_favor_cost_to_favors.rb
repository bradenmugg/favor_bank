class AddFavorCostToFavors < ActiveRecord::Migration
  def change
    add_column :favors, :favor_cost, :integer, default: 1
  end
end
