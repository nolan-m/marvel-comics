class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :comics, :description, :text
  end
end
