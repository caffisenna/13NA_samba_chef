# Overview

Every Chef Infra installation needs a Chef Repository. This is the place where cookbooks, policyfiles, config files and other artifacts for managing systems with Chef Infra will live. We strongly recommend storing this repository in a version control system such as Git and treating it like source code.

# Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
- `data_bags/` - Store data bags and items in .json in the repository.
- `roles/` - Store roles in .rb or .json in the repository.
- `environments/` - Store environments in .rb or .json in the repository.

# Configuration

The config file, `.chef/config.rb` is a repository-specific configuration file for the knife command line tool. If you're using the Hosted Chef platform, you can download one for your organization from the management console. You can also generate a new config.rb by running `knife configure`. For more information about configuring Knife, see the Knife documentation at https://docs.chef.io/knife.html

# Next Steps

Read the README file in each of the subdirectories for more information about what goes in those directories.

# 環境
こんな環境で作りました

- ProductName:	Mac OS X
- ProductVersion:	10.13.6
- BuildVersion:	17G11023
- ruby -v (macportsで入れたrbenvで管理)
`ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-darwin17]`
- chef -v
 - ChefDK version: 4.7.73
 - Chef Infra Client version: 15.7.32
 - Chef InSpec version: 4.18.51
 - Test Kitchen version: 2.3.4
 - Foodcritic version: 16.2.0
 - Cookstyle version: 5.20.0
- knife-zero

# 使い方
1.  repoをcloneする
2. 対象サーバーにsshでログイン、またパスワードなしでsudoしておけるようにする
3. repo内で `knife zero bootstrap {対象サーバーIP} -U {sshユーザー名}` を叩く (nodeリストに自動追加される)
4. `knife node run_list add {対象サーバーFQDN} samba` でレシピをnodeに追加
5. `knife zero converge {対象サーバーFQDN} -U {sshユーザー名}` で収束させる

## カスタマイズ
`cookbooks/samba/recipes/default.rb`
にsambaユーザーとかパスワードがあるので適宜修正する