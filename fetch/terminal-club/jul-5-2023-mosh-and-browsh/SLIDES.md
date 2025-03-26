---
author: Liam Mueller
paging: "%d/%d"
---

# Mosh and Browsh

## High-latency, lossy environments, the shell, and web browsing

---

# The immediate solution: `ssh` and `screen`

- SSH provides remote connectivity
- SSH is included in Darwin and nearly all Linux distro
- `screen` provides re-connectivity

---

# Problems with SSH over high-latency, lossy connections

- Not permissive of flaky connections (`broken pipe`)
- Client rendered
- Even with `screen`, requires re-authenticating when underlying connection provider changes

---

# Introducing Mosh (the "mobile shell")

- Built atop of SSH for authentication and encryption purposes
  - Allows specifying options for initializing the SSH connection
- Permissive of flaky connections, even provider changes (Wi-Fi to 5G to Ethernet)
    - SSP (State Synchronization Protocol), monotonically indexed UDP datagrams
    - Diff-based rendering
    - Heartbeats
- Builds for mobile devices
- Requires ports 60000 to 61000 be exposed over UDP on remote server

---

# Live demo of `mosh`

---

# Web browsing with unreliable connections

- Modern websites transmit a lot data
- Despite optimizations, website loading is still effectively sequential depending on intended actions

---

# Web browsing in the terminal

Browsing on a remote server via terminal significantly reduces the amount of data transmitted over our network.

- elinks
- lynx
- eww
- edbrowse
- w3m

### Advantages
- Self-contained binaries (minus dynamic linking into system files)
- Simple and small

### Downsides
- Almost all terminal browsers are outdated for the modern internet (no JavaScript support, some with no HTML5 support)

---

# Introducing browsh

Terminal browser that wraps headless Firefox.

### Advantages
- Unlike other browser TUI's, drastically more up-to-date and compatible with modern web browsing
- Maintains extremely small data usage via injected JavaScript and Websocket magic
- Combined with Mosh, can significantly improve high-latency, lossy browsing speeds

### Downsides
- Often pretty difficult to get a meaningful display of a webpage (higher resolution terminal window may help)
- Relies on headless Firefox - very CPU intensive for a remote machine in the cloud ($$$)
- Only compatible with Firefox/no customizability
- Maintained by a single dev (but open-source!)

---

# Live demo of `browsh`

---

# Questions?

Mosh: https://mosh.org/ 

Browsh: https://www.brow.sh/docs/introduction/

