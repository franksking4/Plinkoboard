{ pkgs }: {
	deps = [
		pkgs.nodejs
  pkgs.verilog
		pkgs.gtkwave
    pkgs.wmctrl
    pkgs.gnome.adwaita-icon-theme
    pkgs.yosys
	];
    env = {
        XDG_DATA_DIRS="$XDG_DATA_DIRS${pkgs.gnome.adwaita-icon-theme}/share:";
    };
}