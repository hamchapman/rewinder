require 'git'

Dir.chdir("/Users/Hami/Documents/Ruby/journal_bits")

g = Git.open('~/Documents/Ruby/journal_bits')
g.checkout(g.branch('master'))
g.branch('rootlapser').checkout

g.log(3).to_a.reverse.each_with_index do |l, i|
  g.checkout(l.sha)
  puts l.sha
  `rake db:reset RAILS_ENV=production`
  `rake db:migrate RAILS_ENV=production`
  system "rails server &"
  sleep 8
  `phantomjs ~/Desktop/rasterize.js 'http://localhost:3000/' ~/Desktop/homescreen#{(i+1).to_s.rjust(6, '0')}.png`
  puts "Killing"
  puts system 'kill -9 `cat tmp/pids/server.pid`'
  puts "Hard resetting"
  g.reset_hard(l)
end

g.checkout(g.branch('master'))
g.branch('rootlapser').delete


`ffmpeg -f image2 -r 0.5 -i /Users/Hami/Desktop/homescreen%06d.png -s 1440x900 -b:v 1M -vcodec libx264 -pix_fmt yuv420p /Users/Hami/Desktop/rootlapse.mp4`



# brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools

# https://github.com/schacon/ruby-git
