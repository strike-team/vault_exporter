{
  _config+:: {
    // Selectors are inserted between {} in Prometheus queries.

    // Select the metrics coming from the vault exporter.
    vaultExporterSelector: 'job="vault"',

    grafana_prefix: '',
  },
}
