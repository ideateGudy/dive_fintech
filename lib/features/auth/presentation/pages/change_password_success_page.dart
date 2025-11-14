import 'package:dive_fintech/dive_fintech.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordSuccessPage extends StatefulWidget {
  const ChangePasswordSuccessPage({super.key});

  @override
  State<ChangePasswordSuccessPage> createState() =>
      _ChangePasswordSuccessPageState();
}

class _ChangePasswordSuccessPageState extends State<ChangePasswordSuccessPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Success icon and message
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: double.infinity),
                  Image.asset(
                    'assets/illustrations/Illustration.png',
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Change password successfully!',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'You have successfully changed your password. \nPlease use the new password when signing in.',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 60),

              AppButton(
                text: 'Ok',
                isExpanded: true,
                isLoading: _isLoading,
                onPressed: _handleNavigateToLoginPage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNavigateToLoginPage() async {
    setState(() {
      _isLoading = true;
    });

    // Brief delay for UX feedback
    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      // Navigate to login page
      context.go(AppRoutes.login);
    }
  }
}
