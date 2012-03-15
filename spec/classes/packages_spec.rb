require 'spec_helper'

describe 'limits::packages' do
  
  it 'should contain the required packages for augeas' do
    should contain_package('augeas').with_ensure('present')
    should contain_package('augeas-libs').with_ensure('present')
    should contain_package('ruby-augeas').with_ensure('present')
  end

end
