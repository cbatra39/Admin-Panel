class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.string :fname
      t.string :lname
      t.string :gender
      t.integer :age
      t.string :address
      t.integer :user_id

      t.timestamps
    end
    add_index :infos, :user_id
  end
end
