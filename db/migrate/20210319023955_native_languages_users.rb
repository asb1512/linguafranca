class NativeLanguagesUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :native_languages, :users
  end
end
