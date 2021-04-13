import 'question.dart';

class QuizBrain {
  int _currentIndex = 0;

  List<Question> _questionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];

  String getQuestionText() {
    return _questionBank[_currentIndex].questionText;
  }

  bool checkQuestionAnswer(bool userAnswer) {
    return _questionBank[_currentIndex].questionAnswer == userAnswer;
  }

  void nextQuestion() {
    if (_currentIndex < _questionBank.length - 1) {
      _currentIndex++;
    }
  }

  bool isFinished() {
    if (_currentIndex == _questionBank.length) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _currentIndex = 0;
  }
}
