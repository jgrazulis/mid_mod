class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_youngest_to_oldest
    actors.order(age: :asc)
  end

  def avg_actor_age
    actors.average(:age)
  end
end