control 'tar' do
  impact 1.0
  title 'should be installed.'
  describe command('tar --help') do
    its('exit_status') { should eq 0 }
  end
end

control 'tar_package' do
  impact 1.0
  title 'should download remote file, extract, compile and install.'

  describe directory('/usr/local/src') do
    it { should exist }
  end

  describe file('/usr/local/src/nano-2.8.7.tar.gz') do
    it { should exist }
  end

  describe directory('/usr/local/src/nano-2.8.7') do
    it { should exist }
  end

  describe file('/usr/local/bin/nano') do
    it { should exist }
  end
end

control 'tar_extract' do
  impact 1.0
  title 'should extract specified file.'

  describe directory('/usr/local/nano_tar_extract') do
    it { should exist }
  end

  describe file('/usr/local/nano_tar_extract/Makefile.am') do
    it { should exist }
  end
end
