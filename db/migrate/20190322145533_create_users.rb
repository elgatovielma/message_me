class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :username
      #it must be named like this in order to user bcrypt
      t.string :password_digest
      t.timestamps
    end
  end
end
