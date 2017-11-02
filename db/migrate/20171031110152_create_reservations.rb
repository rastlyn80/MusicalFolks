class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :venue, foreign_key: true
      t.datetime :start_dat
      t.datetime :end_date
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end