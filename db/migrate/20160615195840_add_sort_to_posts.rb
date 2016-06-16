class AddSortToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sort, :int
  end
end
