# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  has_one_attached :avatar, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :spot_ratings, dependent: :destroy
  has_many :user_ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :avatar, content_type: ['image/png', 'image/jpeg'], size: { between: 1.kilobyte..5.megabytes , message: 'is not given between size' }
end
