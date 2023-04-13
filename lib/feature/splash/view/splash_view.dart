import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../product/enum/lottie_enum.dart';
import '../../../product/extension/context_extension.dart';
import '../../../product/navigator/app_router.dart';
import '../viewModel/splash_cubit.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        Future.delayed(context.normalDuration).then((value) => context.router.navigate(const HomeRoute()));
        return SplashCubit();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Center(
              child: Lottie.asset(LottieItems.splash.lottiePath),
            );
          },
        ),
      ),
    );
  }
}
