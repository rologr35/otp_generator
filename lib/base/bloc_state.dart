
import 'package:flutter/widgets.dart';

import '../di/bloc_provider.dart';
import '../di/injector.dart';
import 'bloc_base.dart';

///This state already setups a [BlocProvider] as it's main child.
abstract class StateWithBloC<W extends StatefulWidget, B extends BaseBloC>
    extends State<W> {

  // ignore: close_sinks
//  static PublishSubject<bool> onReloginResult = PublishSubject();

  ///Current bloc instance
  late B bloc;
//  static bool alreadyNavigate = false;

  ///If the current widget is able to navigate forward to login again. Usually this is true if the widget is a page
//  bool shouldReLogin() => false;

  @override
  void initState() {
    bloc = Injector.instance.getNewBloc();
//    if (shouldReLogin())
//      Injector.instance.networkHandler.on401 = () {
//        if (!alreadyNavigate) on401();
//        alreadyNavigate = true;
//      };
    Injector.instance.logger.log('initState $this');
    super.initState();
  }

//  void on401() async {
//    final res = await NavigationUtils.pushModal(
//        context,
//        LoginPage(
//          navigateBack: true,
//        ));
//    alreadyNavigate = false;
//    if (res != null && res == true) {
//      onReloginResult.sink.add(true);
//    }
//  }

  @override
  void dispose(){
    Injector.instance.logger.log('dispose $this');
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: buildWidget(context),
    );
  }

  ///Use this one instead of [build]
  Widget buildWidget(BuildContext context);
}
