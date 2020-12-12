class EpisodeIndex::Episode
   # attr_accessor :title, :description, :writer, :writer_role
   @@all = []
   
   def initialize(episode_hash)
      episode_hash.each do |key, value|
         self.class.attr_accessor key.title
         self.send("#{key}=", value)
      end
      @@all << self
   end

   def self.all
      @@all
   end

end