require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe 'instance methods' do
    describe '#actors_youngest_to_oldest' do

      before(:each) do
        @universal = Studio.create!(name: "Universal Pictures", location: "Universal City, CA")
        @jurassic2 = @universal.movies.create!(title: "Jurassic World", creation_year: 2015, genre: "Action")

        @chris = @jurassic2.actors.create!(name: "Chris Pratt", age: 45)
        @bryce = @jurassic2.actors.create!(name: "Bryce Dallas Howard", age: 40)
        @judy = @jurassic2.actors.create!(name: "Judy Greer", age: 50)
      end 

      it 'lists actors by youngest to oldest' do
        expect(@jurassic2.actors_youngest_to_oldest).to eq([@bryce, @chris, @judy])
      end
    end 
      
   describe '#avg_actor_age' do
      before(:each) do
        @universal = Studio.create!(name: "Universal Pictures", location: "Universal City, CA")
        @jurassic2 = @universal.movies.create!(title: "Jurassic World", creation_year: 2015, genre: "Action")

        @chris = @jurassic2.actors.create!(name: "Chris Pratt", age: 45)
        @bryce = @jurassic2.actors.create!(name: "Bryce Dallas Howard", age: 40)
        @judy = @jurassic2.actors.create!(name: "Judy Greer", age: 50)
      end 
      
      it 'gives avg age of all actors in a movie' do
        expect(@jurassic2.avg_actor_age).to eq(45)
      end 
    end
  end 
end 