import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModel/elevatedButton_viewModel.dart';

class ProviderButton extends StatefulWidget {
  const ProviderButton({Key? key}) : super(key: key);

  @override
  State<ProviderButton> createState() => _ProviderButtonState();
}

class _ProviderButtonState extends State<ProviderButton> {
  late final ButtonViewModel _buttonViewModel;
  @override
  void initState() {
    super.initState();
    _buttonViewModel = ButtonViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _buttonViewModel,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(leading: _loadingWidget()),
            body: Center(
              child: Container(
                margin: EdgeInsets.all(70),
                width: 80,
                height: 80,
                child: ElevatedButton(
                    onPressed: _buttonViewModel.isLoading
                        ? null
                        : () {
                            _buttonViewModel.controlTextValue();
                          },
                    child: Center(child: Text('Login'))),
              ),
            ),
          );
        });
  }

//AppBar
  //Center _loadingWidget() => Center(child: CircularProgressIndicator(),);
  Widget _loadingWidget() {
    return Selector<ButtonViewModel, bool>(
      selector: (context, viewModel) {
        return viewModel.isLoading;
      },
      builder: (context, value, child) {
        return value
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox();
      },
    );
    return Consumer<ButtonViewModel>(builder: (context, value, child) {
      return value.isLoading
          ? Center(child: CircularProgressIndicator())
          : SizedBox();
    });
  }
}
