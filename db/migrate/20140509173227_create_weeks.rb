class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :week_number
    end

    rename_column :comics, :week_number, :week_id

  end
end
