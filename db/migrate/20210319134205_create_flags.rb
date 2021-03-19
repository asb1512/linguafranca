class CreateFlags < ActiveRecord::Migration[6.1]
  def change
    create_table :flags do |t|
      t.string      :nationality
      t.boolean     :approved, default: false
      t.string      :wikipedia_link
      
      t.timestamps
    end
  end
end
