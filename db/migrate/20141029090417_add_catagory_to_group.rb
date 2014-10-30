class AddCatagoryToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :catagory, :string
  end
end
