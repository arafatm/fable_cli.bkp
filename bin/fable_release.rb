#!/usr/bin/env ruby

require 'rubygems'
require 'optparse'
require 'pp'
require 'httparty'
require 'shellwords'

class Fable
  include HTTParty
  base_uri 'localhost:4567'
end

options = {}

optparse = OptionParser.new do |opts|
  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end

  options[:create] = ""
  opts.on('-c', '--create DESCRIPTION', 'Create a new release with DESCRIPTION') do |d|
    options[:create] = d
    pp options
    release = Fable.post("/release", {:body => {:description => options[:create]}})
    
    p release
    puts release['id']
    exit
  end
end

optparse.parse!
