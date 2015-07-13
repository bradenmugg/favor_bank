class AddStatusToFavors < ActiveRecord::Migration
  def change
    add_column :favors, :status, :string, default: "open"
  end
end
