# Cookbook Name:: deploy
# Recipe:: default

package 'nginx'
package 'vim'
package 'git'

bash "install janus: Distribution of plug-ins and mappings for Vim" do
	code <<-EOH
	 curl -Lo- https://bit.ly/janus-bootstrap | bash
	 EOH
end