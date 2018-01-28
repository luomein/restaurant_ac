class AddLikesCountToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :likes_count, :integer, :default => 0
    add_column :restaurants, :favorites_count, :integer, :default => 0
  end
end
