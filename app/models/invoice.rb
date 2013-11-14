class Invoice < ActiveRecord::Base
  has_many :invoice_items
  has_many :invoice_notes

  accepts_nested_attributes_for :invoice_items, allow_destroy: true

  def self.get_all_client_names
    Client.all.collect {|p| p.name }
  end

  def self.get_client_names_with_ids
    Client.all.collect {|p| [ p.name, p.id ] }
  end
end
