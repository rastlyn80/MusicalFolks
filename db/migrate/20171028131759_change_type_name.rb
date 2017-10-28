class ChangeTypeName < ActiveRecord::Migration[5.1]
  def change
    rename_column :venues, :type, :venue_type
  end
end
