user node["will_dev"]["username"] do
  home node["will_dev"]["home_path"]
  supports manage_home: true
end

directory ".ssh" do
  path "#{node["will_dev"]["home_path"]}/.ssh"
  owner node["will_dev"]["username"]
  group node["will_dev"]["username"]
end

ssh_known_hosts_entry 'github.com'
ssh_known_hosts_entry 'gitlab.atomicobject.com'
ssh_known_hosts_entry 'gitorious.atomicobject.com'

gem_package "homesick"

homesick_castle "homesick_public" do
  user 'vagrant'
  source 'git@github.com:willryan/homesick_public.git'
  action :update
end

cookbook_file "#{node["will_dev"]["home_path"]}/.local_aliases" do
  source ".local_aliases"
  owner node["will_dev"]["username"]
  group node["will_dev"]["username"]
  mode 00744
end

