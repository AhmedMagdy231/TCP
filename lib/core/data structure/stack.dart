class MyStack<T> {
  List<T> _stack = [];

  // Push element onto the stack
  void push(T element) {
    _stack.add(element);
  }

  // Pop element from the stack
  T pop() {
    if (_stack.isEmpty) {
      throw Exception("Stack is empty");
    }
    return _stack.removeLast();
  }

  // Peek at the top element of the stack
  T peek() {
    if (_stack.isEmpty) {
      throw Exception("Stack is empty");
    }
    return _stack.last;
  }

  // Check if the stack is empty
  bool isEmpty() {
    return _stack.isEmpty;
  }

  // Get the size of the stack
  int size() {
    return _stack.length;
  }

  void display(){
    print('-----------------------');
    _stack.forEach((element) {
      print(element);
    });
    print('-----------------------');
  }
}