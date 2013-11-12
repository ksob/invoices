class Invoice < ActiveRecord::Base
  def self.get_all_client_names
    names = []
    Clients.all.each do |client|
      names << client.name
    end
  end

  def self.get_client_names_with_ids
    Client.all.collect {|p| [ p.name, p.id ] }
  end
end
