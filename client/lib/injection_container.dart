import 'package:client/features/app/presentation/bloc/app_bloc.dart';
import 'package:client/features/home/data/data_sources/home_api_service.dart';
import 'package:client/features/home/data/repository/home_product_repository_impl.dart';
import 'package:client/features/home/domain/repository/home_product_repository.dart';
import 'package:client/features/home/domain/usecases/home_product_get_all_categories_usecase.dart';
import 'package:client/features/home/domain/usecases/home_product_get_by_category_usecase.dart';
import 'package:client/features/home/domain/usecases/home_product_search_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injection_container.main.dart';
