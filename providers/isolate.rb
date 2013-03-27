action :build do

  dna_json = ::File.join(node[:pkg_build][:isolate_solo_dir], "#{rand(99999999)}-solo-dna.json")
  file dna_json do
    mode 0644
    content JSON.pretty_generate(
      Mixin::DeepMerge.merge({
          :pkg_build => {
            :reprepro => false,
            :isolate => false
          },
          :run_list => new_resource.run_list
        }, new_resource.attributes
      )
    )
  end

  lxc_ephemeral "Isolated: #{new_resource.name}" do
    command "chef-solo -j #{dna_json}"
    base_container new_resource.container
    user 'root'
    key '/opt/hw-lxc-config/id_rsa'
    stream_output true
  end
end
