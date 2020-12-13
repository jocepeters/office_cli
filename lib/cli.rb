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
     input = gets.strip.to_i
    

     print_details(input)

     puts ""
     puts "Is there another episode you would like details on? Y/N"

     input = gets.strip
     if input == "Y"
      run
     elsif input == "N"
      puts "See you on the flippity flip!"
      exit
     else
      puts "That's not a valid command. Let's start over"

     episode = EpisodeIndex::Episode.find(input_to_i)
     end
  end

  def print_details(episode)
    puts "here ae some details"
    puts EpisodeIndex::API.new.titles(titles.to_i)
    puts EpisodeIndex::API.new.description(episode.to_i)
  end


  def bye
    if input != "exit"
    puts "Catch you on the flippity flip!"
    exit
  end

end
end
