awk '/cron/ || /CRON/ && !/sudo/ && !/SUDO/' /var/log/syslog | awk 'NF<13' >> /home/lutfiy/nomor5/syslog5.log
