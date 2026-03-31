import 'package:flutter/cupertino.dart';

import '../../core/themes/app_spacing.dart';
import '../../core/themes/app_tokens.dart';
import '../../core/themes/app_typography.dart';

enum UiButtonRole { squircle, circle }

enum UiButtonSize { s, m }

enum UiButtonState { defaultState, hover, disabled }

enum UiButtonStyle { main, minor }

enum UiButtonType { accent, neutral, success, critical }

class UiButton extends StatelessWidget {
  const UiButton({
    required this.onPressed,
    this.label,
    this.leading,
    this.trailing,
    this.role = UiButtonRole.squircle,
    this.size = UiButtonSize.m,
    this.state = UiButtonState.defaultState,
    this.style = UiButtonStyle.main,
    this.type = UiButtonType.accent,
    this.expand = false,
    super.key,
  }) : assert(
         label != null || leading != null || trailing != null,
         'UiButton: нужно передать label или icon.',
       );

  final VoidCallback? onPressed;
  final String? label;
  final Widget? leading;
  final Widget? trailing;

  final UiButtonRole role;
  final UiButtonSize size;
  final UiButtonState state;
  final UiButtonStyle style;
  final UiButtonType type;
  final bool expand;

  bool get _isDisabled => onPressed == null || state == UiButtonState.disabled;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final _UiButtonTheme colors = _UiButtonTheme(isDark: isDark);
    final _UiButtonMetrics metrics = _UiButtonMetrics.fromVariant(
      size: size,
      role: role,
    );

    final UiButtonState resolvedState = _isDisabled
        ? UiButtonState.disabled
        : state;

    final Color backgroundColor = colors.resolveBackground(
      style: style,
      type: type,
      state: resolvedState,
    );
    final Color borderColor = colors.resolveBorder(
      style: style,
      type: type,
      state: resolvedState,
    );
    final Color contentColor = colors.resolveContent(
      style: style,
      type: type,
      state: resolvedState,
    );

    final TextStyle baseTextStyle = size == UiButtonSize.m
        ? AppTypography.smallMedium
        : AppTypography.smallMedium.copyWith(
            fontSize: AppTypography.fontSize12,
          );

    final Widget content = DefaultTextStyle(
      style: baseTextStyle.copyWith(color: contentColor),
      child: IconTheme(
        data: IconThemeData(color: contentColor, size: metrics.iconSize),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...?(leading != null ? <Widget>[leading!] : null),
            ...?(leading != null && label != null
                ? const <Widget>[SizedBox(width: AppSpacing.spaceX2)]
                : null),
            if (label != null) Text(label!),
            ...?(trailing != null && label != null
                ? const <Widget>[SizedBox(width: AppSpacing.spaceX2)]
                : null),
            ...?(trailing != null ? <Widget>[trailing!] : null),
          ],
        ),
      ),
    );

    Widget buttonBody = AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      height: metrics.height,
      constraints: BoxConstraints(
        minWidth: role == UiButtonRole.circle
            ? metrics.height
            : metrics.minWidth,
      ),
      padding: role == UiButtonRole.circle
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: metrics.horizontalPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(metrics.radius),
        border: Border.all(color: borderColor),
      ),
      alignment: Alignment.center,
      child: content,
    );

    if (expand) {
      buttonBody = SizedBox(width: double.infinity, child: buttonBody);
    }

    return CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      onPressed: _isDisabled ? null : onPressed,
      child: buttonBody,
    );
  }
}

final class _UiButtonMetrics {
  const _UiButtonMetrics({
    required this.height,
    required this.horizontalPadding,
    required this.radius,
    required this.iconSize,
    required this.minWidth,
  });

  factory _UiButtonMetrics.fromVariant({
    required UiButtonSize size,
    required UiButtonRole role,
  }) {
    final bool isSmall = size == UiButtonSize.s;
    return _UiButtonMetrics(
      height: isSmall ? AppSpacing.spacing32 : 40,
      horizontalPadding: isSmall ? AppSpacing.spaceX3 : AppSpacing.spaceX4,
      radius: role == UiButtonRole.circle ? 999 : AppSpacing.spaceX3,
      iconSize: isSmall ? AppSpacing.spacing16 : AppSpacing.spacing20,
      minWidth: isSmall ? 88 : 96,
    );
  }

  final double height;
  final double horizontalPadding;
  final double radius;
  final double iconSize;
  final double minWidth;
}

final class _UiButtonTheme {
  const _UiButtonTheme({required this.isDark});

  final bool isDark;

  Color resolveBackground({
    required UiButtonStyle style,
    required UiButtonType type,
    required UiButtonState state,
  }) {
    if (state == UiButtonState.disabled) {
      return isDark
          ? AppTokensDark.surfaceNeutralLow
          : AppTokensLight.surfaceNeutralLow;
    }

    if (style == UiButtonStyle.main) {
      return switch (type) {
        UiButtonType.accent => _byState(
          state: state,
          normal: isDark
              ? AppTokensDark.surfaceAccentMain
              : AppTokensLight.surfaceAccentMain,
          hover: isDark
              ? AppTokensDark.surfaceAccentHover
              : AppTokensLight.surfaceAccentHover,
        ),
        UiButtonType.neutral => _byState(
          state: state,
          normal: isDark
              ? AppTokensDark.surfaceNeutralHigh
              : AppTokensLight.surfaceNeutralHigh,
          hover: isDark
              ? AppTokensDark.surfaceNeutralMedium
              : AppTokensLight.surfaceNeutralMedium,
        ),
        UiButtonType.success => _byState(
          state: state,
          normal: isDark
              ? AppTokensDark.surfaceSuccessMain
              : AppTokensLight.surfaceSuccessMain,
          hover: isDark
              ? AppTokensDark.surfaceSuccessHover
              : AppTokensLight.surfaceSuccessHover,
        ),
        UiButtonType.critical => _byState(
          state: state,
          normal: isDark
              ? AppTokensDark.surfaceCriticalMain
              : AppTokensLight.surfaceCriticalMain,
          hover: isDark
              ? AppTokensDark.surfaceCriticalHover
              : AppTokensLight.surfaceCriticalHover,
        ),
      };
    }

    return switch (type) {
      UiButtonType.accent => _byState(
        state: state,
        normal: isDark
            ? AppTokensDark.bgAccentSubdued
            : AppTokensLight.bgAccentSubdued,
        hover: isDark
            ? AppTokensDark.bgAccentSubduedHover
            : AppTokensLight.bgAccentSubduedHover,
      ),
      UiButtonType.neutral => _byState(
        state: state,
        normal: isDark ? AppTokensDark.bgSecondary : AppTokensLight.bgSecondary,
        hover: isDark
            ? AppTokensDark.bgSecondaryHover
            : AppTokensLight.bgSecondaryHover,
      ),
      UiButtonType.success => _byState(
        state: state,
        normal: isDark
            ? AppTokensDark.surfaceSuccessLow
            : AppTokensLight.surfaceSuccessLow,
        hover: isDark
            ? AppTokensDark.surfaceSuccessMedium
            : AppTokensLight.surfaceSuccessMedium,
      ),
      UiButtonType.critical => _byState(
        state: state,
        normal: isDark
            ? AppTokensDark.surfaceCriticalLow
            : AppTokensLight.surfaceCriticalLow,
        hover: isDark
            ? AppTokensDark.surfaceCriticalMedium
            : AppTokensLight.surfaceCriticalMedium,
      ),
    };
  }

  Color resolveBorder({
    required UiButtonStyle style,
    required UiButtonType type,
    required UiButtonState state,
  }) {
    if (state == UiButtonState.disabled) {
      return isDark
          ? AppTokensDark.borderSecondary
          : AppTokensLight.borderSecondary;
    }

    if (style == UiButtonStyle.main) {
      return CupertinoColors.transparent;
    }

    return switch (type) {
      UiButtonType.accent =>
        isDark ? AppTokensDark.bgAccent : AppTokensLight.bgAccent,
      UiButtonType.neutral =>
        isDark ? AppTokensDark.borderPrimary : AppTokensLight.borderPrimary,
      UiButtonType.success =>
        isDark
            ? AppTokensDark.surfaceSuccessMain
            : AppTokensLight.surfaceSuccessMain,
      UiButtonType.critical =>
        isDark
            ? AppTokensDark.surfaceCriticalMain
            : AppTokensLight.surfaceCriticalMain,
    };
  }

  Color resolveContent({
    required UiButtonStyle style,
    required UiButtonType type,
    required UiButtonState state,
  }) {
    if (state == UiButtonState.disabled) {
      return isDark ? AppTokensDark.textDisabled : AppTokensLight.textDisabled;
    }

    if (style == UiButtonStyle.main) {
      if (type == UiButtonType.neutral) {
        return isDark
            ? AppTokensDark.textPrimaryInverse
            : AppTokensLight.textOnColor;
      }
      return isDark ? AppTokensDark.textOnColor : AppTokensLight.textOnColor;
    }

    return switch (type) {
      UiButtonType.accent =>
        isDark ? AppTokensDark.textAccent : AppTokensLight.textAccent,
      UiButtonType.neutral =>
        isDark ? AppTokensDark.textPrimary : AppTokensLight.textPrimary,
      UiButtonType.success =>
        isDark ? AppTokensDark.textSuccess : AppTokensLight.textSuccess,
      UiButtonType.critical =>
        isDark ? AppTokensDark.textCritical : AppTokensLight.textCritical,
    };
  }

  Color _byState({
    required UiButtonState state,
    required Color normal,
    required Color hover,
  }) {
    return state == UiButtonState.hover ? hover : normal;
  }
}
