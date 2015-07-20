require 'spec_helper'

describe 'tar_test::default' do
  context 'When all attributes are default on CentOS 6 it' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.6')
      runner.converge(described_recipe)
    end

    it 'actually has the tar bin available' do
      expect(chef_run).to include_recipe('tar::default')
      expect(chef_run).to install_package('tar')
    end

    it 'sets up the test dir structure' do
      expect(chef_run).to create_directory('/tmp/src_dir')
      expect(chef_run).to create_directory('/tmp/dest_dir_simple')
      expect(chef_run).to create_directory('/tmp/dest_dir_stripped')
    end

    it 'drops in some dummy tar files for testing' do
      expect(chef_run).to create_cookbook_file('/tmp/src_dir/simple.tar.gz')
      expect(chef_run).to create_cookbook_file('/tmp/src_dir/stripped.tar.gz')
    end

    it 'tests the tar_extract command' do
      expect(chef_run).to extract_tar_extract('file:///tmp/src_dir/stripped.tar.gz')
    end

 end
end
