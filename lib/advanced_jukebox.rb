#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

# my_songs = {
# "Go Go GO" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/01.mp3',
# "LiberTeens" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/02.mp3',
# "Hamburg" =>  '< path to this directory >/jukebox-cli/audio/Emerald-Park/03.mp3',
# "Guiding Light" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/04.mp3',
# "Wolf" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/05.mp3',
# "Blue" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/06.mp3',
# "Graduation Failed" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/07.mp3'
# }

def help
  #this method should be the same as in jukebox.rb
  ["I accept the following commands:",
  "- help : displays this help message",
  "- list : displays a list of songs you can play",
  "- play : lets you choose a song to play",
  "- exit : exits this program"].each {|command| puts command}
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  my_songs.keys.each {|song| puts song}
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name or number:"
  res = gets.chomp
  if my_songs.keys.include?(res)
    path = my_songs[res].delete("< path to this directory >").prepend("/home/markbello/jukebox-cli-web-121117")
    command = "open #{path}"
    puts command
    system "open #{path}"
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  #this method is the same as in jukebox.rb
  puts "Goodbye"
end

def run(my_songs)
  #this method is the same as in jukebox.rb
  running = true
  while running
    help
    puts "Please enter a command:"
    res = gets.chomp
    case res
      when "help"
        help
      when "list"
        list(my_songs)
      when "play"
        play(my_songs)
      when "exit"
        running = false
    end
  end
  exit_jukebox
end
