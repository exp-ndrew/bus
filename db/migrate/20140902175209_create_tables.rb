class CreateTables < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
    end
    create_table :lines do |t|
      t.string :name
    end
    create_table :stops do |t|
      t.integer :station_id
      t.integer :line_id
    end
  end
end
