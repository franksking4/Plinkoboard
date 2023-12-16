#!/bin/sh

# Compile the verilog
mkdir -p build
RED='\033[0;31m'
NC='\033[0m' # No Color

for f in testbenches/*.v ; do
  b=`basename "${f%.*}"`
  iverilog -o "build/$b" "$f" *.v || { printf "${RED}Failed to compile, check errors${NC}\n"; exit 1; }
  "build/$b" >build/"output-$b.txt" 2>&1 || { printf "${RED}Failed to run testbench $b, check errors in build/output-$b.txt ${NC}\n"; }
  echo Output from testbench "$b" is now in build/"output-$b.txt"
done

# Check if GTK wave is already running
WID=$(cat build/gtkwave)
if wmctrl -l | egrep -o $WID > /dev/null; then
    # Wait for the existing process to close
    wmctrl -ic $WID
    while ps $(cat gtkwave.pid) > /dev/null; do
        true
    done
fi

# Load the VCD file in GTK wave and launch it
nohup gtkwave -M build/tb-processor.vcd build/.dump.gtkw -a build/.dump.gtkw --dark --rcvar 'splash_disable on' --saveonexit >build/nohup.out 2>&1 &
GTKWAVE=$!

# Wait for GTK wave to launch and then make it fullscreen
WID=$(wmctrl -l | egrep -o 0x[0-9a-fA-F]+)
while [ -z $WID ]; do
    WID=$(wmctrl -l | egrep -o 0x[0-9a-fA-F]+)
done
wmctrl -ir $WID -b add,maximized_vert,maximized_horz

# Dump IDs to lockfiles so we know to restart next time
echo $WID > build/gtkwave
echo $GTKWAVE > build/gtkwave.pid

rm -f build/netlist.svg build/netlist.v netlist.svg
yosys run.ys && node_modules/.bin/netlistsvg build/netlist.json -o build/netlist.svg

