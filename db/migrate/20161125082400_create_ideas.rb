class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :photo
      t.string :name
      t.string :banner
      t.string :title
      t.text :description
      t.integer :likescount
      t.integer :commentscount

      t.timestamps
    end

  end
end
