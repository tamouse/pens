class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :label
      t.boolean :active, null: false, default: true
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :address_4
      t.string :locality
      t.string :region_code
      t.string :country_code
      t.string :postal_code
      t.decimal :latitude
      t.decimal :longitude
      t.string :timezone
      t.string :addressable_type
      t.integer :addressable_id
      t.text :notes

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
