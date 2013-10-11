#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'nginx'

common = {:worker_processes => 4, :port => 9999, :conf => "/etc/nginx/nginx.conf"}

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

template "#{common[:conf]}" do
  source 'nginx.conf.erb'
  variables common
  notifies :reload, "service[nginx]"
end
