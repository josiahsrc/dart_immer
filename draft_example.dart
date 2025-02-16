import 'package:draft/draft.dart';

part 'draft_example.draft.dart';

void main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
}

@Draft()
class Foo {
  final String fieldA;
  final String fieldB;

  const Foo({
    required this.fieldA,
    required this.fieldB,
  });
}

void testIt() {
  final foo = Foo(fieldA: 'a', fieldB: 'b');

  final foo2 = foo.produce((draft) {
    draft.fieldB = 'c';
  });

  print(foo2.fieldB); // c

  final foo5 = foo.draft()
    ..fieldB = 'd'
    ..fieldA = 'e' * 5;

  print(foo5.save());
}
