class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, index: true
      t.text :content
      t.string :highlight_image
      t.text :highlight
      t.integer :status, index: true
      t.string :metadata
      t.datetime :published_at, index: true
      t.references :user, foreign_key: true
      t.integer :click_count
      t.json :tags
      t.string :searcher

      t.timestamps
    end
  end
end
