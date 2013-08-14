@Group('Document')
library ace.test.document;

import 'package:ace/ace.dart';
import 'package:bench/meta.dart';
import 'package:unittest/unittest.dart';

final String sampleText =
'''
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
culpa qui officia deserunt mollit anim id est laborum.
''';

Document document;
// TODO(rms): figure out how to invoke the js `new Document(text)` ctor...
@Setup
setup() => document = createEditSession(sampleText, 'ace/mode/dart').document;

@Test()
void testGetLength() {
  expect(document.length, equals(7));
}
