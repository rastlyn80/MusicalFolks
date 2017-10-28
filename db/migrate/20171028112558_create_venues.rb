class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :listing_name
      t.string :type
      t.text :description
      t.string :address
      t.integer :max_guests
      t.string :instruments
      t.string :preferred_style
      t.boolean :hosts_events
      t.boolean :has_recording
      t.boolean :has_wifi
      t.boolean :has_heating
      t.boolean :has_conditioning
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
