class AddWeekToComics < ActiveRecord::Migration
  def change
    add_column :comics, :week_number, :integer
  end
end
