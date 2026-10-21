import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shipping_user_app/core/widgets/shimmer_widget.dart';
import 'package:shipping_user_app/features/home/data/models/representative_model.dart';
import 'package:shipping_user_app/features/home/logic/home_cubit.dart';
import 'package:shipping_user_app/features/home/logic/home_state.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/core/routing/routes.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/features/home/ui/widgets/representative_card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: <Color>[
                Color(0xFFFF575A),
                Color(0xFFFF914D),
                Color(0xFFFFC827),
              ],
            ).createShader(bounds);
          },
          child: Text(
            "Shipping Supervisor",
            style: AppTextStyles.font22Bold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => homeCubit.getRepresentatives(),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    S.of(context).representatives_list,
                    style: AppTextStyles.font20Bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return StreamBuilder(
                    stream: homeCubit.representativesStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting && homeCubit.cachedRepresentatives.isEmpty) {
                        return SliverPadding(
                          padding: const EdgeInsets.only(bottom: 80),
                          sliver: SliverToBoxAdapter(
                            child: SkeletonizerWidget(
                              child: ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => RepresentativeCardWidget(
                                  representative: RepresentativeModel(
                                    id: 0,
                                    name: "Name Name",
                                    avatar: "",
                                    lastSeen: "1900-01-01",
                                    lat: 0.0,
                                    lon: 0.0,
                                    isActive: false,
                                  ),
                                  isOnline: false,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting && homeCubit.cachedRepresentatives.isNotEmpty) {
                        return SliverPadding(
                          padding: const EdgeInsets.only(bottom: 80),
                          sliver: SliverList.builder(
                            itemCount: homeCubit.cachedRepresentatives.length,
                            itemBuilder: (context, index) {
                              final rep = homeCubit.cachedRepresentatives[index];
                              return Hero(
                                tag: rep.id,
                                child: RepresentativeCardWidget(
                                  representative: rep,
                                  isOnline: homeCubit.isUserOnline(rep.lastSeen),
                                  onTap: () => context.push(
                                    Routes.packageDetailsScreen,
                                    extra: [rep, homeCubit],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      if (snapshot.hasError && homeCubit.cachedRepresentatives.isEmpty) {
                        return SliverFillRemaining(
                          fillOverscroll: false,
                          hasScrollBody: false,
                          child: Center(
                            child: Text(
                              S.of(context).error_unknown,
                              style: AppTextStyles.font16SemiBold,
                            ),
                          ),
                        );
                      }
                      if (snapshot.hasError && homeCubit.cachedRepresentatives.isNotEmpty) {
                        return SliverPadding(
                          padding: const EdgeInsets.only(bottom: 80),
                          sliver: SliverList.builder(
                            itemCount: homeCubit.cachedRepresentatives.length,
                            itemBuilder: (context, index) {
                              final rep = homeCubit.cachedRepresentatives[index];
                              return Hero(
                                tag: rep.id,
                                child: RepresentativeCardWidget(
                                  representative: rep,
                                  isOnline: homeCubit.isUserOnline(rep.lastSeen),
                                  onTap: () => context.push(
                                    Routes.packageDetailsScreen,
                                    extra: [rep, homeCubit],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      if (snapshot.data!.isEmpty || snapshot.data == null) {
                        return SliverFillRemaining(
                          fillOverscroll: false,
                          hasScrollBody: false,
                          child: Center(
                            child: Text(
                              S.of(context).no_representatives,
                              style: AppTextStyles.font16SemiBold,
                            ),
                          ),
                        );
                      }
                      context.read<HomeCubit>().cacheRepresentatives(snapshot.data!);
                      final reps = snapshot.data!;
                      return SliverPadding(
                        padding: const EdgeInsets.only(bottom: 80),
                        sliver: SliverList.builder(
                          itemCount: reps.length,
                          itemBuilder: (context, index) {
                            final rep = reps[index];
                            return Hero(
                              tag: rep.id,
                              child: RepresentativeCardWidget(
                                representative: rep,
                                isOnline: homeCubit.isUserOnline(rep.lastSeen),
                                onTap: () => context.push(
                                  Routes.packageDetailsScreen,
                                  extra: [rep, homeCubit],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
