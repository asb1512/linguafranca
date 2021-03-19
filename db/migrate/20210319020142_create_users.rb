class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string                :email
      t.string                :password_digest
      t.string                :username
      t.string                :first_name
      t.string                :last_name
      t.integer               :age
      t.string                :skype_username

      t.timestamps
    end
  end
end
