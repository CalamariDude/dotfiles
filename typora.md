

```
fswatch -ro ~/Documents/notes/ | xargs -n1 -I{} ~/.config/scripts/notes_upload.sh > /var/log/notes_upload.log 2>&1 &
```



notes upload:

```
 cd ~/Documents/notes ;

diff="$(git diff)"



if [ -n "$diff" ]; then

​	echo "running"

​	git add .

​	git commit -m "$(date)"

​	git push origin master

fi
```





### on mac

`crontab -e`

inside, put:

`@reboot /Users/jzeineddine/.config/scripts/typora.sh`

his 112
