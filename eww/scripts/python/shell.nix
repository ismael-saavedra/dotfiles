{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "python-dbus-shell";

  shellHook = ''
    export DBUS_SESSION_BUS_ADDRESS=${builtins.getEnv "DBUS_SESSION_BUS_ADDRESS"}
    export XDG_RUNTIME_DIR=${builtins.getEnv "XDC_RUNTIME_DIR"}
    export DISPLAY=${builtins.getEnv "DISPLAY"}
    export WAYLAND_DISPLAY=${builtins.getEnv "WAYLAND_DISPLAY"}
    '';

  buildInputs = with pkgs; [
    python3
    python3Packages.pygobject3
    python3Packages.dbus-python
    glib
    dbus
    gobject-introspection
  ];
}
