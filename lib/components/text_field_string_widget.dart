import 'package:flutter/material.dart';

class TextFieldStringWidget extends StatefulWidget {
  final String? text;
  final String hint;
  final void Function(String value) anchor;

  const TextFieldStringWidget({
    Key? key,
    this.text,
    required this.anchor,
    required this.hint,
  }) : super(key: key);

  @override
  State<TextFieldStringWidget> createState() => _TextFieldStringWidgetState();
}

class _TextFieldStringWidgetState extends State<TextFieldStringWidget> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = widget.text ?? "";
    _textController.addListener(() {
      widget.anchor(_textController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: SizedBox(
        height: 64,
        child: Stack(
          children: [
            TextFormField(
              maxLength: 120,
              controller: _textController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white.withOpacity(0.08),
                counterText: "",
                contentPadding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                  bottom: 18,
                  right: 48,
                ),
                hintText: widget.hint,
              ),
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
              cursorColor: Colors.white,
            ),
            if (_textController.text != "" &&
                _textController.text != "0,00" &&
                _textController.text.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _textController.text = "",
                          child: Container(
                            height: 28,
                            width: 28,
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.white.withOpacity(0.08),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
