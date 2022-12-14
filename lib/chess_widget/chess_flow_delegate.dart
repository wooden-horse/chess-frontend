import 'package:chess/chess_widget/position_handlers/transformation.dart';
import 'package:chess/chess_widget/state/chess_board_state.dart';
import 'package:flutter/material.dart';

class ChessFlowDelegate extends FlowDelegate {
  final ChessBoardState state;
  ChessFlowDelegate(this.state);

  @override
  void paintChildren(FlowPaintingContext context) {
    context.paintChild(0, transform: Matrix4.translationValues(0, 0, 0));
    for (var element in state.chessPieces) {
      context.paintChild(element.chessPieceEnum.renderKey,
          transform: Transformation.fromCordinates(
            element.cordinate,
            context.size,
          ));
    }
  }

  @override
  bool shouldRepaint(ChessFlowDelegate oldDelegate) {
    return true;
  }
}
