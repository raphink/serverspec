RSpec::Matchers.define :get_stdout do |expected|
  match do |command|
    # This is a case that is border-line for refctoring
    cmd = "sudo #{command}" if not RSpec.configuration.ssh.options[:user] == 'root'
    ret = ssh_exec!(cmd)
    ret[:stdout] =~ /#{expected}/
  end
end
