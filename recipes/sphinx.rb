include_recipe 'pkg-build::deps'

node[:pkg_build][:sphinx][:build_dependencies].each do |d_pkg|
  package d_pkg
end

sphinx_name = "sphinx-#{node[:pkg_build][:sphinx][:version]}"

builder_remote sphinx_name do
  remote_file "http://sphinxsearch.com/files/sphinx-#{node[:pkg_build][:sphinx][:version]}-release.tar.gz"
  suffix_cwd "#{sphinx_name}-release"
  commands [
    './configure --prefix=/usr/local',
    'make',
    'make install DISTDIR=$PKG_DIR'
  ]
  # creates 
end

fpm_tng_package 'sphinxsearch' do
  output_type 'deb'
  description 'Sphinx search'
  depends %w(libc6 libexpat1 libgcc1 libmysqlclient18 libpq5 libstdc++6 libstemmer0d zlib1g)
  version node[:pkg_build][:sphinx][:version]
  chdir File.join(node[:builder][:packaging_dir], sphinx_name)
  reprepro node[:pkg_build][:reprepro]
end
