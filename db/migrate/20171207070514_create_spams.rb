class CreateSpams < ActiveRecord::Migration
  def change
    create_table :spams do |t|
      t.integer :phone_number, :limit => 8
      t.integer :count, default: 0
    end
  end
end
