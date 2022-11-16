import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWithLoader<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  const ButtonWithLoader({
    required this.label,
    required this.onPressed,
    required this.selector,
    required this.bloc,
    super.key,
  });
  final VoidCallback onPressed;
  final String label;
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(
            MediaQuery.of(context).size.width,
            50,
          ),
        ),
      ),
      child: BlocSelector<B, S, bool>(
        bloc: bloc,
        selector: selector,
        builder: (context, showLoader) {
          if (showLoader) {
            return const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              ),
            );
          }
          return Text(label);
        },
      ),
    );
  }
}
