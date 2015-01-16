# Editors

# Vim

package "vim"
package "exuberant-ctags"
package "tmux"

git "#{node["will_dev"]["home_path"]}/.vim" do
  repository node["will_dev"]["vimconfig_repo_url"]
  action :checkout
  user node["will_dev"]["username"]
  group node["will_dev"]["username"]
end

file "#{node["will_dev"]["home_path"]}/.vimrc" do
  user node["will_dev"]["username"]
  group node["will_dev"]["username"]
  content <<EOS
source ~/.vim/common-vimrc.vim
EOS
end

cookbook_file "#{node["will_dev"]["home_path"]}/.dircolors" do
  source ".dircolors"
  owner node["will_dev"]["username"]
  group node["will_dev"]["username"]
  mode 00744
end

# nerd tree
git "#{node["will_dev"]["home_path"]}/.vim/bundle" do
  repository "https://github.com/scrooloose/nerdtree.git"
  action :checkout
  user node["will_dev"]["username"]
  group node["will_dev"]["username"]
end
