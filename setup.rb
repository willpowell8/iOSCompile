#!/usr/bin/env ruby

# ARG0 uname
# ARG1 password
# ARG2 team id D74S9TWW45
# ARG3 certId M7D3V2SB2G
# ARG4 bundleId
# ARG5 name
$LOAD_PATH.push File.expand_path("spaceship/lib")
require "spaceship"
begin
    username = ARGV[0]
    password = ARGV[1]
    clientId = ARGV[2]
    certificateId = ARGV[3]
    bundleId = ARGV[4]
    appName = ARGV[5]
    Spaceship.login(username, password)
    groupId = "group."+bundleId
    group = Spaceship.app_group.create!(group_id:groupId, name:"Group "+appName)
    Spaceship.client.team_id = clientId
    cert = Spaceship.certificate.find(ARGV[3])
    apps = Array.new
    apps.push([bundleId, appName, "main"])
    apps.push([bundleId+".watchkitapp", appName+" watchkitapp", "watchkit"])
    apps.push([bundleId+".watchkitapp.watchkitextension", appName+" watchkitapp extension", "watchkitext"])
    apps.push([bundleId+".Today", appName+" today", "today"])
    
    apps.each do |app| 
    	appBundleId = app[0]
    	appNameId = app[1]
    	enum = app[2]
    	app = Spaceship.app.create!(bundle_id: appBundleId, name: appNameId)
    	app.update_service(Spaceship.app_service.app_group.on)
    	app = app.associate_groups([group])
    	provisioning_app = Spaceship.provisioning_profile.in_house.create!(bundle_id: appBundleId, certificate: cert)
    	File.write(enum+".mobileprovision", provisioning_app.download)
    end

rescue StandardError => errr
	print errr
       print "Error running script: " + errr
end