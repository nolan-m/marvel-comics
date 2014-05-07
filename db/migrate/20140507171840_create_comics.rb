class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :marvel_id
      t.string :title
      t.string :issueNumber
      t.string :description
      t.string :image
      t.timestamps
    end
  end
end
