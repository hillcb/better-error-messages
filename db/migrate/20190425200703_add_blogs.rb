class AddBlogs < ActiveRecord::Migration[5.2]
  def change
      create_table :blogs do |t|
        t.string :title
        t.string :contents
      end
  end
end
