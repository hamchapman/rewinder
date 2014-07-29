require 'git'

def heloo
  puts "****************************************************************"
  puts `pwd`

  Dir.chdir("./")

  g = Git.open('./')
  `SKIP_HOOKUP=1 git checkout master`
  # g.checkout(g.branch('master'))
  g.branch('rewinder').checkout

  g.log(3).to_a.reverse.each_with_index do |l, i|
    g.checkout(l.sha)
    puts l.sha
    `rake db:reset RAILS_ENV=production`
    `rake db:migrate RAILS_ENV=production`
    system "rails server &"
    sleep 8
    `phantomjs ~/Desktop/rasterize.js 'http://localhost:3000/' ~/.rewinder/homescreen#{(i+1).to_s.rjust(6, '0')}.png`
    puts "Killing"
    puts system 'kill -9 `cat tmp/pids/server.pid`'
    puts "Hard resetting"
    g.reset_hard(l)
  end

  g.checkout(g.branch('master'))
  g.branch('rewinder').delete


  `ffmpeg -f image2 -r 0.5 -i ~/.rewinder/homescreen%06d.png -s 1440x900 -vcodec libx264 -pix_fmt yuv420p ./rewinder.mp4`
end


  # brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools

  # https://github.com/schacon/ruby-git