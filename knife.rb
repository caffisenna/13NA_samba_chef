local_mode true
chef_repo_path   File.expand_path('../' , __FILE__)

knife[:ssh_attribute] = "knife_zero.host"
knife[:use_sudo] = true

## SSH$B%(!<%8%'%s%H$r;H$C$F$J$$$J$i!"(BSSH$B%m%0%$%sMQ$N80$X$N%U%!%$%k%Q%9$r;XDj$7$^$7$g$&!#(B
# knife[:identity_file] = "~/.ssh/id_rsa"

## Node$B$N3F<oB0@-(B(attributes)$B$O%m!<%+%k$K(BJSON$B%U%!%$%k$H$7$FJ]B8$5$l$F$$$-$^$9!#(B
## automatic_attribute_whitelist $B%*%W%7%g%s$O!"(BNode$B$+$i<}=8$7$?(BAttribute$B$N$&$A!"J]B8$9$kBP>]$r9J$k$3$H$,$G$-$^$9!#(B
## Node$B$b(BGit$B$G4IM}$9$k>l9g$O!"8=>u$K0MB8$9$k%G%#%9%/;HMQNL$J$I$OL5;k$7$F$h$$$G$7$g$&!#(B
knife[:automatic_attribute_whitelist] = %w[
  fqdn
  os
  os_version
  hostname
  ipaddress
  roles
  recipes
  ipaddress
  platform
  platform_version
  cloud
  cloud_v2
  chef_packages
]
