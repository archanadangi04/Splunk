#credentials = search(:haeavyforward, "id:credentials").first

chef_gem 'chef-vault' do
  compile_time true if respond_to?(:compile_time)
end
#
require 'chef-vault'

creds = ChefVault::Item.load("HF_Master", "HF_Vault")
user = creds["username"]
passwd = creds["password"]

execute "Enable heavyforwarder" do
        command "/opt/splunk/bin/splunk enable app SplunkForwarder -auth #{user}:#{passwd}"
end

PvtIP = search(:IDX_Server, "id:IDX_Pvt_IP").first
IP = PvtIP["ip_preffix"]
Hostname = PvtIP["hostname"]
execute "Add forwarder" do
        command "/opt/splunk/bin/splunk add forward-server #{Hostname}:9997 -auth #{user}:#{passwd}"
end
