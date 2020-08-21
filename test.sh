eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
ssh git@github.com

cd /www/wwwroot/store1.jerrywang.top/store

find store -type d -exec mkdir -p /www/wwwroot/cdn.jerrywang.top/storage/\{\} \;

for i in `find store -iname "*.deb" -type f  -size -20000k`
do
di=${i%/*}
cp $i /www/wwwroot/cdn.jerrywang.top/storage/$di -u
done


cd /www/wwwroot/cdn.jerrywang.top/

#git init
#git remote add origin git@github.com:Jerrywang959/appmirror.git
git pull origin
git add .
git commit -m "auto push"
git push --set-upstream origin master

