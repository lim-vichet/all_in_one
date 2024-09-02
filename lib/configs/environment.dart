enum Environment { dev, production, staging }

extension EnvironmentExtension on Environment {
  String value() {
    switch (this) {
      case Environment.production:
        return 'lib/configs/prod_config.json';
      case Environment.staging:
        return 'lib/configs/staging_config.json';
      default:
        return 'lib/configs/dev_config.json';
    }
  }
}
