class ChangeNameOfIssuenumber < ActiveRecord::Migration
  def change
    rename_column :comics, :issueNumber, :issue_number
  end
end
