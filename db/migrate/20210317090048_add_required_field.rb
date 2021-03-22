class AddRequiredField < ActiveRecord::Migration[6.1]
  def change
    change_column_null :diaries, :title, false
    change_column_null :diaries, :kind, false
  end
end
