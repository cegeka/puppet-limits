#!/usr/bin/env rspec

require 'spec_helper'

describe 'limits' do
  #it { should contain_class 'limits' }

  it 'should remove /etc/security/limits.d' do
    should contain_file('/etc/security/limits.d').with({
      'ensure' => 'absent',
    })
  end

end
