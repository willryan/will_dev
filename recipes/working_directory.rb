git "#{node["will_dev"]["home_path"]}/.working-directory-repo" do
  repository "git@github.com:karlin/working-directory.git"
  action :checkout
  user node["will_dev"]["username"]
  group node["will_dev"]["username"]
end

execute "./install.sh" do
  cwd "#{node["will_dev"]["home_path"]}/.working-directory-repo"
  user node["will_dev"]["username"]
end

directory "#{node["will_dev"]["home_path"]}/.working-directory-repo" do
  recursive true
  action :delete
end

ruby_block "add wd to bashrc" do
  block do
    fe = Chef::Util::FileEdit.new("#{node["will_dev"]["home_path"]}/.bashrc")
    fe.insert_line_if_no_match(/WDHOME/, "export WDHOME=$HOME/.wd\nsource $WDHOME/wd.sh")
    fe.write_file
  end
end
