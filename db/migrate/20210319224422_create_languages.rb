class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string          :name
      t.string          :wikipedia_link
      t.boolean         :approved, default: false
      t.boolean         :pitched
      t.boolean         :gendered
      t.timestamps
    end
  end
end
