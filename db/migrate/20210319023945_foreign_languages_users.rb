class ForeignLanguagesUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :foreign_languages, :users
  end
end
