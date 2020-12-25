# Case 1 - No jump, No branch
# The pc should simply be incremented by 1
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "00"
force pc_sel "00"
force rt "00000000000000000000000000000000"
force rs "00000000000000000000000000000000"
run 2
examine next_pc

# Case 2 - jump
# next_pc should hold a value of the target_address (sign extended)
force pc x"00000000"
force target_address "00000000000000000000001111"
force branch_type "00"
force pc_sel "01"
force rt "00000000000000000000000000000000"
force rs "00000000000000000000000000000000"
run 2
examine next_pc

# Case 3 - jump register
# next_pc should hold a value of rs
force pc x"00000000"
force target_address "00000000000000000000000000"
force branch_type "00"
force pc_sel "10"
force rt "00000000000000000000000000000000"
force rs "00000000000000000000000000101010"
run 2
examine next_pc

# Case 4 - beq (condition true)
# Here rt is equal to rs, thus the beq condition is true
# The branch should execute
force pc x"00000000"
force target_address "00000000000000000011111111"
force branch_type "01"
force pc_sel "00"
force rt "00000000000000000000000000001111"
force rs "00000000000000000000000000001111"
run 2
examine next_pc

# Case 5 - beq (condition false)
# Here rt is NOT equal to rs, thus the beq condition is false
# The branch should NOT execute
force pc x"00000000"
force target_address "00000000000000000011111111"
force branch_type "01"
force pc_sel "00"
force rt "00000000000000000000000000000000"
force rs "00000000000000000000000000001111"
run 2
examine next_pc

# Case 6 - bne (condition true)
# Here rt is NOT equal to rs, thus the bne condition is true
# The branch should execute
force pc x"00000000"
force target_address "00000000000000000011111111"
force branch_type "10"
force pc_sel "00"
force rt "00000000000000000000000000000000"
force rs "00000000000000000000000000001111"
run 2
examine next_pc

# Case 7 - bne (condition false)
# Here rt is equal to rs, thus the bne condition is false
# The branch should NOT execute
force pc x"00000000"
force target_address "00000000000000000011111111"
force branch_type "10"
force pc_sel "00"
force rt "00000000000000000000000000001111"
force rs "00000000000000000000000000001111"
run 2
examine next_pc

# Case 8 - bltz (condition true)
# Here rs is a negative value (MSB = 1)
# Hence the bltz condition is true
# The branch should execute
force pc x"00000000"
force target_address "00000000000000000011111111"
force branch_type "11"
force pc_sel "00"
force rt "00000000000000000000000000001111"
force rs "11111111111111111111111111111111"
run 2
examine next_pc

# Case 9 - bltz (condition false)
# Here rs is postive (MSB = 0)
# Hence the bltz condition is false
# The branch should NOT execute
force pc x"00000000"
force target_address "00000000000000000011111111"
force branch_type "11"
force pc_sel "00"
force rt "00000000000000000000000000001111"
force rs "01111111111111111111111111111111"
run 2
examine next_pc