# fish-completions-pass-extensions
# Copyright (C) 2025  Michael Serajnik  https://github.com/mserajnik
# Copyright (C) 2024  Milan Oberkirch  https://github.com/zvyn

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# FIXME: Because of how pass completions are written, we need to source the
# original completions here, which is not ideal.
# Instead, pass should delegate completions for extension subcommands to the
# respective extension scripts.
# See https://github.com/tadfisher/pass-otp/pull/151#discussion_r790174706

set -l found_completions false

# Figure out where the pass completions are located.
for path in /opt/homebrew/share/fish/vendor_completions.d/pass.fish \
            /usr/share/fish/vendor_completions.d/pass.fish \
            /usr/local/share/fish/vendor_completions.d/pass.fish \
            /opt/local/share/fish/vendor_completions.d/pass.fish \
            ~/.local/share/fish/vendor_completions.d/pass.fish
  if test -f $path
    source $path
    set found_completions true
    break
  end
end

function __fish_pass_extension_ln_available
  pass ln 2>&1 | string match -q "Usage: pass ln*"
end

function __fish_pass_extension_otp_available
  pass otp 2>&1 | string match -q "Usage: pass otp*"
end

if test $found_completions = true; and __fish_pass_extension_ln_available
  complete -c pass -f -n '__fish_pass_needs_command' -a ln -d 'Command: create symbolic links'

  # pass ln pass-name link-name
  complete -c pass -f -n '__fish_pass_uses_command ln; and test (count (commandline -opc)) -eq 2' -a "(__fish_pass_print_entries)"
end

# The completions for the main `pass otp` command originally come from
# https://github.com/tadfisher/pass-otp/pull/191 and were expanded upon.
if test $found_completions = true; and __fish_pass_extension_otp_available
  complete -c pass -f -n '__fish_pass_needs_command' -a otp -d 'Command: generate and manage OTP codes'

  # pass otp [code] [--clip,-c] pass-name
  complete -c pass -f -n '__fish_pass_uses_command otp; and not __fish_seen_subcommand_from code insert append uri validate' -a code -d 'Generate an OTP code'
  complete -c pass -f -n '__fish_pass_uses_command otp; and not __fish_seen_subcommand_from insert append uri validate' -s c -l clip -d 'Copy OTP code to clipboard'
  complete -c pass -f -n '__fish_pass_uses_command otp; and not __fish_seen_subcommand_from insert append uri validate; and not string match -q -- "-*" (commandline -ct); and test (count (string match -v -- "-*" (commandline -opc)[3..])) -eq 0' -a "(__fish_pass_print_entries)"
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from code' -s c -l clip -d 'Copy OTP code to clipboard'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from code; and not string match -q -- "-*" (commandline -ct); and test (count (string match -v -- "-*" (commandline -opc)[4..])) -eq 0' -a "(__fish_pass_print_entries)"

  # pass otp insert [--force,-f] [--echo,-e] [pass-name]
  complete -c pass -f -n '__fish_pass_uses_command otp; and not __fish_seen_subcommand_from code insert append uri validate' -a insert -d 'Insert a new OTP key URI'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from insert' -s f -l force -d 'Overwrite existing password without prompting'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from insert' -s e -l echo -d 'Echo the input'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from insert; and not string match -q -- "-*" (commandline -ct); and test (count (string match -v -- "-*" (commandline -opc)[4..])) -eq 0' -a "(__fish_pass_print_entries)"

  # pass otp append [--force,-f] [--echo,-e] pass-name
  complete -c pass -f -n '__fish_pass_uses_command otp; and not __fish_seen_subcommand_from code insert append uri validate' -a append -d 'Append an OTP key URI to existing password'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from append' -s f -l force -d 'Overwrite existing URI without prompting'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from append' -s e -l echo -d 'Echo the input'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from append; and not string match -q -- "-*" (commandline -ct); and test (count (string match -v -- "-*" (commandline -opc)[4..])) -eq 0' -a "(__fish_pass_print_entries)"

  # pass otp uri [--clip,-c] [--qrcode,-q] pass-name
  complete -c pass -f -n '__fish_pass_uses_command otp; and not __fish_seen_subcommand_from code insert append uri validate' -a uri -d 'Display the key URI'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from uri' -s c -l clip -d 'Copy URI to clipboard'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from uri' -s q -l qrcode -d 'Display QR code'
  complete -c pass -f -n '__fish_pass_uses_command otp; and __fish_seen_subcommand_from uri; and not string match -q -- "-*" (commandline -ct); and test (count (string match -v -- "-*" (commandline -opc)[4..])) -eq 0' -a "(__fish_pass_print_entries)"

  # pass otp validate uri
  complete -c pass -f -n '__fish_pass_uses_command otp; and not __fish_seen_subcommand_from code insert append uri validate' -a validate -d 'Test if URI is valid OTP key URI'
end
