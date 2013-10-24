provision()
{
	echo '----------------------------'
	echo "Conditional Command >" $1
	echo "Install Command     >" $2
	echo '----------------------------'
	eval $1
	OUT=$?
	if [ $OUT -ne "0" ]; then
	  eval $2
	  eval $1
	  OUT=$?
	  if [ $OUT -ne "0" ] && [$1 -ne 'flse']; then
	    echo "CHEFOO>>> $1 failed"
	    exit -1
	  fi
	fi
}
 
provision 'flse' 'sudo apt-get update'
provision 'vim --version' 'sudo apt-get install vim -y'
provision 'git --version' 'sudo apt-get install git -y'
provision 'chef-solo -v' 'curl -L https://www.opscode.com/chef/install.sh | bash'
provision 'rbenv version' 'git clone "git://github.com/sstephenson/rbenv.git" ~/.rbenv
&& export PATH="$HOME/.rbenv/bin:$PATH"
&& eval "$(rbenv init -)"
&& mkdir ~/.rbenv/plugins
&& git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
&& sudo apt-get install libreadline-dev libssl-dev zlib1g-dev'
provision 'cat ~/.bashrc  | grep ".rbenv/bin"' 'echo "export PATH=\"\$HOME/.rbenv/bin:\$PATH\"" >> ~/.bashrc'
provision 'cat ~/.bashrc  | grep "rbenv init -"' 'echo '"'"'eval "$(rbenv init -)"'"'"' >> ~/.bashrc'
provision 'rbenv versions | grep "2.0.0"' 'rbenv install "2.0.0-p247"
&& rbenv global 2.0.0-p247'
provision 'rake --version' 'gem install rake'
provision 'ls ~/.vim/janus/' 'curl -Lo- https://bit.ly/janus-bootstrap | bash'
