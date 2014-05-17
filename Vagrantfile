Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :forwarded_port, host: 9080, guest: 8080
  config.vm.network :forwarded_port, host: 9081, guest: 8081
  config.vm.synced_folder("dockers", "/dockers")
  config.vm.synced_folder("apps", "/apps")

  config.vm.provision "docker" do |d|
    d.build_image "/dockers/openresty", args: "-t oignon/openresty"
    d.build_image "/dockers/lapis", args: "-t oignon/lapis"
    d.run "oignon/lapis", args: "-p 8080:8080 -v /apps/hello:/app -w /app",
                          cmd: "/bin/bash -c 'moonc -w *.moon & lapis server'"
  end
end
