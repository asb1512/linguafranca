class CreateLanguageUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :language_users do |t|
      t.integer       :language_id
      t.integer       :user_id
      t.boolean       :foreign_language
      t.timestamps
    end
  end
end
