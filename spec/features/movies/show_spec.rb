require 'rails_helper'

RSpec.describe 'movie show page' do
  before(:each) do
    @universal = Studio.create!(name: "Universal Pictures", location: "Universal City, CA")
    @warner = Studio.create!(name: "Warner Bros", location: "Hollywood, CA")

    @jurassic2 = @universal.movies.create!(title: "Jurassic World", creation_year: 2015, genre: "Action")
    @harry = @warner.movies.create!(title: "Harry Potter and the Sorcerer's Stone", creation_year: 2001, genre: "Fantasy")

    @chris = @jurassic2.actors.create!(name: "Chris Pratt", age: 45)
    @bryce = @jurassic2.actors.create!(name: "Bryce Dallas Howard", age: 40)
    @judy = @jurassic2.actors.create!(name: "Judy Greer", age: 50)

    @emma = @harry.actors.create!(name: "Emma Watson", age: 25)

    visit "/movies/#{@jurassic2.id}"
  end

  it 'shows movie attributes' do
    expect(page).to have_content(@jurassic2.title)
    expect(page).to have_content(@jurassic2.creation_year)
    expect(page).to have_content(@jurassic2.genre)
    expect(page).to_not have_content(@harry.title)
  end

  it 'lists actors from youngest to oldest' do
    expect(@bryce.name).to appear_before(@chris.name)
    expect(@chris.name).to appear_before(@judy.name)
    expect(page).to_not have_content(@emma.name)
  end

  it 'shows avg age of actors' do
    expect(page).to have_content("Average Actor Age: 45")
  end

  it 'includes link to add an actor to a movie' do
    expect(page).to have_content("Add Actor to Movie")
    fill_in('Name', with: 'Vincent DOnofrio')
    fill_in('Age', with: 50)
    click_on 'Add Actor'
    expect(current_path).to eq("/movies/#{@jurassic2.id}")
    expect(page).to have_content('Vincent DOnofrio')
  end
end