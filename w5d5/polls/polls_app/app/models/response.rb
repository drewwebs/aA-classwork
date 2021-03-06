class Response < ApplicationRecord
    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :response_id,
        class_name: :AnswerChoice

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end