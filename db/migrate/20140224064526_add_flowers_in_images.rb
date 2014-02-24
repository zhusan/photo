class AddFlowersInImages < ActiveRecord::Migration
  def change
    add_column  :images, :flowers, :integer, default: 0
  end
end
