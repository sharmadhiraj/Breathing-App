enum BreathingPhase {
  getReady("Get Ready", "Get going on your breathing session", false),
  breatheIn("Breathe In", "Nice and slow", false),
  holdIn("Hold Softly", "Just be here", true),
  breatheOut("Breathe Out", "You are doing great!", false),
  holdOut("Hold Gently", "Just be here", true);

  final String name;
  final String label;
  final bool up;

  const BreathingPhase(this.name, this.label, this.up);
}
