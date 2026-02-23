// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/app_view_model.dart';
import '../../core/services/system_service.dart';
import '../../core/constants/app_constants.dart';
import '../about/about_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _contactController = TextEditingController();

  @override
  void dispose() {
    _contactController.dispose();
    super.dispose();
  }

  void _showAddContactDialog(BuildContext context, AppViewModel viewModel) {
    _contactController.clear();
    showDialog(
      context: context,
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return AlertDialog(
          title: const Text(
            'Add Contact',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: _contactController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'e.g. Mom, Dad, Best Friend',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final text = _contactController.text.trim();
                if (text.isNotEmpty) {
                  final newContacts = List<String>.from(viewModel.contacts);
                  // Allow max 3 if rotating is enabled, otherwise just 1
                  if (viewModel.rotatingModeEnabled) {
                    if (newContacts.length >= 3) {
                      newContacts.removeAt(0); // remove oldest
                    }
                    newContacts.add(text);
                  } else {
                    newContacts.clear();
                    newContacts.add(text);
                  }
                  viewModel.updateContacts(newContacts);
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showReminderDayDialog(BuildContext context, AppViewModel viewModel) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Reminder Day',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          contentPadding: const EdgeInsets.only(top: 16),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: days.length,
              itemBuilder: (context, index) {
                final dayNumber = index + 1;
                return RadioListTile<int>(
                  title: Text(days[index]),
                  value: dayNumber,
                  groupValue: viewModel.reminderDay,
                  activeColor: Theme.of(context)
                      .colorScheme
                      .primary, // note: leaving activeColor for now to verify if it's the exact one that threw warning, or use activeThumbColor if it's there
                  onChanged: (value) {
                    if (value != null) {
                      viewModel.setReminderDay(value);
                      Navigator.pop(context);
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _confirmResetData(BuildContext context, AppViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reset All Data?'),
          content: const Text(
            'This will delete all contacts, settings, and your current streak. This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                viewModel.resetData();
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<AppViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final days = [
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
            'Sunday',
          ];
          final currentDayLabel =
              (viewModel.reminderDay >= 1 && viewModel.reminderDay <= 7)
              ? days[viewModel.reminderDay - 1]
              : 'Sunday';

          return SafeArea(
            child: ListView(
              children: [
                _buildSectionHeader('Contacts & Reminders', colorScheme),

                // Contact List
                if (viewModel.contacts.isNotEmpty) ...[
                  for (int i = 0; i < viewModel.contacts.length; i++)
                    ListTile(
                      leading: Icon(
                        i == viewModel.currentContactIndex
                            ? Icons.star
                            : Icons.person_outline,
                        color: i == viewModel.currentContactIndex
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                      ),
                      title: Text(viewModel.contacts[i]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          final newContacts = List<String>.from(
                            viewModel.contacts,
                          );
                          newContacts.removeAt(i);
                          viewModel.updateContacts(newContacts);
                        },
                      ),
                    ),
                ],

                ListTile(
                  leading: Icon(
                    Icons.person_add_alt_1_outlined,
                    color: colorScheme.primary,
                  ),
                  title: Text(
                    viewModel.contacts.isEmpty
                        ? 'Add your first contact'
                        : 'Add another contact',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => _showAddContactDialog(context, viewModel),
                  // Disable if rotating mode is off and they already have 1 contact
                  enabled:
                      viewModel.rotatingModeEnabled ||
                      viewModel.contacts.isEmpty,
                ),

                if (!viewModel.rotatingModeEnabled &&
                    viewModel.contacts.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 72,
                      right: 16,
                      bottom: 8,
                    ),
                    child: Text(
                      'Enable Rotating Mode below to add multiple contacts.',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.outline,
                      ),
                    ),
                  ),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.edit_calendar_outlined),
                  title: const Text('Reminder Day'),
                  subtitle: Text(currentDayLabel),
                  onTap: () => _showReminderDayDialog(context, viewModel),
                ),

                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: const Text('Weekly Reminders'),
                  subtitle: const Text('Local device notifications only'),
                  trailing: Switch(
                    value: viewModel.notificationsEnabled,
                    activeColor:
                        colorScheme.primary, // leaving it here to just test
                    onChanged: (value) => viewModel.toggleNotifications(value),
                  ),
                ),

                _buildSectionHeader('Preferences', colorScheme),

                ListTile(
                  leading: const Icon(Icons.loop_outlined),
                  title: const Text('Rotating Mode'),
                  subtitle: const Text(
                    'Rotate through up to 3 contacts weekly',
                  ),
                  trailing: Switch(
                    value: viewModel.rotatingModeEnabled,
                    activeColor: colorScheme.primary,
                    onChanged: (value) {
                      viewModel.toggleRotatingMode(value);
                      if (!value && viewModel.contacts.length > 1) {
                        // Reset to exactly one if they toggle off
                        final keepFirst = [viewModel.contacts.first];
                        viewModel.updateContacts(keepFirst);
                      }
                    },
                  ),
                ),

                _buildSectionHeader('Legal & Info', colorScheme),

                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy Policy'),
                  onTap: () =>
                      SystemService.openUrl(AppConstants.privacyPolicyUrl),
                ),
                ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: const Text('Terms of Service'),
                  onTap: () => SystemService.openUrl(AppConstants.termsUrl),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About App'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  },
                ),

                _buildSectionHeader('Data Management', colorScheme),

                ListTile(
                  leading: Icon(
                    Icons.delete_forever_outlined,
                    color: colorScheme.error,
                  ),
                  title: Text(
                    'Clear All App Data',
                    style: TextStyle(color: colorScheme.error),
                  ),
                  onTap: () => _confirmResetData(context, viewModel),
                ),

                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
