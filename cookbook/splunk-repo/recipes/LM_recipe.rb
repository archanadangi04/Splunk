execute "Configure License Master" do
        command "/opt/splunk/bin/splunk add licenses /opt/splunk/etc/licenses/enterprise/enterprise.lic"
end

execute "List Licenses" do
        command "/opt/splunk/bin/splunk list licenses >> /tmp/splunk-license-log"
end

