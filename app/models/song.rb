class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes


  def song_title=(title)
    song = Song.find_or_create_by(title: title)
    song
  end

  def song_title
    self.title ? self.title : nil
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end


  def note_contents=(notes)
    notes = notes.reject(&:empty?)
    notes.each do |content|
      self.notes.build(content: content)
    end

  end

  def note_contents
    notes = self.notes.map(&:content)
  end




end
