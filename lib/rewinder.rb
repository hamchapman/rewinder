require 'git'

module Rewinder
  class Snapshotter
    def create_video
      gem_root = Gem::Specification.find_by_name("rewinder").gem_dir

      Dir.chdir("./")

      g = Git.open('./')
      g.checkout(g.branch('master'))
      g.branch('rewinder').checkout

      g.log(10).to_a.reverse.each_with_index do |l, i|
        g.checkout(l.sha)
        puts l.sha
        puts `bundle install`
        bundle = `bundle install`
        puts "bundle #{bundle}"
        `rake db:reset RAILS_ENV=production`
        `rake db:migrate RAILS_ENV=production`
        system "rails server &"
        sleep 8
        `phantomjs #{gem_root}/lib/rasterize.js 'http://localhost:3000/' ~/.rewinder/homescreen#{(i+1).to_s.rjust(6, '0')}.png`
        puts "Killing server"
        puts system 'kill -9 `cat tmp/pids/server.pid`'
        puts "Hard resetting"
        g.reset_hard(l)
      end

      g.checkout(g.branch('master'))
      g.branch('rewinder').delete

      `ffmpeg -f image2 -r 0.5 -i ~/.rewinder/homescreen%06d.png -s 1440x900 -vcodec libx264 -pix_fmt yuv420p ./rewinder.mp4`
      `rm -rf ~/.rewinder`
    end
  end
end