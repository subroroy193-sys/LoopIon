class FeatureContext {
  const FeatureContext({this.enabledFeatures = const <String>[]});

  final List<String> enabledFeatures;

  FeatureContext copyWith({List<String>? enabledFeatures}) {
    return FeatureContext(
      enabledFeatures: enabledFeatures ?? this.enabledFeatures,
    );
  }
}
