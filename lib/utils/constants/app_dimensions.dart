class AppDimension {
  static final AppDimension _singleton = AppDimension._internal();

  factory AppDimension() {
    return _singleton;
  }

  AppDimension._internal();

  double get smallSpace => 10;
  double get mediumSpace => 20;
  double get largeSpace => 30;
  double get bodySpace => 20;

  double get small => 8;
  double get medium => 16;
  double get large => 24;
  double get xlarge => 32;
  double get xxlarge => 48;
  double get xxxlarge => 64;
  double get xxxxlarge => 84;
}
