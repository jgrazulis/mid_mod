require 'rails_helper'

RSpec.describe 'studio index' do

  before(:each) do
    @universal = Studio.create!(name: "Universal Pictures", location: "Universal City, CA")
    @warner = Studio.create!(name: "Warner Bros", location: "Hollywood, CA")
    @paramount = Studio.create!(name: "Paramount Pictures", location: "Los Angeles, CA")

    @jurassic = @universal.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action")
    @jurassic2 = @universal.movies.create!(title: "Jurassic World", creation_year: 2015, genre: "Action")
    @harry = @warner.movies.create!(title: "Harry Potter and the Sorcerer's Stone", creation_year: 2001, genre: "Fantasy")
    @harry2 = @warner.movies.create!(title: "Harry Potter and the Chamber of Secrets", creation_year: 2002, genre: "Fantasy")
    @shrek = @paramount.movies.create!(title: "Shrek", creation_year: 2001, genre: "Comedy")
    @shrek2 = @paramount.movies.create!(title: "Shrek 2", creation_year: 2004, genre: "Comedy")

    visit "/studios"
  end

  it 'shows every studio name and location' do
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@universal.location)
    expect(page).to have_content(@warner.name)
    expect(page).to have_content(@warner.location)
    expect(page).to have_content(@paramount.name)
    expect(page).to have_content(@paramount.location)
    save_and_open_page
  end

  it 'shows titles of all studio movies' do
    expect(page).to have_content(@jurassic.title)
    expect(page).to have_content(@jurassic2.title)
    expect(page).to have_content(@harry.title)
    expect(page).to have_content(@harry2.title)
    expect(page).to have_content(@shrek.title)
    expect(page).to have_content(@shrek2.title)
  end
end