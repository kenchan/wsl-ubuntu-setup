package 'rcm' do
  user 'root'
end

DOTFILES_DIR = "#{ENV['HOME']}/src/github.com/kenchan/dotfiles"

git 'kenchan/dotfiles' do
  repository 'https://github.com/kenchan/dotfiles'
  destination DOTFILES_DIR
  revision 'master'
end

execute 'run rcup' do
  command "RCRC=#{DOTFILES_DIR}/rcrc rcup -f"
  not_if 'lsrc | grep -q dotfiles'
end
