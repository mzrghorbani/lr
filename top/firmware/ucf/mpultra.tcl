# Area constraints for generic MP7 payload

for {set i 0} {$i < 9} {incr i} {
    set y_low [expr 480 - 60*$i]
    set y_high [expr 539 - 60*$i]

    create_pblock LR$i
    set lpblock [get_pblocks LR$i]

    resize_pblock $lpblock -add SLICE_X15Y${y_low}:SLICE_X127Y${y_high}

    set_property PARENT payload $lpblock
    
}

for {set i 0} {$i < 9} {incr i} {

    set p1 [expr 2*$i + 0]
    set p2 [expr 2*$i + 1]

    set lpblock [get_pblocks LR$i]
    set lcells1 [get_cells payload/cLR/gN[$p1].c]
    set lcells2 [get_cells payload/cLR/gN[$p2].c]

    add_cells_to_pblock $lpblock $lcells1
    add_cells_to_pblock $lpblock $lcells2
   
}

