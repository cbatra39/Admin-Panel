class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phoneno
      t.boolean :status

      t.timestamps
    end
  end
end
