class TelematicsFrameModel {
  const TelematicsFrameModel({
    required this.timestamp,
    required this.temperature,
    required this.voltage,
    required this.current,
  });

  final DateTime timestamp;
  final double temperature;
  final double voltage;
  final double current;
}
