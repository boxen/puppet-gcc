require 'spec_helper'

describe 'gcc' do
  let(:facts) { default_test_facts.merge(:macosx_productversion_major => 10.9) }

  it do
    should contain_homebrew__tap('homebrew/versions').
      with_ensure('present')

    should contain_package('boxen/brews/gcc5').with({
      :ensure => '5.1.0',
      :require => 'Homebrew::Tap[homebrew/versions]'
    })

    should contain_package('boxen/brews/apple-gcc42').with({
      :ensure => 'absent'
    })

    should contain_package('boxen/brews/gcc48').with({
      :ensure => 'absent'
    })
  end
end
