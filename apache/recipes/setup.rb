package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  action :create
  source 'index.html.erb'
  notifies :restart, 'service[httpd]', :immediately
end

remote_file '/var/www/html/picture.jpg' do
  source 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.thesprucepets.com%2Fcute-teacup-dog-breeds-4587847&psig=AOvVaw0sy8Tla4gZHkx5n4oOSx9K&ust=1646216142038000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMjm45TXpPYCFQAAAAAdAAAAABAD'
end

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#end

service 'httpd' do
  action [ :enable, :start ]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
