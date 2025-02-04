import 'package:flutter/material.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/domain/use_cases/get_products_use_case.dart';
import 'package:meca_inventory/presentation/home/blocs/get_products/get_products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meca_inventory/presentation/home/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductsBloc>(
          create: (context) => GetProductsBloc(useCase: getIt.get<GetProductsUseCase>())
            ..add(
              const GetProductsLoadingEvent(),
            ),
        ),
      ],
      child: const HomeContent(),
    );
  }
}
