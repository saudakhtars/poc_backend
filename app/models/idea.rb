class Idea < ActiveRecord::Base
  mount_uploader :banner, BannerUploader
end