class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :nip

      t.timestamps
    end
  end
end
