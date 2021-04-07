class AddGithubToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :github, :boolean, default: false
  end
end
