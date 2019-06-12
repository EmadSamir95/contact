import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:gdgbloc/main.dart';



void main(){



  testWidgets('3 Fields are valid', (WidgetTester tester) async {

    // fill the 3 fields automatically with this data
    await tester.enterText(find.byKey(emailkey), '@');
    await tester.enterText(find.byKey(namekey), 'abcde');
    await tester.enterText(find.byKey(feedbackkey), 'abcde');

    //press on send feedback button
   await tester.tap(find.byKey(button));

   await tester.pump();


    expect(valid, false);




  });


}