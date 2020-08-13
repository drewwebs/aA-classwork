# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#
class Artwork < ApplicationRecord
    validates :title, :img_url, :artist_id, presence: true
    validates :artist_id, uniqueness: true
    validates :title, uniqueness: { scope: :artist_id } 
    
    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User  

    
end
