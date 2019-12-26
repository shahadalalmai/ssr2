class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :desc
      t.string :city
      t.string :image
      t.string :location

      t.timestamps
    end
  end
end
