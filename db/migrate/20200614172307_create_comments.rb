class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      t.references :article, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
