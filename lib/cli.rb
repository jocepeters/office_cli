#puts and prints statements
#user inputs

class EpisodeIndex::CLI
attr_reader :episodes

  def run
    office_graphic
    EpisodeIndex::API.new.titles
    list_episode
    list_menu
  end



  def list_episode
    @episodes = EpisodeIndex::Episode.all
    episodes.each.with_index(1) do |episode, i|
      puts "#{i}. #{episode.title} "
    end
  end

  def list_menu
    puts "If you want information about an Episode, type the Episode number.".cyan
    input = gets.strip.to_i
    if input.between?(1, episodes.size)
      episode = episodes[input - 1]
      print_details(episode)
      second_menu
    else
      puts "Please enter a valid number.".red
      list_episode
      list_menu
    end
  end


     def second_menu
     puts "If you'd like to see the list of Episodes again, type 'Y'.".cyan
     puts "If you'd like to search for the Episode by title, type the Title".cyan
     puts "If you'd like to search for the Episode by director's name, type the director's first name".cyan
     puts "Type 'E' to exit.".cyan

     input = gets.strip
     if input == "Y"
        list_episode
        list_menu
     elsif input == "y"
          list_episode
          list_menu
     elsif input == episodes.title
      title = gets.strip
      find_episode_by_title(title)
     elsif input == "E"
      bye
    elsif input == "e"
      bye
    else
      puts "Are you trying to hurt my feelings? Because If so you are succeeding.".red
      list_menu
      end
  end

  def print_details(episode)
    puts "here are some details \n\n"
    puts 'ID: ' + episode._id
    puts 'Episode Title: ' + episode.title
    puts 'Episode Description: ' + episode.description
    puts 'Writer ID: ' + episode.writer['_id']
    puts 'Writer Name: ' + episode.writer['name']
    puts 'Writer Role: ' + episode.writer['role']
    puts 'Director Director ID: ' + episode.director['_id']
    puts 'Director Name: ' + episode.director['name']
    puts 'Director Role: ' + episode.director['role']
    puts 'Air Date: ' + episode.airDate
    puts "\n"

  end

  def find_episode_by_title(title)
    all.detect { |episode| episode.title == title }
    binding.pry
  end


  def bye
    puts "Ok then, catch you on the flippity flip!".cyan
    exit
  end

  def office_graphic
    puts "                                                                                                              
                                                                                                                                                                                                        
    :shmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmdy+`                  
` :mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNyssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssymMNo                 
``-NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMy+dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmooMMo                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm:NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+yMm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMyoMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMh+Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMMMMMMMdo//+yNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMMMMMM+`     -mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMMMMMm        sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMMMMMM/      .mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMMMMMMNy/--/smMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMNho/::::::::::/sdMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMh-               `:mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmhsydNMMMMMMMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMN`                  :MMMMMMMMMMMMMMMMMMMMMMMMMMMMy.    :mMMMMMMMd/Mm                
``sMMMMMMMMmmmmmmmmmmmMNmmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMh                   `MMMMMMMMMMMMMMMMMMMMMMMMMMMN`      +MMMMMMMd/Mm                
``sMMMMMMMm````   ````my  yMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMh   .`          .`  `MMMMMMMMMMMMMMMMMMMMMMMMMMMM.      oMMMMMMMd/Mm                
``sMMMMMMMMdddd   ddddMy  smysymMMMMNdysyhmMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMh   s-          s-  `MMMMMMMMMMMMMMMMMMMMMMMMMMMMd:```.oNMMMMMMMd/Mm                
``sMMMMMMMMMMMM   MMMMMy  ..:.  +MMh- .--``/NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMh   s-          y:  `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmhhmNMMMMMMMMd/Mm                
``sMMMMMMMMMMMM   MMMMMy  /MMM.  Mm` -dmmy  /MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMh   s-          y:  `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMd+-...:yMMMMMMd/Mm                
``sMMMMMMMMMMMM   MMMMMy  yMMM-  Mh  .------/MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMh   s-          y:  `MMMMMMMMMMMMMMMMMMMMMMMMMMMMd-so+os. sNNMMMd/Mm                
``sMMMMMMMMMMMM   MMMMMy  yMMM-  MN` :mMMdoohMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMh   s-          y:  `MMMMMMMMMMMMMMMMMMMMMMMMMMMMmy.   .d +: MMMd/Mm                
``sMMMMMMMMMMMM` `MMMMMy  yMMM:  MMm/` .` `+NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMds+   s-          y/  .MMMMMMMMMMMMMMMMMMMMMMMMMMMN/    `oo o: MMMd/Mm                
``sMMMMMMMMMMMMNNMMMMMMMNNMMMMMNNMMMMMmddmMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMM-/mhs`s-          yNyymMMMMMMMMMMMMMMMMMMMMMMMMMMy`    :h:  s: MMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMM/.. `... `     o-    yMMMMMMMMMMMMMMMMMMMMMMMMMMMMm:    `so`   y: MMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMM-              s:    yMMMMMMMMMMMMMMMMMMMMMMMmhyo:`    /s.     h: MMMd/Mm                
``sMMMMMMMMMMMMMNdyysyydNMMMMMMMMMmdddMMMMNdddNMmddmMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMM-              s:    yMMMMMMMMMMMMMMMMMNs/:.`        .h:       d: MMMd/Mm                
``sMMMMMMMMMMMy-`       `/hMMMMMh.`  .MMN:`   dM/  .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMM-              s:    yMMMMMMMMMMMMMMMMMy      `.-:/+yNm        m: MMMd/Mm                
``sMMMMMMMMMN:   :shhho-   +MMMM-  .hdMMs   yhNMyoosMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMM-              s:    yMMMyssssssssssssss/-:/+ooNNMMMNmd++////++N: MMMd/Mm                
``sMMMMMMMMM:   yMMMMMMN+   oMo/`  ./+h/-   //mMo::/MMMMms/-..-/smMMMMh+:.`.-/yNMMMMMMMMssMMM-              s:    yMMMhyyyyyy` +hhhhhhhhhs+/o+/-.```      `oM: MMMd/Mm                
``sMMMMMMMMm   /MMMMMMMMM`  `Mo/`  ./+h/-   //mM/  .MMMs`  -//.  .dMN:` `/+/-  .dMMMMMMMssMMM-              s:    yMMMMMMMMMM` yMMMMMMMMs``                .M: MMMd/Mm                
``sMMMMMMMMd   oMMMMMMMMM-   MMM.  /MMMMo   MMMM/  .MMd   +NMMN/::sM+  `hmNmm:  `NMMMMMMssMMM-              s:    yMMMMMMMMMM` yMMMMMMMm`               ``-hM: MMMd/Mm                
``sMMMMMMMMm   :MMMMMMMMN`  .MMM.  /MMMMo   MMMM/  .MMo   dMMMMMMMMM.   .....`   dMMMMMMssMMMmmmmmmmmmm:    s:    yMMMMMMMMMM` yMMMMMMM/    `//++oossyyhhhdmm- MMMd/Mm                
``sMMMMMMMMM/   sMMMMMMN/   sMMM.  /MMMMo   MMMM/  .MMs   hMMMMhyydM-  -ddddddhhhNMMMMMMssMMMMMMMMMMMMM/    s:    yMMMMMMMMMM` yMMMMMMd     sm```````````````  MMMd/Mm                
``sMMMMMMMMMN/   -oyhy+.  `oMMMM.  /MMMMo   MMMM/  .MMN.  .yddo  `yMh`  +hddy-..+MMMMMMMssMMMMMMMMMMMMM+    h+    dMMMMMMMMMM` yMMMMMM:    :Md  oyyyyyyyyyyyy- MMMd/Mm                
``sMMMMMMMMMMMh:.`     `./dMMMMM-``/MMMMs```MMMM/``.MMMm/.  `` `:hMMMd/.` `` `-oNMMMMMMMssMMMMMMMMMMMMMNs//yMNo//yMMMMMMMMMMM` yMMMMMd    `mMd  dMMMMMMMMMMMM/ MMMd/Mm                
``sMMMMMMMMMMMMMmdhyyyhdNMMMMMMMmddmMMMMNddmMMMMmddmMMMMMmdhyyhmMMMMMMMNdhyyhdNMMMMMMMMMssMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM` yMMMMM:    sMMd  dMMMMMMMMMMMM/ MMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM` yMMMMd    :MMMd  dMMMMMMMMMMMM/ MMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM` yMMMM:   `mMMMd  dMMMMMMMMMMMM/ MMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM` yMMMM:  `yMMMMd  dMMMMMMMMMMMM/ MMMd/Mm                
``sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMy+MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMssmMMMMNhymMMMMMNyyNMMMMMMMMMMMMyoMMMy+Mm                
``oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN:dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm:mMd                
``.dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNosdmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNmdsomMN:                
````omNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNdyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyhNMNh-                 
``  `:+ossssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssso/.  ".cyan
  end
end



