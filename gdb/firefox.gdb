set detach-on-fork off
set schedule-multiple on
set non-stop on
set mi-async on

set pagination off
set auto-solib-add off

set print symbol-loading off
set print thread-events off
set print inferior-events off

handle SIGSYS noprint nostop pass
handle SIGPIPE noprint nostop pass

# Wasm code hits ud2 instructions as part of normal execution:
#
# Ryan Hunt: "Yes I believe this can happen while checking for an
# interrupt on a loop header, we catch it with a signal handler and
# will resume if there is no interrupt"
handle SIGILL noprint nostop pass
