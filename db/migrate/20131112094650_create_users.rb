class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :zip_code
      t.string :city
      t.string :nip

      t.timestamps
    end
  end
end
