class CreateInkings < ActiveRecord::Migration[5.2]
  def change
    create_table :inkings do |t|
      t.string :name
      t.date :ink_date
      t.text :notes
      t.belongs_to :pen, foreign_key: true

      t.timestamps
    end
  end
end
