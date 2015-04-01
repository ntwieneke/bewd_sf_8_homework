class Movie < ActiveRecord::Base
  validates :name, :year, :description, presence: true
  validates :year, numericality: {greater_than: 0}
  validates :description, length: { minimum: 10 }
	def self.search(query)
		if query
		  Movie.where('name :search',{ search: "%#{query}%"})
		else
		  Movie.all
		end
	end
end