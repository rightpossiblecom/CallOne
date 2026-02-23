import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../core/services/app_view_model.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Streak History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<AppViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildContent(context, viewModel, colorScheme);
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AppViewModel viewModel,
    ColorScheme colorScheme,
  ) {
    return SafeArea(
      child: Column(
        children: [
          // Streaks Header
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 24.0,
            ),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.outlineVariant.withOpacity(0.5),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStreakStat(
                  'Current Streak',
                  '${viewModel.currentStreak}',
                  colorScheme.primary,
                  colorScheme,
                ),
                Container(
                  width: 1,
                  height: 60,
                  color: colorScheme.outlineVariant,
                ),
                _buildStreakStat(
                  'Longest Streak',
                  '${viewModel.longestStreak}',
                  colorScheme.secondary,
                  colorScheme,
                ),
              ],
            ),
          ),

          // History List
          Expanded(
            child: viewModel.weeklyHistory.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          size: 64,
                          color: colorScheme.outlineVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No calls completed yet',
                          style: TextStyle(
                            fontSize: 18,
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Start your streak today!',
                          style: TextStyle(color: colorScheme.outline),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: viewModel.weeklyHistory.length,
                    itemBuilder: (context, index) {
                      final item = viewModel.weeklyHistory[index];
                      final dateStr = item['date'] as String;
                      final date = DateTime.parse(dateStr);
                      final formattedDate = DateFormat(
                        'MMM d, yyyy',
                      ).format(date);
                      final contact = item['contact'] as String? ?? 'Unknown';

                      return Card(
                        elevation: 0,
                        margin: const EdgeInsets.only(bottom: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: colorScheme.outlineVariant.withOpacity(0.3),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          leading: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                          title: Text(
                            'Called $contact',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            formattedDate,
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          trailing: Text(
                            'Completed',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStreakStat(
    String label,
    String value,
    Color color,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
