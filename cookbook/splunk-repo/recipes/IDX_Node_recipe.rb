credentials = search(:haeavyforward, "id:credentials").first
user = credentials["username"]
passwd = credentials["password"]

execute "Enable IDX  Peer Node" do
        command "/opt/splunk/bin/splunk edit cluster-config -mode slave master_uri 34.250.33.58:8089 -auth #{user}:#{passwd} -remoteUsername #{user} -remotePassword #{passwd}"
end
