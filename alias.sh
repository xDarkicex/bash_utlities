#!/bin/bash -i
alias webhome='cd ~/Desktop/webdesign && ls'
alias railshome='cd ~/Desktop/webdesign/rails-apps/ && ls'
alias Home='cd ~ && ls'
alias bashrc='nano ~/.bashrc'
alias root='sudo su'
alias dbm='rake db:migrate'
alias Desktop='cd ~/Desktop && ls'
alias abc='echo a b c d e f g h i j k l m n o p q r s t u v w x y z'
alias bashprofile='nano ~/.bash_profile'
alias up='cd .. && ls'
alias which='type -all'
alias lynx='/Applications/Lynxlet.app/Contents/Resources/lynx/bin/lynx'
alias irc="irssi"
# MacOS log
alias msg='tail -f /var/log/system.log'
alias fuck='eval $(thefuck $(fc -ln -1))'
#java alias

alias javahome='cd ~/Desktop/java/ && ls'
alias javaclass='cd ~/Desktop/java/JAVA-CLASS/ && ls'

# goLang alias

alias gohome='cd ~/Desktop/goworkspace/src/github.com/xDarkicex/ && ls'

# PostgreSQL controlling
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias  pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# MongoDB
alias mongostart='mongod run'

# Redis
alias redisstart='redis-server /usr/local/etc/redis.conf'
