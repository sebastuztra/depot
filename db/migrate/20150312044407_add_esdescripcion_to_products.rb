class AddEsdescripcionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :esdescripcion, :text
  end
end
