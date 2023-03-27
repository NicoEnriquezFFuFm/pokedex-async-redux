import 'package:async_redux/async_redux.dart';
import 'package:pokedexbootcamp/state/app_state.dart';

abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});

  final String actionKey;

  @override
  void before() => dispatchSync(WaitAction.add(actionKey));

  void after() => dispatchSync(WaitAction.remove(actionKey));
}
