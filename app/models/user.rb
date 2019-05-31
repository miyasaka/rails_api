class User < ApplicationRecord
  #has_many :music_libraries, dependent: :destroy
  has_many :music_libraries
  accepts_nested_attributes_for :music_libraries, allow_destroy: true
end
