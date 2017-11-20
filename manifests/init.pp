# Public: Install gcc via homebrew
#
# Examples
#
#   include gcc
class gcc {

  case $::operatingsystem {
    'Darwin': {
      include homebrew

      ensure_resource('homebrew::tap',
        'homebrew/versions', { 'ensure' => 'present' })

      homebrew::formula { 'gcc7': }

      package { 'boxen/brews/gcc7':
        ensure  => '7.2.0',
        require => Homebrew::Tap['homebrew/versions']
      }

      package { ['boxen/brews/apple-gcc42', 'boxen/brews/gcc48']:
        ensure => 'absent'
      }
    }

    default: {
      package { 'gcc': }
    }
  }

}
