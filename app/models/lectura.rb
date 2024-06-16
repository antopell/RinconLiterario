class Lectura < ApplicationRecord

    validates :username, presence: true
    validates :book_id, presence: true, uniqueness: true
    validates :book_title, presence: true
    validates :book_img, presence: true
    validates :lecture_state, presence: true
    validates :reading_start_date, presence: false
    validates :reading_end_date, presence: false

end
