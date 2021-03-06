require 'json'
require 'net/http'
require 'open-uri'
require 'appscript'  # use`gem install rb-appscript` to install appscript

http_url = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-cn"

`mkdir -p $HOME/Pictures/wallpapers`
home = `echo $HOME`.strip
begin
	pic_hash = JSON.parse(Net::HTTP.get(URI(http_url)))
	url = pic_hash["images"][0]["url"]
	name = url.split('/').last
	pic_file = "#{home}/Pictures/wallpapers/#{name}" 
	# to fix issue that url may not be valid
	unless url.start_with? 'http://'
		url = "http://cn.bing.com/" + url
	end
	File.open pic_file, 'wb' do |client|
		open url, 'rb' do | remote|
			client.write remote.read
			Appscript.app("System Events").desktops.picture.set pic_file
			puts "set wallpaper successfully!"
		end
	end
rescue Exception => e
	puts "#{e}"
end
