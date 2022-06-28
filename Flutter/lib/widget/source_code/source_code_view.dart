import 'package:dokit/widget/source_code/syntax_highlighter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceCodeView extends StatelessWidget {
  final String sourceCode;
  final double _textScaleFactor = 1.0;

  const SourceCodeView({Key? key, required this.sourceCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getCodeView(sourceCode, context);
  }

  Widget _getCodeView(String codeContent, BuildContext context) {
    codeContent = codeContent.replaceAll('\r\n', '\n');
    final style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();
    return Container(
      constraints: BoxConstraints.expand(),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SelectableText.rich(
            TextSpan(
              style: GoogleFonts.notoSans(fontSize: 12)
                  .apply(fontSizeFactor: _textScaleFactor),
              children: <TextSpan>[
                DartSyntaxHighlighter(style).format(codeContent)
              ],
            ),
            style: DefaultTextStyle.of(context)
                .style
                .apply(fontSizeFactor: _textScaleFactor),
          ),
        ),
      ),
    );
  }
}
