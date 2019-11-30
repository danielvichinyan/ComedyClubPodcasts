class AddPodcastToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :podcast, foreign_key: true
  end
end
