class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :validatable

has_many :books, dependent: :destroy
has_many :post_comments, dependent: :destroy
has_many :favorites, dependent: :destroy
attachment :profile_image

acts_as_followable # フォロワー機能
acts_as_follower   # フォロー機能


validates :name, presence: true
validates :name, length: { in: 2..20}
validates :introduction, length: { maximum: 50 }



end
