#!/usr/bin/ruby

begin
  %x[sudo -u rohdef git config --global user.email 'rohdef@rohdef.dk']
  %x[sudo -u rohdef git config --global user.name 'Rohde Fischer']
  %x[sudo -u rohdef git config --global core.editor emacs]
end
