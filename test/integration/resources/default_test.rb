describe command('tar --help') do
  its('exit_status') { should eq 0 }
end
