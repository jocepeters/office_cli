class EpisodeIndex::Episode

   @@all = []
   
   def initialize(title_hash)
      title_hash.each do |key, value|
         self.class.attr_accessor key.to_s
         self.send("#{key}=", value)   
            end
    
      @@all << self
   end

   def inspect
      string = "Episode, details: "
      string << self.attributes.map { |a| "#{a}: #{send(a)}"
      string
   end



   def self.all
      @@all
   end

   def self.find
      self.all
   end

end

