# Make memcached exporter version available as a fact

Facter.add(:memcached_exporter) do
  confine { Facter.value(:kernel) != 'windows' }
  confine { Facter.value(:operatingsystem) != 'nexus' }
  setcode do
    if Facter::Util::Resolution.which('memcached-exporter')
      Facter::Core::Execution.exec('memcached-exporter -version 2>&1').match(/^memcached_exporter\, version (\d+.\d+.\d+).*$/)[1]
    end
  end
end
