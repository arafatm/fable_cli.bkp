#!/usr/bin/env ruby
require 'optparse'
require 'pp'

# This hash will hold all of the options
# parsed from the command-line by
# OptionParser.
options = {}

optparse = OptionParser.new do|opts|
  # TODO: Put command-line options here

  # This displays the help screen, all programs are
  # assumed to have this option.
  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end
  options[:simple] = ""
  opts.on( '-s', '--simple [OPT]', "Simple argument" ) do|s|
    options[:simple] = s
    pp "-- :simple"
    pp options
    exit
  end
  options[:mand] = ""
  opts.on( '-m', '--mandatory FILE', "Mandatory argument" ) do|f|
    options[:mand] = f
    pp "-- :mand"
    pp options
  end
end

# Parse the command-line. Remember there are two forms
# of the parse method. The 'parse' method simply parses
# ARGV, while the 'parse!' method parses ARGV and removes
# any options found there, as well as any parameters for
# the options. What's left is the list of files to resize.
optparse.parse!

pp "Options:", options
pp "ARGV:", ARGV
