class CreateNativeLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :native_languages do |t|

      t.timestamps
    end
  end
end
