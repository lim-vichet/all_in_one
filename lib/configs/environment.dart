enum Environment { SIT, Prod, UAT }

extension EnvironmentExtension on Environment {
  String value() {
    switch (this) {
      case Environment.Prod:
        return 'lib/configs/prod_config.json';
      case Environment.UAT:
        return 'lib/configs/uat_config.json';
      default:
        return 'lib/configs/sit_config.json';
    }
  }
}
