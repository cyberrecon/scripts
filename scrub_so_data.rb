!/usr/bin/env ruby 

# Preparation

# cronjob every hour - move and compress log files
#
# every morning - stop the service
#
#
# run this script from cron

%x(service nsm stop)

#
# query the database and save results to a file
#
use securityonion_db;
select INET_NTOA(src_ip), src_port, INET_NTOA(dst_ip), dst_port, signature, timestamp from event where event.status=0 into outfile '/tmp/out/events.20140131.txt';
# 
# purge all open events from database ( they are stored in flat file )
# 
update event set status=1, last_modified='2014-01-15 09:01', last_uid='sguil'  where event.status=0;

exit
#
# parse the file and split it based on signature
#
awk '{print $5,$6}' events.20140130.txt | sort | uniq 
ruby -na -e 'puts "#{$F[4]} #{$F[5]}"' events.20140130.txt | sort | uniq > r2

- go through each type of signature file 
-- determine if an incident has occured
--- if an incident take appropriate ations to contain, eradicate, and recover from the incident



