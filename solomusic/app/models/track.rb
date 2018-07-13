class Track < ApplicationRecord
  validates :album_id, :title, :ord, :regular, presence: true
  
  belongs_to :album,
    foreign_key: :album_id,
    class_name: :Album
end
