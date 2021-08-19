class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.text :body
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
