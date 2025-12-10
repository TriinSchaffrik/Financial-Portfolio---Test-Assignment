import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../generated/assets.pb.dart';

class AssetTile extends StatelessWidget {
  const AssetTile({super.key, required this.asset});

  final Asset asset;

  @override
  Widget build(BuildContext context) {
    final percentColor = asset.percentChange >= 0
        ? Theme.of(context).highlightColor
        : Theme.of(context).disabledColor;

    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 32,
          height: 32,
          child: CachedNetworkImage(
            imageUrl: asset.logoUrl,
            fit: BoxFit.cover,
          ),
        ),

        title: Text(asset.name, style: Theme.of(context).textTheme.bodyLarge),

        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${asset.currentPrice.toStringAsFixed(2)} USD',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 2),
            Text(
              '${asset.percentChange.toStringAsFixed(2)}%',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: percentColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
