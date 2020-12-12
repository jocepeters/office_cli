
#puts and prints statements
#user inputs

class EpisodeIndex::CLI

  def run
    greeting
    menu
    goodbye
  end

  def greeting
    puts "Good morning, Vietnam!"
    EpisodeIndex::API.new.get_episode_title
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