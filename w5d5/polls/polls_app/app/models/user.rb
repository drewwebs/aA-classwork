class User < ApplicationRecord 
    validates :username, presence: true, uniqueness: true
    
    has_many :authored_polls,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Poll  

    has_many :reponses 
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :Response

end