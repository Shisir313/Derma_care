import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';

/// Welcome card showing greeting and date
class WelcomeCard extends StatelessWidget {
  const WelcomeCard({required this.userName, super.key});

  final String userName;

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[now.month - 1]} ${now.day}, ${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.medium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getGreeting(),
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            userName,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                _getFormattedDate(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
