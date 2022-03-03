class AddProductRefToOrder < ActiveRecord::Migration[7.0]
  def change  
    # add_column :orders, :product, :integer 
    add_reference :orders, :product, null: false, foreign_key: true
  end
  
end
