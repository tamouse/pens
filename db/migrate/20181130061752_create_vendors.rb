class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.boolean :active, null: false, default: true
      t.text :description
      t.text :notes
      t.string :url
      t.string :phone
      t.string :fax
      t.string :mobile

      t.timestamps
    end
  end
end
