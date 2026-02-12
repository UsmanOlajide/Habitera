  String createdDate(DateTime createdAt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final createdDay = DateTime(createdAt.year, createdAt.month, createdAt.day);

    final diffDays = today.difference(createdDay).inDays;

    if (diffDays == 0) return 'Created today';
    if (diffDays == 1) return 'Created yesterday';
    if (diffDays == 0) return 'Created today';

    const months = [
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
      'Dec',
    ];

    return 'Created ${months[createdAt.month - 1]} ${createdAt.day}';
  }