class Recipe < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  # include PgSearch::Model

  # pg_search_scope :search_anywhere,
  # against: [:name, :ingredients],
  # using: { 
  #   tsearch: { prefix: true, dictionary: "english" }, # allows partial matches like "chick" for "chicken"
  #   trigram: { threshold: 0.1 } # only can go up to 3 characters and anything smaller will not work
  # },
  # ignoring: :accents
end
