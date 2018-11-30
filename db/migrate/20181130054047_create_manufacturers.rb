class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.boolean :active, null: false, default: true
      t.text :description

      t.timestamps
    end
  end
end
