import 'dart:async';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.onSearch,
    this.debounceDuration,
  });

  final Future<void> Function(String) onSearch;
  final Duration? debounceDuration;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? _debounceTimer;

  late Duration debounceDuration;

  @override
  void initState() {
    debounceDuration = widget.debounceDuration ??
        const Duration(
          milliseconds: 500,
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (_debounceTimer != null && _debounceTimer!.isActive) {
                  _debounceTimer!.cancel();
                }

                _debounceTimer = Timer(debounceDuration, () {
                  widget.onSearch(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
