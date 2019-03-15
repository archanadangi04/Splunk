#credentials = search(:haeavyforward, "id:credentials").first

creds = ChefVault::Item.load("IDX_Master", "IDX_Vault")
passwd = creds["password"]

execute "Enable Indexer Master" do
        command "/opt/splunk/bin/splunk edit cluster-config -mode master -replication_factor 3 -search_factor 2 -secret #{passwd} -cluster_label cluster1"
end

