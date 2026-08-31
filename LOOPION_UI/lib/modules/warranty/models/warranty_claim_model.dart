class WarrantyClaimModel {
  const WarrantyClaimModel({
    required this.claimId,
    required this.status,
    required this.problem,
  });

  final String claimId;
  final String status;
  final String problem;
}
