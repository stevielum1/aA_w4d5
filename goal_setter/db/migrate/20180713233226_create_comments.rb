class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t.text :body, null: false
      t.references :model, polymorphic: true, null: false, index: true
      t.timestamps
    end
    
    add_index :comments, :author_id
  end
end
