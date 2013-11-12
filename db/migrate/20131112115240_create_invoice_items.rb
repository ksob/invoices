class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.decimal :price
      t.string :name
      t.belongs_to :invoice, index: true

      t.timestamps
    end
  end
end
