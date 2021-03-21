class CreateForeignLanguagesUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :languages, :users
  end
end
