class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :user_id, :integer
    add_foreign_key :blogs, :users
  end
end
