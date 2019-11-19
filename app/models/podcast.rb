class Podcast < ApplicationRecord
  has_attached_file :banner, styles: {large: "1500x500>", medium: "500x400>", thumb: "200x150"}
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/
end
