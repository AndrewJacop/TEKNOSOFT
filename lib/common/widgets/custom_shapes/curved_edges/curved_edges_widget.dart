import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: UtCustomCurvedEdge(), child: child);
  }
}
