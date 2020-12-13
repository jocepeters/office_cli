
#puts and prints statements
#user inputs

class EpisodeIndex::CLI

 
  def run
    puts "Hello, Office friends!"
    EpisodeIndex::API.new.titles
    list_episode
    list_menu
  end


  def list_episode
    EpisodeIndex::Episode.all.each.with_index(1) do |episode, i|
      puts "#{i}. #{episode.name}"
    end
    puts ""
  end

  def list_menu
    puts "Type episode number you want more information on, or 'exit'."
    
  end

  def bye
    puts "Catch you on the flippity flip!"
    exit
  end


end