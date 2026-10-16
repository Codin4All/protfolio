class CertificateModel {
  final String title;
  final String issuer;
  final String year;
  final String description;
  final String category;
  final String image; // asset path to thumbnail
  final String fileUrl; // link to image/PDF; '' disables the button
  final String credentialId; // optional

  const CertificateModel({
    required this.title,
    required this.issuer,
    required this.year,
    this.description = '',
    this.category = 'Credential',
    this.image = '',
    this.fileUrl = '',
    this.credentialId = '',
  });
}
