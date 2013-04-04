RSpec::Matchers.define :be_running do
  match do |process|
    # This is a case that is border-line for refctoring
    cmd = "sudo #{commands.check_running(process)}" if not RSpec.configuration.ssh.options[:user] == 'root'
    ssh_exec!(cmd)
    if ret[:exit_code] == 1 || ret[:stdout] =~ /stopped/
      do_check(commands.check_process(process))
    end
    ret[:exit_code] == 0
  end
end
