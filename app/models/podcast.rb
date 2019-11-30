class Podcast < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy

  # Thumbnail upload
  has_attached_file :banner, styles: {large: "1500x500>", medium: "500x400>", thumb: "200x150"}
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/

  # MP3 upload
  has_attached_file :audio
  validates_attachment :audio, :content_type => {:content_type => ["audio/mpeg", "audio/mp3"]}, :file_type => {:matches => [/mp3\Z/]}

  # Video upload
  has_attached_file :video, :styles => { :medium => {:geometry => "640x480", :format => 'mp4'}, :thumb => {:geometry => "100x50", :format => 'jpg', :time => 10} }, :processor => [:transcoder]

  validates_attachment_content_type :video, content_type: /\Avideo\/.*\z/

  # Search podcasts
  def self.search(params)
    podcasts = Podcast.where("title LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    podcasts
  end
end
