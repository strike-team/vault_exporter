{
  prometheusAlerts+:: {
    groups+: [{
      name: 'vault-exporter',
      rules: [
        {
          alert: 'VaultUp',
          expr: |||
            vault_up{%(vaultExporterSelector)s} != 1
          ||| % $._config,
          'for': '5m',
          labels: {
            severity: 'critical',
          },
          annotations: {
            message: "Vault exporter for '{{ $labels.instance }}' cannot talk to Vault.",
          },
        },
        {
          alert: 'VaultUninitialized',
          expr: |||
            vault_initialized{%(vaultExporterSelector)s} != 1
          ||| % $._config,
          'for': '5m',
          labels: {
            severity: 'critical',
          },
          annotations: {
            message: "Vault '{{ $labels.instance }}' is uninitialized.",
          },
        },
        {
          alert: 'VaultSealed',
          expr: |||
            vault_sealed{%(vaultExporterSelector)s} != 0
          ||| % $._config,
          'for': '5m',
          labels: {
            severity: 'critical',
          },
          annotations: {
            message: "Vault '{{ $labels.instance }}' is sealed.",
          },
        },
        {
          alert: 'VaultStandby',
          expr: |||
            count(vault_standby{%(vaultExporterSelector)s} == 0) != 1
          ||| % $._config,
          'for': '5m',
          labels: {
            severity: 'critical',
          },
          annotations: {
            message: 'There are {{ $value }} active Vault instance(s).',
          },
        },
      ],
    }],
  },
}
