namespace :db do
  desc "更新序號"
  task :update_post_serial => :environment do
    puts "-------------------"
    puts "updating serial"
    puts "-------------------"
    Post.where(serial: nil).each do |post|
      post.update(serial: serial_generator(10))
      print '.'
    end
    puts "done"
  end


  private
  def serial_generator(n)
    [*'A'..'Z',*'a'..'z',*0..9].sample(n).join
  end
end

