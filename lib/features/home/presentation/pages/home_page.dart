import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_card.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.spacing20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: AppConstants.spacing24),
              _buildBalanceCard(),
              const SizedBox(height: AppConstants.spacing32),
              _buildQuickActions(),
              const SizedBox(height: AppConstants.spacing32),
              _buildRecentTransactions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.primary,
          child: Text(
            'A',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: AppConstants.spacing12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                'Amanda',
                style: AppTextStyles.headlineSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: AppColors.textSecondary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return const BalanceCard(
      balance: '\$12,345.67',
      accountType: 'Total Balance',
      cardNumber: '**** **** **** 1234',
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: AppTextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacing16),

        // Account and Card section
        AccountCard(
          title: AppStrings.accountAndCard,
          subtitle: 'Manage your accounts',
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_wallet,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: AppConstants.spacing16),

        // Transfer via card number
        const TransferCard(
          title: AppStrings.transferViaCardNumber,
          description: 'Send money using card number',
          icon: Icons.credit_card,
          iconColor: AppColors.secondary,
        ),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.recentTransactions,
              style: AppTextStyles.headlineSmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.viewAll,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing16),

        // Transaction items
        _buildTransactionItem(
          'Netflix Subscription',
          '-\$15.99',
          'Entertainment',
          Icons.play_circle_outline,
          AppColors.error,
        ),
        const SizedBox(height: AppConstants.spacing12),
        _buildTransactionItem(
          'Salary Deposit',
          '+\$3,500.00',
          'Income',
          Icons.trending_up,
          AppColors.success,
        ),
        const SizedBox(height: AppConstants.spacing12),
        _buildTransactionItem(
          'Coffee Shop',
          '-\$4.50',
          'Food & Drinks',
          Icons.local_cafe_outlined,
          AppColors.error,
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
    String title,
    String amount,
    String category,
    IconData icon,
    Color amountColor,
  ) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: amountColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: amountColor,
              size: 20,
            ),
          ),
          const SizedBox(width: AppConstants.spacing12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleMedium,
                ),
                Text(
                  category,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: AppTextStyles.titleMedium.copyWith(
              color: amountColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
