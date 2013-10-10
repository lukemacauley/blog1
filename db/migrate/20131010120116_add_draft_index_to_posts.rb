class AddDraftIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :draft
  end
end
