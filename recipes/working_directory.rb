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