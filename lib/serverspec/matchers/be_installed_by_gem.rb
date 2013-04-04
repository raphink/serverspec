RSpec::Matchers.define :be_installed_by_gem do
  match do |name|
    # This is a case that is border-line for refctoring
    cmd = "sudo #{commands.check_installed_by_gem(name)}" if not RSpec.configuration.ssh.options[:user] == 'root'
    ssh_exec!(cmd)
    res = ret[:exit_code] == 0
    if res && @version
      res = false if not ret[:stdout].match(/\(#{@version}\)/)
    end
    res
  end
  chain :with_version do |version|
    @version = version
  end
end
