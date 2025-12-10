import 'package:flutter/material.dart';

class PortfolioEmpty extends StatelessWidget {
  const PortfolioEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_balance_wallet_outlined, size: 64),
          const SizedBox(height: 24),
          Text(
            'No Investments Yet',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
