###
# Install docker-engine , configure as service and configure container
include_recipe 'chef-yum-docker'

docker_service 'default' do
  action [:create, :start]
end

# docker-compose
%w(python epel-release python-pip git).each do |package|
  yum_package package do
    action :upgrade
  end
end

execute 'Install docker-compose' do
  command 'pip install docker-compose'
end

directory '/opt/stacktorm/docker' do
  recursive true
end

include_recipe 'git'

git '/opt/stacktorm/docker/st2-docker' do
  repository 'https://github.com/StackStorm/st2-docker.git'
  reference 'master'
  action :sync
end

execute 'start compose stack' do
  command 'make env && docker-compose up -d'
  cwd '/opt/stacktorm/docker/st2-docker'
  not_if 'docker ps | grep st2'
end
