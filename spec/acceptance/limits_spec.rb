require 'spec_helper_acceptance'

describe 'limits::init' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        include limits

        limits::conf { 'test-soft-nofile': domain => 'test', type => 'soft', item => 'nofile', value => '8192' }
        limits::conf { 'test-hard-nofile': domain => 'test', type => 'hard', item => 'nofile', value => '8192' }
        limits::conf { 'test-soft-nproc': domain  => 'test', type => 'soft', item => 'nproc', value  => '2048' }
        limits::conf { 'test-hard-nproc': domain  => 'test', type => 'hard', item => 'nproc', value  => '2048' }

      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file '/etc/security/limits.conf' do
      it { is_expected.to be_file }
      its(:content) { should match /test soft nofile 8192/ }
      its(:content) { should match /test hard nofile 8192/ }
      its(:content) { should match /test soft nproc 2048/ }
      its(:content) { should match /test hard nproc 2048/ }
    end
  end
end
