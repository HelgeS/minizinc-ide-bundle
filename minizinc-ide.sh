#!/bin/sh
# Launcher for the bundled MiniZinc IDE: use the Qt and support libraries
# shipped in /opt/minizinc-ide rather than the system ones.
export LD_LIBRARY_PATH="/opt/minizinc-ide/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH=/opt/minizinc-ide/plugins
exec /opt/minizinc-ide/bin/MiniZincIDE "$@"
