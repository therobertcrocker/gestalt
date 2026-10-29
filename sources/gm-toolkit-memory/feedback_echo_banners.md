---
name: feedback-echo-banners
description: "echo \"==== x ====\" banner separators in multi-step Bash are welcome — verbose mode is on"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 8556ace8-f114-4cff-b52f-3c51118031d7
---

Echo banner separators (`echo "==== step ===="`) in multi-step Bash commands are welcome, not noise.

**Why:** Robert runs with verbose mode on, so banner lines surface in the transcript and act as visual section markers between stages of a compound command. They previously looked pointless only because verbose mode was off and the output was hidden.

**How to apply:** Feel free to use echo banners to delimit phases of a multi-step Bash command (build / test / summary, etc.). Don't suppress them for the sake of terseness.
