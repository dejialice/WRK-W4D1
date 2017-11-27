# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :artists, 
    class_name: 'User', 
    foreign_key: :artist_id
  
  has_many :viewers,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id
    
  has_many :shared_artworks,
    through: :viewers,
    source: :artwork
  
end 
