class EpisodeIndex::Episode  # <<-- namespacing

   @@all = []
   
   def initialize(title_hash)
      title_hash.each do |key, value|
         self.class.attr_accessor key.to_s  #.to_s coverts to string
         self.send("#{key}=", value)   
            end
      @@all << self
   end


   def self.all
      @@all
   end

   # create a class method called "find_by_title" that takes in an arguement of the title that we're trying to find and returns the episode object if found or nil if there are not episodes
  def self.find_by_title(title)
   all.each do |episode|
      if episode.title == title
         return episode
      end
   end
   nil
   

  end

  def self.find_all_episodes_by_director_name(director)
   all.each do |episode|
      if episode.director == director
         return episode
      end
   end
   []
# create a class method called "find_all_episodes_by_director_name" that receoved the arguemnt of the director name and returns all the episodes by that director. If no episodes are found, then it returns an empty array.
end
end

