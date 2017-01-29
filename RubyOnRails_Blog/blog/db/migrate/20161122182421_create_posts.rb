class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.text :text
      t.datetime :created_date
      t.datetime :published_date

      t.timestamps
    end
  end
end
