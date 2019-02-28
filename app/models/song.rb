class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes


  def genre_name=(name)
  self.genre = Genre.find_by(name: name)
end

def genre_name
  self.genre ? self.genre.name : nil
end

def artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
end

def artist_name
  self.artist ? self.artist.name : nil
end

def note_contents=(notes)
  notes.each do |content|
    if content.strip != ""
      note = Note.find_or_create_by(content: content)
      self.notes << note
    end
  end
end

def note_contents
  self.notes.map { |note| note.content }
end
end
