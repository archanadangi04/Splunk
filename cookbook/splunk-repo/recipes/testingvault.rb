chef_gem 'chef-vault' do
  compile_time true if respond_to?(:compile_time)
end
#
require 'chef-vault'

creds = ChefVault::Item.load("splunk", "test")
user = creds["username"]
passwd = creds["password"]

execute "Enable heavyforwarder" do
        command "/opt/splunk/bin/splunk enable app SplunkForwarder -auth #{user}:#{passwd}"
end

execute "Add forwarder" do
        command "/opt/splunk/bin/splunk add forward-server 172.31.2.33:9997 -auth #{user}:#{passwd}"
end
