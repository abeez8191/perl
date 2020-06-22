describe command('perl -v') do
  its('exit_status') { should eq 0 }
end

# Verify install works
describe command("perl -MTry::Tiny -e '1;'") do
  its('exit_status') {should eq 0 }
end

# Verify uninstall works
describe command("perl -MTest::MockModule -e '1;'") do
  its('exit_status') { should be > 0 }
end

# Verify version attribute works
describe command("perl -MScalar::Util -e 'print $Scalar::Util::VERSION;' 2>/dev/null") do
  its('stdout') { should eq '1.53' }
end
