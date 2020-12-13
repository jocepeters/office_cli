class EpisodeIndex::Episode
   attr_accessor :name

   @@all = []
   
   def initialize(title_hash, name=nil)
      title_hash.each do |key, value|
         self.class.attr_accessor key.to_s
         self.send("#{key}=", value)
         @name = name
      end
      
      @@all << self
   end

   def self.all
      @@all
   end

end
