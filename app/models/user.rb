class User < ApplicationRecord
  has_many :podcasts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username, :email, :password, :password_confirmation

end
