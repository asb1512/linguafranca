class CreateForeignLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :foreign_languages do |t|

      t.timestamps
    end
  end
end
