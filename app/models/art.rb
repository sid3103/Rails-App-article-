class Art < ApplicationRecord
	 has_many :resumes
	validates :title, presence: true,
                    length: { minimum: 5 }
end
