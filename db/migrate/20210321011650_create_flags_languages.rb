class CreateFlagsLanguages < ActiveRecord::Migration[6.1]
  def change
      create_join_table :flags, :languages
  end
end
