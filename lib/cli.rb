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
     puts "Type the episode number you want more information on.".cyan
    

#ask for user input
#validate userinput with a conditional

     print_details(gets.strip)

     puts "Is there another episode you would like details on? Y/N".cyan

     input = gets.strip
     if input == "Y"
        list_episode
        list_menu
     elsif input == "y"
        list_episode
        list_menu
     elsif input == "N"
      bye
    elsif input == "n"
      bye
    else
      puts "Are you trying to hurt my feelings? Because If so you are succeeding.".red
      list_menu
      
    end
  end

  def print_details(episode)
    episode = episode.to_i - 1
    puts "here are some details \n\n"
    puts 'ID: ' + EpisodeIndex::Episode.all[episode]._id
    puts 'Episode Title: ' + EpisodeIndex::Episode.all[episode].title
    puts 'Episode Description: ' + EpisodeIndex::Episode.all[episode].description
    puts 'Writer ID: ' + EpisodeIndex::Episode.all[episode].writer['_id']
    puts 'Writer Name: ' + EpisodeIndex::Episode.all[episode].writer['name']
    puts 'Writer Role: ' + EpisodeIndex::Episode.all[episode].writer['role']
    puts 'Director Director ID: ' + EpisodeIndex::Episode.all[episode].director['_id']
    puts 'Director Name: ' + EpisodeIndex::Episode.all[episode].director['name']
    puts 'Director Role: ' + EpisodeIndex::Episode.all[episode].director['role']
    puts 'Air Date: ' + EpisodeIndex::Episode.all[episode].airDate
    puts "\n"

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
