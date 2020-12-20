# Area constraints for generic MP7 payload

#set_input_jitter clk_40_ext 0.5


## the payload constraints below are only valid for the k800 board KU115

# This should prevent the algo entering the infra region, but it seems not to work?
#add_cells_to_pblock [get_pblock payload] payload

#for {set i 0} {$i < 9} {incr i} {
#    set p [expr $i + 1]
#    set a [expr 2 * $i + 0]
#    set b [expr 2 * $i + 1]
#    create_pblock KF${p}
#    add_cells_to_pblock [get_pblocks KF${p}] [get_cells payload/AlgorithmInstance/g1[${a}]*]
#    resize_pblock [get_pblocks KF${p}] -add CLOCKREGION_X3Y${p}:CLOCKREGION_X5Y${p}
#    add_cells_to_pblock [get_pblocks KF${p}] [get_cells payload/AlgorithmInstance/g1[${b}]*]
#    resize_pblock [get_pblocks KF${p}] -add CLOCKREGION_X3Y${p}:CLOCKREGION_X5Y${p}
#}

delete_pblocks payload

for { set n 0 } { $n < 18 } { incr n } {mkdir
    create_pblock KF$n
    resize_pblock [get_pblocks KF$n] -add SLICE_X23Y[expr 60 + $n * 30 ]:SLICE_X123Y[expr 89 + $n * 30 ]
    resize_pblock [get_pblocks KF$n] -add DSP48E2_X5Y[expr 24 + $n * 12]:DSP48E2_X22Y[expr 35 + $n * 12]
    resize_pblock [get_pblocks KF$n] -add RAMB18_X3Y[expr 24 + $n * 12]:RAMB18_X14Y[expr 35 + $n * 12]
    resize_pblock [get_pblocks KF$n] -add RAMB36_X3Y[expr 12 + $n * 6]:RAMB36_X14Y[expr 17 + $n * 6]
    add_cells_to_pblock [get_pblocks KF$n] [get_cells payload/cKF/gN[$n].c]
}
