class CreatePens < ActiveRecord::Migration[5.2]
  def change
    create_table :pens do |t|
      t.boolean :active, null: false, default: true
      t.string :name
      t.text :description
      t.belongs_to :manufacturer, foreign_key: true
      t.string :model
      t.string :color
      t.string :nib_size
      t.string :nib_width
      t.date :purchase_date
      t.belongs_to :vendor, foreign_key: true
      t.boolean :edc, null: false, default: false

      t.timestamps
    end
  end
end
