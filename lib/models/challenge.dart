import 'package:flutter/foundation.dart';

import './activity.dart';
import './reward.dart';

class Challenge {
  final int id;
  final int initialLevel;
  final int idealLevel;
  final int updatedLevel;
  final Set<Activity> activities;
  final Reward reward;
  final DateTime remindAt;

  Challenge({
    this.id,
    @required this.initialLevel,
    @required this.idealLevel,
    this.updatedLevel,
    @required this.activities,
    @required this.reward,
    @required this.remindAt,
  });

  Map<String, dynamic> toMap() => {
        'initial_level': initialLevel,
        'ideal_level': idealLevel,
        'updated_level': updatedLevel,
        'reward_id': reward.id,
        'remind_at': remindAt.millisecondsSinceEpoch,
      };

  factory Challenge.fromMap(Map<String, dynamic> map) => Challenge(
        id: map['id'] as int,
        initialLevel: map['initial_level'] as int,
        idealLevel: map['ideal_level'] as int,
        updatedLevel: map['updated_level'],
        activities:
            (map['activities'] as List).map((a) => Activity.fromMap(a)).toSet(),
        reward: Reward.fromMap(map['reward']),
        remindAt:
            DateTime.fromMillisecondsSinceEpoch(map['remind_at']),
      );
}
