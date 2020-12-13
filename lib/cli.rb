
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
    input = ""

    while input != "exit"
    puts "Type episode number you want more information on."
    puts "To quit, type 'exit'."
    input = gets.strip

    if input.to_i.between?(1, Episode.all.count)
    else
      puts "That's not a valid entry, please type a valid episode number."  
      list_episode
    end
  end
end



  def bye
    puts "Catch you on the flippity flip!"
    exit
  end


end