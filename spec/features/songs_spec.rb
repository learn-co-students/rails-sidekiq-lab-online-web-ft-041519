describe "songs", type:  :feature do

  before do
    Artist.destroy_all
    Song.destroy_all
    @artist = Artist.create!(name: "Daft Punk")
    @song = @artist.songs.create!(title: "The Grid")
  end

  describe "/songs/:id" do

    it "links to the artist" do
      visit song_path(@song)
      expect(page).to have_link("Daft Punk", href: artist_path(@artist))
    end

    it "links to edit when no artist" do
      song = Song.create(title: "Policy of Truth")
      visit song_path(song)
      expect(page).to have_link("Add Artist", href: edit_song_path(song))
    end
  end
end
