class RemoveColumnPooltype < ActiveRecord::Migration[7.0]
  def self.up
    remove_column :proofs, :pool_type, :string
  end

  def self.down
    add_column :proofs, :pool_type, :string
  end
end
