import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_listing_app/core/dependency_injection.dart';

import 'features/product_listing/bloc/product_bloc.dart';
import 'features/add_to_cart/bloc/cart_bloc.dart';
import 'features/product_listing/views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
await Hive.openBox('cartBox');
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ProductBloc>()
            ..add(const ProductEvent.fetchProducts()),
        ),
        BlocProvider(
          create: (_) => sl<CartBloc>() ..add(const CartEvent.fetchCart()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}