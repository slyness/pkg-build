default[:pkg_build][:builder] = false
default[:pkg_build][:pkg_prefix] = 'hw'
default[:pkg_build][:use_pkg_build_ruby] = false
default[:pkg_build][:common_repo_env] = false
default[:pkg_build][:gems][:exec] = node[:languages][:ruby][:gem_bin]
default[:pkg_build][:gems][:dir] = node[:languages][:ruby][:gems_dir]
default[:pkg_build][:ruby_bin] = node[:languages][:ruby][:ruby_bin]
default[:pkg_build][:rake_bin] = 'rake'
default[:pkg_build][:ruby_bin_dir] = node[:languages][:ruby][:bin_dir]
default[:pkg_build][:reprepro] = true
default[:pkg_build][:repository] = nil
default[:pkg_build][:isolate] = false
default[:pkg_build][:isolated_containers][:ubuntu_1204][:template] = 'ubuntu'
default[:pkg_build][:isolated_containers][:ubuntu_1204][:template_opts] = {'--release' => 'precise'}
default[:pkg_build][:isolate_solo_dir] = '/tmp/pkg-build-solo'
