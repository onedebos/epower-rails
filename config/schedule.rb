# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#

set :environment, "development"
set :output, 'log/whenever.log'
every 1.minute do
  runner "User.debit_users"
end

every 1.day do
    runner "User.credit_users"
end

every 1.minute do
    command "echo 'you can use raw cron syntax too'"
end
# Learn more: http://github.com/javan/whenever
