package 'tree' do
    action :install
end

package 'ntp' do
    action :install
end

service 'ntpd' do
    action [ :enable, :start ]
end

package 'git' do
    action :install
end

template '/etc/motd' do
    variables(
      :name => 'sambandham'
    )
    source 'setup.erb'
    action :create
    owner 'root'
    group 'root'
end
