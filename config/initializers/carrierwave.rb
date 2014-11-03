require 'carrierwave'
require 'a9s_swift'

BUCKET_NAME = "images"

if Rails.env.production?
  begin
    Anynines::Swift::Utility.configure_carrierwave(BUCKET_NAME,{fog_public: false}, "openstack")
  rescue SSHKit::Runner::ExecuteError => e
    puts "Couldn't connect to SWIFT: #{e.inspect}"
  end
end
