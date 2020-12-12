
#puts and prints statements
#user inputs

class EpisodeIndex::CLI

 
  def run
    greeting
    list_episode
    menu
    bye
  end

  def greeting
    puts "Good morning, Vietam!"
    EpisodeIndex::API.new.titles
  end

  def menu
   list_episode
  end


  def list_episode
    EpisodeIndex::Episode.all.each.with_index(1) do |data, i|
      puts "#{i}. #{data.name}"
    end
  end

  def bye
    puts "Catch you on the flippity flip!"
    exit
  end


end