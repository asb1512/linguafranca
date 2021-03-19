class CreateForeignLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_languages do |t|
      t.string            :name
      t.string            :wikipedia_link
      t.boolean           :approved, default: false
      t.boolean           :pitched

      t.timestamps
    end
  end
end
