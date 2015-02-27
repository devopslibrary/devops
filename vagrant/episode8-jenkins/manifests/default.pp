node 'default' {
  package { "jdk8" :
        ensure => "latest",
        provider => 'chocolatey'
  }
  package { "dotnet3.5" :
        ensure => "latest",
        provider => 'chocolatey'
  }
}