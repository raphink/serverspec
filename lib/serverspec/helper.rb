require 'etc'

# Backend helpers
require 'serverspec/helper/ssh'
require 'serverspec/helper/exec'
require 'serverspec/helper/puppet'
require 'serverspec/helper/mcollective'

# Command helpers
require 'serverspec/helper/redhat'
require 'serverspec/helper/debian'
require 'serverspec/helper/gentoo'
require 'serverspec/helper/solaris'

# Obsoleted helpers
require 'serverspec/helper/obsoleted'
