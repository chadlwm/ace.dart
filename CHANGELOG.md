# Ace.dart Changes

## 0.6.3-dev+3.4.15

## 0.6.2+3.4.15

- Updated to ace-builds version 03.04.15.

## 0.6.1+3.3.15

- Updated to ace-builds version 03.03.15.

## 0.6.0+24.2.15

- Updated to ace-builds version 24.02.15.
- Removed the `ace-builds` js files from the `lib/` directory.  Many users will
not require all of the files (themes, modes, etc...) for their application and 
currently there is no easy way to exclude these files from an application built 
with `pub build`.  Also, some users may need or want to use their own version of 
`ace.js` to pull in bug fixes or other modifications.  It was therefore decided 
to use the latest `ace-builds` in this package for the tests and examples 
_only_.  Each application is now responsible for including its own copy of the 
Javascript files it desires.

## 0.5.10+20.12.14

- Suppressed a console warning introduced by ace-builds 20.12.14; it appears 
that "Automatically scrolling cursor into view after selection change" is 
deprecated functionality and will be disabled in the next build of ace.js.

## 0.5.9+20.12.14

- Updated to ace-builds version 20.12.14.
- Added the `showFoldWidgets` getter/setter to `Editor`.
- Added the `isClean` getter and the `markClean` method to `UndoManager`.

## 0.5.8+8.11.14

- Updated to ace-builds version 08.11.14.
- Started wiki documentation. (@jackd)
- Added annotations and token information to the `kitchen_sink` example and a
new `custom_mode_example`. (@jackd)

## 0.5.7+9.10.2014

- Updated to ace-builds version 09.10.2014.

## 0.5.6+20.9.2014

- Added the `lineHeight` getter and the `textToScreenCoordinates` method to 
`VirtualRenderer`.

## 0.5.5+20.9.2014

- Updated to ace-builds version 20.09.2014.
- Fixed a stack overflow error when calling some getters on a loaded `Theme`.

## 0.5.4+17.8.2014

- Updated to ace-builds version 17.08.2014.

## 0.5.3+7.9.2014

- Added `.glsl`, `.frag`, and `.vert` to the default mode extension map.

## 0.5.2+7.9.2014

- Updated to ace-builds version 07.09.2014.
- Added a `gh-pages` branch to host the live demo application and added a link 
to the demo in the `README`.

## 0.5.1+7.1.2014

- Updated to ace-builds version 07.01.2014.
- Added the `Config` abstract class and the `ace.config` top-level getter.

## 0.5.0+6.9.2014

- Added `.cmd`, `.diff`, `.haml`, `.jade`, and `.proto` to the extension map 
used by the `new Mode.forFile` factory.
- Removed the `Delta` subtypes and made `Delta` a concrete class as an 
optimization; this is only a breaking change in the case where client code made
use of the `runtimeType` of a delta (e.g. `delta as InsertLinesDelta`).

## 0.4.1+6.9.2014

- Removed API docgen to allow `pub.dartlang.org` to automatically link to the
correct API docs for each version at `dartdocs.org`.

## 0.4.0+6.9.2014

- Updated to ace-builds version 06.09.2014.
- Added `.vala` to the extension map used by the `new Mode.forFile` factory.
- Changed the return type of `screenLength`, `screenWidth`, `scrollLeft` and
`scrollTop` from `int` to `num` in `EditSession` to support sub-pixel precision.
- Added the `scrollToLine` and `scrollToRow` methods to `Editor`.
- Added the `getTokenAt` and `getTokens` methods to `EditSession` and the 
`Token` class.
- Added linking extension support; multiselect must be turned off: (@umop)

```dart
ace.require('ace/ext/linking');
editor.setOptions({'enableMultiselect' : false, 'enableLinking' : true});
```

- Changed the return type of `Disposable.dispose` from `void` to `Future`.
- Changed the implementation regarding event streams of proxy objects such that 
they are created lazily and only attached to the underlying JavaScript object 
when there is an active stream subscription.  This is a significant performance
enhancement both in terms of compiled application code size and execution.

## 0.3.8+4.11.2014

- Added the `LanguageTools`, `AutoCompleter` and `Completion` classes to support
the `ace/ext/language_tools` extension.  An instance of `LanguageTools` is now
returned by a call to `require('ace/ext/language_tools')`.

## 0.3.7+4.11.2014

- Updated to ace-builds version 04.11.2014.
- Added the `lastVisibleRow` getter to `Editor` and `VirtualRenderer`.
- Added `.htm` to the extension map used by the `new Mode.forFile` factory.

## 0.3.6+3.8.2014

- Added the `commands` getter and the `execCommand` method to `Editor`.
- Added the `Command` and `CommandManager` classes.
- Updated to ace-builds version 03.08.2014.

## 0.3.5+2.28.2014

- Fixed a bug in the `Editor.onPaste` event stream that arrived with a change in
`ace-builds` 02.28.2014. 
- Added the `paste` method to `Editor`.
- Updated API documentation generation to use the new `docgen` tool.
- Added `.as`, `.ini`, `.pl`, `.pm`, and `.sass` to the extension map used by 
the `new Mode.forFile` factory.

## 0.3.4+2.28.2014

- Updated to ace-builds version 02.28.2014.
- Added the `fadeFoldWidgets` getter / setter to `Editor`.
- Added the `getLineRange` method to `Selection`.

## 0.3.3+1.8.2014

- Changed the data carried by a number of 'empty' streams from `this` to `null`
for performance reasons.

## 0.3.2+1.8.2014

- Added the `wrapLimit` setter to `EditSession`.
- Replaced the `EditSession.wrapLimitRange` getter with the `getWrapLimitRange` 
method.

## 0.3.1+1.8.2014

- Added an `OptionsProvider` implementation to the `EditSession`.
- Fixed some bugs in `Mode` proxy objects.

## 0.3.0+1.8.2014

- Decoupled the `Implementation` from the `ace` library by adding an `ace.proxy`
library;  the library user is responsible for setting the `implementation` 
variable prior to making any other calls to the `ace` library.  For example:

```dart
import 'package:ace/ace.dart' as ace;
import 'package:ace/proxy.dart';

main() {
  ace.implementation = ACE_PROXY_IMPLEMENTATION;
  ...
}
```

## 0.2.0+1.8.2014

- Replaced the `EditSession.breakpoints` getter with the `getBreakpoints` 
method.
- Split `EditSession.annotations` getter/setter into the `getAnnotations` and
`setAnnotations` methods; this matches `ace.js` and helps to clarify their 
separate behavior.
- Added the static `Mode.extensionMap` getter; the user may modify this map to
configure the `new Mode.forFile` factory.
- Added the `new Mode.named` factory, `name` getter, and enumeration constants 
to `Mode`.
- Added `gotoLine` and the `onChangeSelection` event stream to `Editor`.
- Added the `Marker` class and expose the `onChangeBackMarker`, 
`onChangeFrontMarker`, `addMarker`, `getMarkers` and `removeMarker` members on 
the `EditSession` class.
- Added the `Fold`, `FoldLine`, `Placeholder` and `RangeList` classes.
- Added the `Folding` abstract class and have `EditSession` implement it. 
- Added the `onChangeFold` event stream to `EditSession`.

## 0.1.7+1.8.2014

- Updated to ace-builds version 01.08.2014.

## 0.1.6+12.2.2013

- Added the `UndoManagerBase` class and implemented the 
`EditSession.undoManager` setter; the argument to this setter _must_ be an 
object derived from `UndoManagerBase`.
- Optimized some list and map conversions on the `dart:js` boundary.
- Added the `Annotation` class and expose the `onChangeAnnotation`, 
`annotations`, and `clearAnnotations` members on the `EditSession` class.
- Added a new `example/annotations`.

## 0.1.5+12.2.2013

- Added `containerElement` and `mouseEventTarget` getters to the 
`VirtualRenderer`.
- Added `.lua`, `.hs`, `.hx`, `.scala`, and `.svg` to the extension map used by 
the `new Mode.forFile` factory.

## 0.1.4+12.2.2013

- Updated to ace-builds version 12.02.2013.
- Added `showGutter`, `printMarginColumn`, and an `OptionsProvider` 
implementation to the `VirtualRenderer`.

## 0.1.3+10.28.2013

- Added the `KeyBinding` and `KeyboardHandler` abstract classes and expose the
`Editor.keyBinding` getter and the `Editor.keyboardHandler` getter / setter.

## 0.1.2+10.28.2013

- Added a new `example/autocomplete`.
- Added the `require` top-level function.
- Added the `OptionsProvider` abstract class and have `Editor` implement it. 

## 0.1.1+10.28.2013

- Updated pubspec for Dart 1.0 release as requested.

## 0.1.0+10.28.2013

- Updated to ace-builds version 10.28.2013.
- Updated to SDK 0.8.10_r29803.
- Added documentation and test coverage to a number of public methods; please
consult the commit history for details.

## 0.0.9+10.21.2013

- Updated to ace-builds version 10.21.2013.
- Fixed a couple of bugs from the move to `dart:js`.

## 0.0.8+10.7.2013

- Updated to SDK 0.8.5_r28990.
- Removed dependency on `js` package and moved code to use the `dart:js` 
library instead.

## 0.0.7+10.7.2013

- Added several public methods to the `Range` class with documentation and test 
coverage.
- Changed the `noClip` parameter of `Anchor.setPosition` to a named optional
parameter `clip` which defaults to `true`.
- Changed the `dontSelect` parameter of `UndoManager.undo` and `redo` to a named 
optional parameter `select` which defaults to `true`.
- Changed the `cursorPos` parameter of `Editor.setValue` to an optional
parameter `cursorPosition` which defaults to `0` (select all) and documented the
method.
- Changed the `times` parameter of the `Editor` methods `navigateDown`, 
`navigateLeft`, `navigateRight`, and `navigateUp` to be optional with default 
value of `1`.

## 0.0.6+10.7.2013

- Pub doesn't seem to like a `0` in the version metadata just about anywhere.
This is really a pub bug but I'm going to drop the `0` to work around the issue.

## 0.0.5+10.07.2013

- Updated to ace-builds version 10.07.2013.
- Changed the `text` parameter of the `Document` constructor from an optional
to a named optional.

## 0.0.4+9.11.2013

- Updated to SDK 0.7.6_r28108.
- Added documentation and test coverage to a number of public methods; please
consult the commit history for details.
- Fixed `Editor.onChangeSession` stream type to `EditSessionChangeEvent` thanks
to a bug fix in the `js-interop` package.

## 0.0.3+9.11.2013

- Updated to SDK 0.7.5_r27776.
- Added documentation and test coverage to a number of public methods; please
consult the commit history for details.

## 0.0.2+9.11.2013

- Removed leading `0` from the version metadata string as it was being stripped
when publishing and that was causing issues.
- Added LICENSE and README for ace.js to `lib/src/js`.

## 0.0.1+09.11.2013

- Initial version.
