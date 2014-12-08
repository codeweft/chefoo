ssl_verify_mode :verify_peer
cookbook_path [
  '/devopscode/chefoo/berks-cookbooks',
  '/devopscode/chefoo/cookbooks'
]
environment_path "/devopscode/chefoo/environments"
role_path "/devopscode/chefoo/roles"
verbose_logging true
