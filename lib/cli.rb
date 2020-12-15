#puts and prints statements
#user inputs

class EpisodeIndex::CLI

  def run
    puts "Hello, friend!".cyan
    puts "Here are some episodes from 'The Office'".cyan
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
     input = gets.strip
    

     print_details(input)

     puts "Is there another episode you would like details on? Y/N"

     input = gets.strip
     if input == "Y"
      run
     elsif input == "N"
      bye

    else
      puts "Are you trying to hurt my feelings? Because If so you are succeeding.".red
      list_menu
      
    end
  end

  def print_details(episode)
    puts "WHat else you got!?".cyan
    puts EpisodeIndex::Episode.find
  end


  def bye
    puts "Ok then, catch you on the flippity flip!".cyan
    exit
  end

end
