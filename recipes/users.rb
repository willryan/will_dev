user node["will_dev"]["username"] do
  home node["will_dev"]["home_path"]
  supports manage_home: true
end

directory ".ssh" do
  path "#{node["will_dev"]["home_path"]}/.ssh"
  owner node["will_dev"]["username"]
  group node["will_dev"]["username"]
end

cookbook_file "/etc/ssh/known_hosts" do
  source "known_hosts"
  owner node["will_dev"]["username"]
  group node["will_dev"]["username"]
  mode 00744
end

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

ruby_block "add ps1 to bashrc" do
  block do
    fe = Chef::Util::FileEdit.new("/home/#{node["ruby"]["user"]}/.bashrc")
    fe.insert_line_if_no_match(/ps1\.sh/, "if [ -f ~/.ps1.sh ]; then\n  . ~/.ps1.sh\nfi\n")
    fe.write_file
  end
end
