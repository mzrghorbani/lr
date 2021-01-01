# Area constraints for generic MP7 payload

delete_pblocks payload

for { set n 0 } { $n < 18 } { incr n } {mkdir
    create_pblock LR$n
    resize_pblock [get_pblocks LR$n] -add SLICE_X23Y[expr 60 + $n * 30 ]:SLICE_X123Y[expr 89 + $n * 30 ]
    resize_pblock [get_pblocks LR$n] -add DSP48E2_X5Y[expr 24 + $n * 12]:DSP48E2_X22Y[expr 35 + $n * 12]
    resize_pblock [get_pblocks LR$n] -add RAMB18_X3Y[expr 24 + $n * 12]:RAMB18_X14Y[expr 35 + $n * 12]
    resize_pblock [get_pblocks LR$n] -add RAMB36_X3Y[expr 12 + $n * 6]:RAMB36_X14Y[expr 17 + $n * 6]
    add_cells_to_pblock [get_pblocks LR$n] [get_cells payload/cLR/gN[$n].c]
}
