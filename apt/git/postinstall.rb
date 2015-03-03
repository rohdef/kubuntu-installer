#!/usr/bin/ruby

begin
  %x[git config --global user.email 'rohdef@rohdef.dk']
  %x[git config --global user.name 'Rohde Fischer']
  %x[git config --global core.editor emacs]
end
