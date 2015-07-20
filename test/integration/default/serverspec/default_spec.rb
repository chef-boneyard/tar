require 'spec_helper'

describe 'tar_test::default' do

  it 'actually has the tar bin available' do
    expect(package 'tar').to be_installed
  end

  it 'sets up the test dir structure' do
    expect(file '/tmp/src_dir').to be_directory
    expect(file '/tmp/dest_dir_simple').to be_directory
    expect(file '/tmp/dest_dir_stripped').to be_directory
  end

  it 'drops in some dummy tar files for testing' do
    expect(file '/tmp/src_dir/simple.tar.gz').to be_file
    expect(file '/tmp/src_dir/stripped.tar.gz').to be_file
  end

  it 'tests the output of the tar_extract command' do
    expect(file '/tmp/dest_dir_stripped/foo.null').to_not be_file
    expect(file '/tmp/dest_dir_stripped/dir_to_strip').to_not be_directory

    expect(file '/tmp/dest_dir_stripped/directory').to be_directory
    expect(file '/tmp/dest_dir_stripped/directory/foo').to be_directory
    expect(file '/tmp/dest_dir_stripped/directory/foo/bar.null').to be_file
  end

end
