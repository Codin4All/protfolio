part of '../project_details_screen.dart';

class _WriteReviewDialog extends StatefulWidget {
  const _WriteReviewDialog();

  @override
  State<_WriteReviewDialog> createState() => _WriteReviewDialogState();
}

class _WriteReviewDialogState extends State<_WriteReviewDialog> {
  final _nameController = TextEditingController();
  final _commentController = TextEditingController();
  int _rating = 5;

  @override
  void dispose() {
    _nameController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final comment = _commentController.text.trim();
    if (name.isEmpty || comment.isEmpty) return;
    Navigator.of(context).pop(
      _ProjectReview(name: name, comment: comment, rating: _rating),
    );
  }

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColors.border),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Write a Review',
                        style: TextStyle(
                            color: AppColors.text,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded),
                      color: AppColors.muted,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Your rating',
                    style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 11,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    for (var star = 1; star <= 5; star++)
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(
                            width: 34, height: 34),
                        onPressed: () => setState(() => _rating = star),
                        icon: Icon(
                          Icons.star_rounded,
                          color: star <= _rating
                              ? const Color(0xFFFFC247)
                              : const Color(0xFF41445A),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                _ReviewTextField(
                  controller: _nameController,
                  label: 'Your name',
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                _ReviewTextField(
                  controller: _commentController,
                  label: 'Share your evaluation',
                  maxLines: 4,
                ),
                const SizedBox(height: 17),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _submit,
                    child: const Text('Submit Review'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _ReviewTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;

  const _ReviewTextField({
    required this.controller,
    required this.label,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: AppColors.text, fontSize: 12),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: AppColors.muted, fontSize: 11),
          filled: true,
          fillColor: AppColors.bg.withValues(alpha: 0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.accent),
          ),
        ),
      );
}
