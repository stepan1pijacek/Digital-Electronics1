# LABS 05 Binary counter

## Preparation task

 | **Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** |
 | :-: | :-: | :-: | :-: |
 | 2&nbsp;ms | 200 000 | `x"3_0d40"` | `b"0011_0000_1101_0100_0000"` |
 | 4&nbsp;ms | 400 000 | `x"6_1a80"` | `b"0110_0001_1010_1000_0000"` |
 | 10&nbsp;ms | 1 000 000 | `x"f_4240` | `b"1111_0100_0010_0100_0000"` |
 | 250&nbsp;ms | 25 000 000 | `x"17d_7840` | `b"0001_0111_1101_0111_1000_0100_0000"` |
 | 500&nbsp;ms | 50 000 000 | `x"2fa_f080` | `b"0010_1111_1010_1111_0000_1000_0000"` |
 | 1&nbsp;sec | 100 000 000 | `x"5F5_E100"` | `b"0101_1111_0101_1110_0001_0000_0000"` |
 
## VHDL implementation

### `p_cnt_up_down`

```vhdl
p_cnt_up_down : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then               -- Synchronous reset
                s_cnt_local <= (others => '0'); -- Clear all bits

            elsif (en_i = '1') then       -- Test if counter is enabled
                -- TEST COUNTER DIRECTION HERE
                if (cnt_up_i = '1') then
                      s_cnt_local <= s_cnt_local + 1;
                else
                      s_cnt_local <= s_cnt_local - 1;
                end if;

            end if;
        end if;
    end process p_cnt_up_down;
```

### `tb_cnt_up_down.vhd`

```vhdl
p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- Enable counting
        s_en     <= '1';
        
        -- Change counter direction
        s_cnt_up <= '1';
        wait for 380 ns;
        s_cnt_up <= '0';
        wait for 220 ns;

        -- Disable counting
        s_en     <= '0';

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

## Simulation output

![simulation1](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/05-counter16bit/images/prvniSimulace.png)

## Listing of `top.vhd`

```vhdl
entity top is
    Port ( 
           CLK100MHz    : in STD_LOGIC;
           BTNC         : in STD_LOGIC;
           SW           : in STD_LOGIC_VECTOR (1 - 1 downto 0);
           -- prepsat na 16 -1 downto 0 a nakopirovat si clock_enable a cnt_up_down16bit
           LED          : out STD_LOGIC_VECTOR (4 - 1 downto 0);
           CA           : out STD_LOGIC;
           CB           : out STD_LOGIC;
           CC           : out STD_LOGIC;
           CD           : out STD_LOGIC;
           CE           : out STD_LOGIC;
           CF           : out STD_LOGIC;
           CG           : out STD_LOGIC;
           AN           : out STD_LOGIC_VECTOR (8 - 1 downto 0));
end top;

bin_cnt0 : entity work.cnt_up_down
        generic map(
          g_CNT_WIDTH => 4   
        )
        port map(
          clk      => CLK100MHz,
          reset    => BTNC,
          en_i     => s_en,
          cnt_up_i => SW(0),
          cnt_o    => s_cnt
        );
```
