include_recipe 'tar'

# setup our testing dir structure
%w(src_dir dest_dir_simple dest_dir_stripped).each do |test|
  directory "/tmp/#{test}" do
    recursive true
  end
end

# drop in some dummy tar files
%w(simple stripped).each do |dummy_tar|
  cookbook_file "/tmp/src_dir/#{dummy_tar}.tar.gz" do
    source "#{dummy_tar}.tar.gz"
  end
end

# TO-DO: basic use of tar_package requires config & make & make install support
#tar_package 'file:///tmp/src_dir/simple.tar.gz' do
#  prefix '/tmp/dest_dir_simple'
#  creates '/tmp/dest_dir_simple/foo'
#end

# basic use of tar_extract
tar_extract 'file:///tmp/src_dir/stripped.tar.gz' do
  target_dir '/tmp/dest_dir_stripped'
  creates '/tmp/dest_dir_stripped/directory/foo'
  tar_flags [ '-P', '--strip-components 2' ]
end

# TO-DO: test encryption
