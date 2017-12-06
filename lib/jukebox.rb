require "pry"

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  ["I accept the following commands:",
  "- help : displays this help message",
  "- list : displays a list of songs you can play",
  "- play : lets you choose a song to play",
  "- exit : exits this program"].each {|command| puts command}
end

def play(songs)
  puts "Please enter a song name or number:"
  res = gets.chomp
  binding.pry
  if res.to_i <= songs.count && res.to_i > 0
    i = res.to_i - 1
    song = songs[i]
    puts "Playing #{song}"
  elsif songs.include?(res)
    song = res
    puts "Playing #{song}"
  else
    puts "Invalid input, please try again"
  end
end

def list(songs)
  songs.each {|song| puts song}
end
