class FixDateName < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservations, :start_dat, :start_date
  end
end
