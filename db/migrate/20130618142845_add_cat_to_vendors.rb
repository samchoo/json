class AddCatToVendors < ActiveRecord::Migration
  def change
    add_column :vendors , :ids, :integer
    add_column :vendors, :type, :string
  end
end
