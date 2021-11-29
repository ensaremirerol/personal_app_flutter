import 'dart:convert';

import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:personal_site/models/portfolio_model.dart';

class PortfolioService extends InheritedWidget {
  PortfolioService({Key? key, required Widget child})
      : super(key: key, child: child);

  final _PortfolioService _service = _PortfolioService();

  PortfolioModel get portfolio => _service.portfolioModel;

  Future<void> init() async {
    await _service.getPortfolio();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static PortfolioService of(BuildContext context) {
    final PortfolioService? result =
        context.dependOnInheritedWidgetOfExactType<PortfolioService>();
    assert(result != null, 'No PortfolioService found in context');
    return result!;
  }
}

class _PortfolioService {
  late PortfolioModel portfolioModel;

  Future<void> getPortfolio() async {
    const String url = 'https://gitconnected.com/v1/portfolio/alfasquad';
    final Response response = await get(Uri.parse(url));
    portfolioModel = PortfolioModel.fromJson(json.decode(response.body));
  }
}
