#
# Cookbook:: samba
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
%W{ samba samba-common }.each do |pkg|
  package "#{pkg}" do
    action [ :upgrade ]
  end
end

service "smb" do
  action [ :enable, :start ]
  supports :status => true, :restart => true, :reload => true
end

service "nmb" do
  action [ :enable, :start ]
  supports :status => true, :restart => true, :reload => true
end


# Sambaユーザーの作成
user "13na" do
  comment "13na"
  shell '/bin/false'
  password "hogehoge"
  manage_home false
  action [:create, :manage]
end

# Sambaサーバーアクセス用ユーザに設定
# pdbedit は -t を指定すると標準入力からパスワードを読み込む
# パスワードは改行区切りで2回出力する
execute 'pdbedit_script' do
  command 'echo -e "hogehoge\nhogehoge" | pdbedit -a -t -u 13na'
end

# 共有ディレクトリ作成
directory '/home/share' do
    not_if "ls /home/share"
    owner 'nobody'
    group 'nobody'
    mode '0777'
    action :create
end

# smb.conf作成
template "smb.conf" do
  path "/etc/samba/smb.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[smb]'
end
