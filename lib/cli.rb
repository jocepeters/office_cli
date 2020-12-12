
#puts and prints statements
#user inputs

class EpisodeIndex::CLI

 
  def run
    greeting
    menu
  end

  def greeting
    puts "Hello"
    EpisodeIndex::API.new.titles
  end

  def menu
    list_episode
  end


  def list_episode
    EpisodeIndex::Episode.all.each.with_index(1) do |title, i|
      puts "#{i}. #{title.name}"
    end
  end

  def goodbye
    puts "Catch you on the flippity flip!"
    exit
  end


end