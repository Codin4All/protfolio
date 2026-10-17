part of '../portfolio_data.dart';

const degree = 'B.Sc. in Computer Science & Engineering';
const university = 'Bangladesh University of Business and Technology (BUBT)';
const universityLocation = 'Dhaka, Bangladesh';

class SocialLink {
  final String label;
  final String url;
  final IconData icon;
  const SocialLink(this.label, this.url, this.icon);
}

const socialLinks = [
  SocialLink('GitHub', 'https://github.com/Codin4All', Icons.code),
  SocialLink(
      'LinkedIn',
      'https://www.linkedin.com/in/robayet-ferdosh-667310299',
      Icons.work_outline),
  SocialLink(
      'Facebook', 'https://www.facebook.com/robayeth.ferdosh', Icons.facebook),
  SocialLink('Instagram', 'https://www.instagram.com/robayet_ferdous_',
      Icons.camera_alt_outlined),
];
