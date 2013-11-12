class CreateInvoiceNotes < ActiveRecord::Migration
  def change
    create_table :invoice_notes do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.belongs_to :invoice, index: true

      t.timestamps
    end
  end
end
