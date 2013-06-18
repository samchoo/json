class AddVioFromVendors < ActiveRecord::Migration
  def change
    
    
    add_column :Vendors ,:hasviolation , :boolean
  end
end
