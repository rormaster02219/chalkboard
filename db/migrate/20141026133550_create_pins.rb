class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.boolean :used
      t.string :number
      t.timestamps
    end
  end
end
