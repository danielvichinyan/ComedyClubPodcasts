class RemovePodcastIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :podcast_id, :integer
  end
end
