#! /usr/bin/env ruby

###
# https://github.com/djberg96/sys-proctable
# gem install sys-proctable --platform darwin  # OS X
#
require 'sys/proctable'
include Sys

PROGNAME=File.basename($PROGRAM_NAME)

if Process.euid != 0
    abort "#{PROGNAME}: must be root to execute (pid: #{Process.euid})"
end

# Process.daemon()

FILE = "/tmp/#{PROGNAME}.%05d" % [rand(99999)]
$PROGRAM_NAME = "#{PROGNAME}: to exit touch #{FILE}"   
at_exit{ File.unlink(FILE) if File.exist?(FILE) }

File.unlink(FILE) if File.exist?(FILE)
re = Regexp.new('Netskope', Regexp::IGNORECASE)
begin
    ProcTable.ps().select do |p|
        Process.kill("KILL", p.pid) if re.match(p.exe)
    end
    sleep(1)
end until File.exists?(FILE)
exit

#require 'daemons'
#Daemons.daemonize
