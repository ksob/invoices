class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :purchase_date
      t.date :issue_date
      t.string :payment_period
      t.integer :invoice_number

      t.timestamps
    end
  end
end
