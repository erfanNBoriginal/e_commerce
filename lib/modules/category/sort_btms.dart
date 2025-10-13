import 'package:e_commerce/modules/category/cubit/category_cubit.dart';
import 'package:e_commerce/modules/category/selected_filter.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  static show(BuildContext context, {required CategoryCubit categoryCubit}) {
    U.BottomSheet.show(
      maxHeight: 400,
      context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [BlocProvider.value(value: categoryCubit)],
          child: SortBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryCubit = context.read<CategoryCubit>();
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return ListView(
          children: [
            ...state.sortFilters.asMap().entries.map(
              (e) => SelectedFilter(
                title: e.value,
                isSelected: e.value == state.selectedSortCategory,
                onTap: () {
                  categoryCubit.onSortPressed(e.key, title: e.value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
