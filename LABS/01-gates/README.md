<h1>LABS01 gates</h1>

<h2>1. Verification of De Morgan's laws</h2>

```vhdl
entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;
        c_i	   : in  std_logic;			-- Data input
        f_o    : out std_logic; 
        fnand_o: out std_logic;								  -- OR output function
        --for_o  : out std_logic         -- AND output function
        --fxor_o : out std_logic          -- XOR output function
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    f_o     <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o <= a_i;
    --for_o   <= a_i and b_i;
    --fxor_o <= a_i xor b_i;

end architecture dataflow;

```


