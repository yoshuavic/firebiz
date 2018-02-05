class AddColumnAddressToRegister < ActiveRecord::Migration[5.1]
  def change
    add_column :registers, :adress, :text
    add_column :registers, :kota, :string
  end
end
