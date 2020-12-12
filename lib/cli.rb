
#puts and prints statements
#user inputs

class EpisodeIndex::CLI

  def run
    greeting
    list_episodes
    goodbye
  end

  def greeting
    puts "Good morning, Vietnam!"
  end

  def list_episodes
    EpisodeIndex::Episode.all.each.with_index(1) do |episode, i|
      puts "#{i}. #{episode.name}"
      binding.pry
    end
  end

  def goodbye
    puts "Catch you on the flippity flip!"
    exit
  end


end