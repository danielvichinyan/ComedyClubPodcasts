class AddAttachmentBannerVideoAudioToPodcasts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :podcasts do |t|
      t.attachment :banner
      t.attachment :video
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :podcasts, :banner
    remove_attachment :podcasts, :video
    remove_attachment :podcasts, :audio
  end
end
