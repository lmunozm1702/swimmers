class CreateProofs < ActiveRecord::Migration[7.0]
  def change
    create_table :proofs do |t|
      t.string :abbreviation
      t.string :description
      t.string :pool_type

      t.timestamps
    end
  end
end
