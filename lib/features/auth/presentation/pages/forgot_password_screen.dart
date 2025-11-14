import 'package:dive_fintech/core/constants/app_strings.dart';
import 'package:dive_fintech/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ForgotPasswordPageCode extends StatefulWidget {
  const ForgotPasswordPageCode({super.key});

  @override
  State<ForgotPasswordPageCode> createState() => _ForgotPasswordPageCodeState();
}

class _ForgotPasswordPageCodeState extends State<ForgotPasswordPageCode> {
  final _codeController = TextEditingController();
  bool _isLoading = false;
  bool _codeSent = false;
  bool _changedPasswordIsLoading = false;
  bool _codeVerified = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

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
        title: Text(
          'Forgot password',
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Top content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.border,
                            spreadRadius: 2,
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Type a code',
                            style: AppTextStyles.bodyMedium
                                .copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: AppTextField(
                                  hintText: 'Code',
                                  readOnly: true,
                                  controller: _codeController,
                                ),
                              ),
                              const SizedBox(width: 12),
                              AppButton(
                                text: 'Resend',
                                isExpanded: false,
                                isLoading: _isLoading,
                                onPressed: _handleSendCode,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (_codeSent) ...[
                                  Text(
                                    'We texted you a code to verify your phone number (+84) 0398829xxx',
                                    style: AppTextStyles.bodyMedium
                                        .copyWith(color: AppColors.textPrimary),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'This code will expire 10 minutes after this message...',
                                    style: AppTextStyles.bodyMedium
                                        .copyWith(color: AppColors.textPrimary),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                                if (_codeVerified) ...[
                                  Text(
                                    'Please enter the code sent to your phone...',
                                    style: AppTextStyles.bodyMedium
                                        .copyWith(color: AppColors.textPrimary),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ],
                            ),
                          ),
                          // const Spacer(),
                          AppButton(
                            text: 'Change password',
                            isExpanded: true,
                            isLoading: _changedPasswordIsLoading,
                            onPressed: _handleChangePassword,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.changeNumber,
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Number pad stays fixed at bottom
            _buildNumberPad(),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              _buildNumberButton('1'),
              _buildNumberButton('2'),
              _buildNumberButton('3'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildNumberButton('4'),
              _buildNumberButton('5'),
              _buildNumberButton('6'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildNumberButton('7'),
              _buildNumberButton('8'),
              _buildNumberButton('9'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildNumberButton('.'),
              _buildNumberButton('0'),
              _buildBackspaceButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GestureDetector(
          onTap: () => _onNumberTap(number),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border),
            ),
            child: Center(
              child: Text(
                number,
                style: AppTextStyles.headlineSmall.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GestureDetector(
          onTap: _onBackspaceTap,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(
                Icons.backspace_outlined,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onNumberTap(String number) {
    if (number == '.') return;

    final currentText = _codeController.text;
    final newText = currentText + number;
    _codeController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  void _onBackspaceTap() {
    final currentText = _codeController.text;
    if (currentText.isNotEmpty) {
      final newText = currentText.substring(0, currentText.length - 1);
      _codeController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
  }

  void _handleSendCode() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isLoading = false;
        _codeSent = true;
      });
    }
  }

  void _handleChangePassword() async {
    if (_codeController.text.isEmpty) {
      setState(() {
        _codeVerified = true;
      });
      return;
    }
    setState(() {
      _changedPasswordIsLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _changedPasswordIsLoading = false;
      });
      // Navigate to change password page
      context.go(AppRoutes.changePassword);
    }
  }
}
