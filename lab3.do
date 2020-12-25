# Case 1 - No jump, No branch
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "00"
force pc_sel "00"
force rt x"ABCDABCD"
force rs x"ABCDABCD"
run 2
examine -radix hex next_pc

# Case 2 - jump
force pc x"00000000"
force target_address x"AAAAAAAA"
force branch_type "00"
force pc_sel "01"
force rt x"ABCDABCD"
force rs x"ABCDABCD"
run 2
examine -radix hex next_pc

# Case 3 - jump register
force pc x"00000000"
force target_address x"AAAAAAAA"
force branch_type "00"
force pc_sel "10"
force rt x"ABCDABCD"
force rs x"ABCDABCD"
run 2
examine -radix hex next_pc

# Case 4 - beq (condition true)
# Here rt is equal to rs, thus the beq condition is true
# The branch should execute
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "01"
force pc_sel "00"
force rt x"ABCDABCD"
force rs x"ABCDABCD"
run 2
examine -radix hex next_pc

# Case 5 - beq (condition false)
# Here rt is NOT equal to rs, thus the beq condition is false
# The branch should NOT execute
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "01"
force pc_sel "00"
force rt x"FFFFFFFF"
force rs x"ABCDABCD"
run 2
examine -radix hex next_pc

# Case 6 - bne (condition true)
# Here rt is NOT equal to rs, thus the bne condition is true
# The branch should execute
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "10"
force pc_sel "00"
force rt x"FFFFFFFF"
force rs x"ABCDABCD"
run 2
examine -radix hex next_pc

# Case 7 - bne (condition false)
# Here rt is equal to rs, thus the bne condition is false
# The branch should NOT execute
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "10"
force pc_sel "00"
force rt x"ABCDABCD"
force rs x"ABCDABCD"
run 2
examine -radix hex next_pc

# Case 8 - bltz (condition true)
# Here rs = "FFFFFFFF", hex (negative value)
# Hence the bltz condition is true
# The branch should execute
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "11"
force pc_sel "00"
force rt x"ABCDABCD"
force rs x"FFFFFFFF"
run 2
examine -radix hex next_pc

# Case 8 - bltz (condition true)
# Here rs = "00000001", hex (negative value)
# Hence the bltz condition is true
# The branch should NOT execute
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "11"
force pc_sel "00"
force rt x"ABCDABCD"
force rs x"00000001"
run 2
examine -radix hex next_pc