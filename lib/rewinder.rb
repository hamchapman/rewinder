module Rewinder
  def self.root
    change_dir_to_root_or_repo
    puts Dir.pwd
  end

  def change_dir_to_root_or_repo!
    debug 'Walking up dir tree'
    loop do
      cur = File.expand_path('.')
      nxt = File.expand_path('..', cur)
      if File.directory?(File.expand_path('.git')) || nxt == cur
        return # found root or git dir
      end
      Dir.chdir(nxt)
    end
  end
end