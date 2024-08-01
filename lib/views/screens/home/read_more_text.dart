import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;

  ReadMoreText(
      this.text, {
        this.textStyle,
        this.linkStyle,
        this.trimLines = 2,
      });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = widget.textStyle ?? AppTextStyles.body;
    final linkTextStyle = widget.linkStyle ??
        AppTextStyles.body.copyWith(
          color: seedColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        );

    final textSpan = TextSpan(
      text: widget.text,
      style: defaultTextStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.trimLines,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      maxWidth: mediaWidth(context),
    );

    if (!textPainter.didExceedMaxLines) {
      return Text.rich(
        textSpan,
        style: widget.textStyle,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
          _readMore
              ? TextSpan(
            children: [
              TextSpan(
                text: _getTrimmedText(widget.text, textPainter),
                style: defaultTextStyle,
              ),
              TextSpan(
                text: "... Read more",
                style: linkTextStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      _readMore = !_readMore;
                    });
                  },
              ),
            ],
          )
              : TextSpan(
            children: [
              textSpan,
              TextSpan(
                text: " Read less",
                style: linkTextStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      _readMore = !_readMore;
                    });
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getTrimmedText(String text, TextPainter textPainter) {
    final textSpan = TextSpan(text: text, style: widget.textStyle);
    final position = textPainter.getPositionForOffset(
      Offset(textPainter.width, textPainter.height / 2),
    );
    return text.substring(0, position.offset);
  }
}