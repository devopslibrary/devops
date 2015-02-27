node 'default' {
  package { "sublimetext3" :
        ensure => "latest",
        provider => 'chocolatey'
  }
  package { "wireshark" :
        ensure => "latest",
        provider => 'chocolatey'
  }
  package { "git" :
        ensure => "latest",
        provider => 'chocolatey'
  }
  package { "winmerge" :
        ensure => "latest",
        provider => 'chocolatey'
  }
}