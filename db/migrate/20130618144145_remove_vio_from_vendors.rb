class RemoveVioFromVendors < ActiveRecord::Migration
  def change
    remove_column :vendors, :hasvalid
  end
end
