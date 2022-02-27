#!/usr/bin/env ruby

# Simple password generator. Not much use in windows but good for Linux
# where you can use dmenu.

require 'optparse'

# Keyboard symbols.
NORMAL_SYMBOLS = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
EXTRA_SYMBOLS = '@#?$[]{}/!;.\'\\'.chars
# Password length.
pass_len = 16

# Array used to actually generate the password.
pass_ar = NORMAL_SYMBOLS

OptionParser.new do |opt|
  opt.on('-n', '--number [NUM]', Integer, 'Password length.') { |o| pass_len = o }
  opt.on('-e', '--extra', 'Include extra symbols') { pass_ar += EXTRA_SYMBOLS }
end.parse!

# Password string.
password = ''

# Generate.
for i in (1..pass_len - 1) do
  password += pass_ar.sample
end

# Print.
puts password
