creds = Chef::EncryptedDataBagItem.load("heavyforward", "credential123")

user = creds["username"]
passwd = creds["password"]

execute "Enable heavyforwarder" do
        command "/opt/splunk/bin/splunk enable app SplunkForwarder -auth #{user}:#{passwd}"
end

execute "Add forwarder" do
        command "/opt/splunk/bin/splunk add forward-server 172.31.2.33:9997 -auth #{user}:#{passwd}"
end

