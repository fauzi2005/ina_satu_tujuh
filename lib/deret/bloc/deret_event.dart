abstract class DeretEvent {}

class ButtonOneClicked extends DeretEvent {
  final int number;

  ButtonOneClicked({required this.number});
}

class ButtonTwoClicked extends DeretEvent {
  final int number;

  ButtonTwoClicked({required this.number});
}
class ButtonThreeClicked extends DeretEvent {
  final int number;

  ButtonThreeClicked({required this.number});
}
class ButtonFourClicked extends DeretEvent {
  final int number;

  ButtonFourClicked({required this.number});
}
