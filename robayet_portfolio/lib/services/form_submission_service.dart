import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/portfolio_data.dart';

class FormSubmissionException implements Exception {
  final String message;

  const FormSubmissionException(this.message);

  @override
  String toString() => message;
}

class FormSubmissionService {
  static final Uri _endpoint = Uri.parse('https://formsubmit.co/ajax/$email');

  static Future<void> send({
    required String fromName,
    required String fromEmail,
    required String subject,
    required String message,
  }) async {
    final response = await http
        .post(
          _endpoint,
          headers: const {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'name': fromName,
            'email': fromEmail,
            '_replyto': fromEmail,
            '_subject': subject,
            'message': message,
          }),
        )
        .timeout(const Duration(seconds: 20));

    Map<String, dynamic>? result;
    try {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        result = decoded;
      } else if (decoded is Map) {
        result = Map<String, dynamic>.from(decoded);
      }
    } on FormatException {
      // Keep the HTTP status as a fallback when the service returns plain text.
    }

    final providerMessage = result?['message']?.toString().trim();
    final errorMessage =
        providerMessage?.isNotEmpty == true ? providerMessage : null;

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw FormSubmissionException(
        errorMessage ??
            'The email service returned HTTP ${response.statusCode}. '
                'Please try again later.',
      );
    }

    if (result?['success']?.toString().toLowerCase() == 'false') {
      throw FormSubmissionException(
        errorMessage ??
            'The email service did not accept this message. '
                'Check that you confirmed its activation email, then try again.',
      );
    }
  }
}
