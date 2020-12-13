
#puts and prints statements
#user inputs

class EpisodeIndex::CLI

 
  def run
    puts "Hello, friend!"
    puts "Here are some episodes from 'The Office'"
    EpisodeIndex::API.new.titles
    list_episode
    list_menu
  end


  def list_episode
    EpisodeIndex::Episode.all.each.with_index(1) do |episode, i|
      puts "#{i}. #{episode.title}"
    end
    puts ""
  end

  def list_menu
     puts "Type the episode number you want more information on."
     puts "To quit, type 'exit'."
     input = gets.strip

     if input.to_i.between?(1, Episode.title.count)
      list_details(Episode.all[input.to_i])
      list_menu
     elsif input == "list"
      list_episode
      list_menu
     elsif input == "exit"
     else
      invalid
      list_menu
     end
  end
end

  def list_details(episode)
  end

  def invalid
    puts "Invalid command - please select a valid command."
    list_episode
  end


  def bye
    if input != "exit"
    puts "Catch you on the flippity flip!"
    exit
  end


end