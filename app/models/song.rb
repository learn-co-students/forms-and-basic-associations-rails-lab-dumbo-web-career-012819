class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
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
    notes.each do |note|
      if note != nil 
        self.notes.build(content: note)
      end
    end 
  end

  def note_contents
    songs_with_notes = []
  	if self.notes
       songs_with_notes = self.notes.select do |note|
          note.content != "" && note.content != nil
       end
    else
      nil
    end
    songs_with_notes.map do |note|
      note.content
    end
  end

  def note_ids=(note)
     note.each do |content|
       note = Note.find_or_create_by(content: content)
       self.notes << note
     end
   end

end
