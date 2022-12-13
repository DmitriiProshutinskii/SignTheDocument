import 'package:flutter/material.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SberCounter extends StatelessWidget {
  final SberCounterState state;
  final int digit;
  const SberCounter({super.key, required this.state, required this.digit});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case SberCounterState.current:
        return _SberCounterCurrent(digit);
      case SberCounterState.upcomming:
        return _SberCounterUpcomming(digit);
      case SberCounterState.completed:
        return _SberCounterCompleted(digit);
    }
  }
}

class _SberCounterCompleted extends StatelessWidget {
  final int count;
  const _SberCounterCompleted(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: SberColors.electricBlue4,
        shape: BoxShape.circle,
      ),
      child: SberCText(
        count.toString(),
        color: SberColors.primaryWhite,
      ),
    );
  }
}

class _SberCounterUpcomming extends StatelessWidget {
  final int count;
  const _SberCounterUpcomming(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: SberColors.primaryWhite,
        shape: BoxShape.circle,
      ),
      child: SberCText(
        count.toString(),
        color: SberColors.coolGray,
      ),
    );
  }
}

class _SberCounterCurrent extends StatelessWidget {
  final int count;
  const _SberCounterCurrent(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: SberColors.primaryWhite,
        border: Border.all(color: SberColors.electricBlue4, width: 1),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$count',
            style: TextStyles.caption1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

enum SberCounterState {
  current,
  upcomming,
  completed,
}
