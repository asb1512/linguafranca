class AddGitHubProfilePicToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :github_profile_pic, :string
  end
end
