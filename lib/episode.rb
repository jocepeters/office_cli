class EpisodeIndex::Episode

   @@all = []
   
   def initialize(title_hash)
      title_hash.each do |key, value|
         self.class.attr_accessor key.to_s
         self.send("#{key}=", value)
      end
      @@all << self
   end

   def self.all
      @@all
   end

end
