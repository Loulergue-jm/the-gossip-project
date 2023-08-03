class AddGossipRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :gossip, null: false, foreign_key: {on_delete: :cascade }
  end
end
