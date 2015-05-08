# MacDailyWallpapers
## get wallpapers from bing.com home page

* Clone this project with `git`
* `git submodule init && git submodule update`
* `rb-appscript` lib will be used for apply the settings to mac os. So you must install the lib first with the following commands. 
```
cd rb-appscript && ruby extconf.rb && make && make install
```
* use `crontab -e` to edit the cron config file, add the following code, it will fetch the new picture from bing.com every day 12:00
```
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
0 12 * * * ruby /Users/mingwan/bin/daily_wallpapers.rb > /tmp/crontabxx.log
```