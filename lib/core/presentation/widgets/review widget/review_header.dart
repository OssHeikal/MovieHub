import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/avatar.dart';
import 'package:movie_hub/core/resources/values.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({
    super.key,
    required this.name,
    required this.userName,
    required this.avatarUrl,
  });
  final String name;
  final String userName;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar(avatarUrl: avatarUrl),
        SizedBox(width: AppWidth.w10.w),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '@$userName',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
