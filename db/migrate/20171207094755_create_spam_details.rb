class CreateSpamDetails < ActiveRecord::Migration
  def change
    create_table :spam_details do |t|
      t.integer :spam_number, :limit => 8
      t.integer :spam_by, :limit => 8
    end
  end
end
