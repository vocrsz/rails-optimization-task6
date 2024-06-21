require 'tty-command'

namespace :test do
  desc "run"
  task run: :environment do
    cmd = "rspec"
    puts "Running rspec via `#{cmd}`"
    command = TTY::Command.new(printer: :quiet, color: true)

    start = Time.now
    begin
      command.run(cmd)
    rescue TTY::Command::ExitError
      puts 'TEST FAILED SAFELY'
    end
    finish = Time.now

    puts 'SENDING METRIC TO INFLUXDB'
    WebMock.allow_net_connect!
    TestMetrics.write(user: 'vocrsz', run_time_seconds: (finish - start).to_i)
  end
end
