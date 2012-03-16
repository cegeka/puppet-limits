require 'spec_helper'

describe 'limits::packages' do
 
  describe 'test platform specific required packages for augeas' do
    debianish = ['debian', 'ubuntu']
    redhatish = ['centos', 'redhat', 'fedora' ]

    debianish.each do |os|
      describe "for operating system #{os}" do
        
	let(:facts) { { :operatingsystem => os } }
	it {
          should contain_package('libaugeas0').with_ensure('present')
	}
	it {
	  should contain_package('augeas-lenses').with_ensure('present')
	}
      	it {
	  should contain_package('libaugeas-ruby').with_ensure('present')
	}

      end
    end

    redhatish.each do |os|
      describe "for operating system #{os}" do
        
        let(:facts) { { :operatingsystem => os } }
	it {
          should contain_package('augeas').with_ensure('present')
	}
      	it {
	  should contain_package('augeas-libs').with_ensure('present')
	}
        it {
	  should contain_package('ruby-augeas').with_ensure('present')
	}
 
      end
    end

  end

  describe 'fail for not supported platform' do
    
   let(:facts) { { :operatingsystem => 'gentoo' } }

    it {
      expect {
        should contain_package('augeas').with_ensure('present')
      }.to raise_error(Puppet::Error, /Module limits is not supported on gentoo/)
    }

  end
    
end
