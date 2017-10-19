describe 'tar recipe' do
  it 'installs tar' do
    command('tar --help') do
      its('exit_status') { should eq 0 }
    end
  end
end

describe 'resource tar_package' do
  it 'creates a source directory to extract to if one doesn\'t exist.' do
    directory('/usr/local/src') do
      it { should exist }
    end
  end

  it 'downloads the archive file to the source directory.' do
    file('/usr/local/src/nano-2.8.7.tar.gz') do
      it { should exist }
    end
  end

  it 'extracts the contents of the archive file.' do
    directory('/usr/local/src/nano-2.8.7') do
      it { should exist }
    end
  end

  it 'compiles and install the executable.' do
    file('/usr/local/bin/nano') do
      it { should exist }
    end
  end
end

describe 'resource tar_extract' do
  it 'creates a target directory to extract to if one doesn\'t exist.' do
    directory('/usr/local/nano_tar_extract') do
      it { should exist }
    end
  end

  it 'extracts the contents of the archive file.' do
    file('/usr/local/nano_tar_extract/Makefile.am') do
      it { should exist }
    end
  end
end
