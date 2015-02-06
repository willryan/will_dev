# will_dev
Dev environment settings I use

Instructions for using a personal cookbook:
* Create a directory where you will keep your list of the names of your personal cookbooks.
* In that directory create a Berksfile which includes your personal cookbooks, presumably sourced from git.
* Run "berks install".
* Run "berks vendor [DESTINATION]" and give [DESTINATION] a directory inside the vagrant home for your current project (i.e. the folder with your Vagrantfile in it).  You can use scripts/vendor-my-berks.sh as a template, it will vendor to [argument to script]/my-cookbooks. You want this directory to be ignored by git, so make sure its name is in your project .gitignore.
* vagrant ssh into your VM.
* If you are pulling in git repos, you may have trouble getting all the correct known_hosts entries in the cookbook file that copies them over. If so, I advise doing git ls-files or similar to add the repo ips into your known_hosts.
* cd to /vagrant/my-cookbooks (or whatever directory you vendored the cookbooks to).
* Run "sudo -i" to switch to sudo.  This is usually necessary if you are installing packages
* Run chef zero on  your cookbook(s). scripts/cook.sh can be used as a template. 

