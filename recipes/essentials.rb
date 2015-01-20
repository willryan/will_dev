package "git"
package "libfontconfig1"
package "libicu52"

# working directory
git "#{node["will_dev"]["home_path"]}/.wd" do
  repository "git@github.com:karlin/working-directory.git"
  action :checkout
  user node["will_dev"]["username"]
  group node["will_dev"]["username"]
end

execute "install.sh" do
  cwd "#{node["will_dev"]["home_path"]}/.wd"
  user node["will_dev"]["username"]
end
