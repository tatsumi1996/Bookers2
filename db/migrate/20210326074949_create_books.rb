class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
