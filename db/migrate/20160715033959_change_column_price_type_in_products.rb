class ChangeColumnPriceTypeInProducts < ActiveRecord::Migration
  def up
    rename_column :products, :price, :price_cents
    change_column :products, :price_cents, :integer
  end

  def down
    change_column :products, :price_cents, :decimal
    rename_column :products, :price_cents, :price
  end
end
