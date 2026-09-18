#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  // layout: "tree",
  orientation: "vertical",
  length: 0.4cm,
  (
    vertex("i1", label: $e^-$),
    vertex("i2", label: $e^-$),
    vertex("a", shape: "dot", label: $alpha$),
    vertex("b", shape: "dot", label: $alpha$),
    vertex("f1", label: $e^-$),
    vertex("f2", label: $e^-$),
    edge("i1", "a", type: "fermion"),
    edge("a", "f1", type: "fermion"),
    edge("i2", "b", type: "fermion"),
    edge("b", "f2", type: "fermion"),
    edge("a", "b", type: "photon", label: $gamma$),
  ),
)
