# 7 segment

## Truth table for common anode 7 segment
| Hex | Inputs | A | B | C | D | E | F | G |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
| 2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
| 5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 7 | 0111 | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
| 8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 9 | 1001 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| b | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
| d | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
| E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
| F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |

## Listing of VHDL architecture from source file hex_7seg.vhd
```vhdl
architecture Behavioral of hex_7seg is

begin
    p_7seg_decoder : process(hex_i)
    begin
        case hex_i is
            when "0000" => seg_o <= "0000001";
            when "0001" => seg_o <= "1001111";
            when "0010" => seg_o <= "0010010";
            when "0011" => seg_o <= "0000110";
            when "0100" => seg_o <= "1001100";
            when "0101" => seg_o <= "0100100";
            when "0110" => seg_o <= "0100000";
            when "0111" => seg_o <= "0001111";
            when "1000" => seg_o <= "0000000";
            when "1001" => seg_o <= "0000100";
            when "1010" => seg_o <= "0001000";
            when "1011" => seg_o <= "1100000";
            when "1100" => seg_o <= "0110001";
            when "1101" => seg_o <= "1000010";
            when "1110" => seg_o <= "0110000";
            when others => seg_o <= "0111000";
       end case;
   end process p_7seg_decoder;
```

## Listing of VHDL stimulus process from testbench file tb_hex_7seg.vhd
```vhdl
 p_stimulus : process
    begin 
        report "Stimulus process started" severity note;
        s_hex <= "0000"; 
                wait for 100 ns;
        s_hex <= "0001"; 
                wait for 100 ns;
        s_hex <= "0010"; 
                wait for 100 ns;
        s_hex <= "0011"; 
                wait for 100 ns;
        s_hex <= "0100"; 
                wait for 100 ns;
        s_hex <= "0101"; 
                wait for 100 ns;
        s_hex <= "0110"; 
                wait for 100 ns;
        s_hex <= "0111"; 
                wait for 100 ns;
        s_hex <= "1000"; 
                wait for 100 ns;
        s_hex <= "1001"; 
                wait for 100 ns;
         report "Stimulus process finished" severity note;
         wait;
   end process p_stimulus;        
```

## Simulation outcome

![Simulation image](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/04-segment/images/7segPrubeh.png)

# LED(7:4) indicators

## Truth table for LEDs(7:4)

| **Hex** | **Inputs** | **LED4** | **LED5** | **LED6** | **LED7** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0000 | 1 | 0 | 0 | 0 |
| 1 | 0001 | 0 | 0 | 1 | 1 |
| 2 | 0010 | 0 | 0 | 0 | 1 |
| 3 | 0011 | 0 | 0 | 1 | 0 |
| 4 | 0100 | 0 | 0 | 0 | 1 |
| 5 | 0101 | 0 | 0 | 1 | 0 |
| 6 | 0110 | 0 | 0 | 0 | 0 |
| 7 | 0111 | 0 | 0 | 1 | 0 |
| 8 | 1000 | 0 | 0 | 0 | 1 |
| 9 | 1001 | 0 | 0 | 1 | 0 |
| A | 1010 | 0 | 1 | 0 | 0 |
| b | 1011 | 0 | 1 | 1 | 0 |
| C | 1100 | 0 | 1 | 0 | 0 |
| d | 1101 | 0 | 1 | 1 | 0 |
| E | 1110 | 0 | 1 | 0 | 0 |
| F | 1111 | 0 | 1 | 1 | 0 |

## Listing of VHDL code for LEDs(7:4)
```vhdl
AN <= b"1111_0111";
    
    LED(3 downto 0) <= SW;
    
    LED(4) <= '1' when  (SW = "0000") else '0';
    
    LED(5) <= '1' when (SW > "1001") else '0';
    
    LED(6) <= '1' when (SW = "0001" or SW = "0011" or SW = "0111" or SW = "1001" or SW = "1011" or SW = "1101" or SW = "1111") else '0';
    
    LED(7) <= '1' when (SW = "0001" or SW = "0010" or SW = "0100" or SW = "1000") else '0';
```

## Simulation outcome
I am very sorry but i wasnt able to succesfully run this simulation and i dont really know why.
