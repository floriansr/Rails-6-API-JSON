class Addcolumnsjwtblacklist < ActiveRecord::Migration[6.0]
  def change
  	add_column :jwt_blacklist, :exp, :datetime
  end
end
