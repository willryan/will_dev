# will_dev
Dev environment settings I use

Include this repo via git in a Berksfile in a directory for "personal" cookbooks.
In your dev env, add "my-cookbooks" to .gitignore.
> cp cook.sh project_dev_env/my-cookbooks
> ./vendor_my_cookbooks.sh
Now you can go to /vagrant/my-cookbooks on the VM and run
> ./cook.sh

