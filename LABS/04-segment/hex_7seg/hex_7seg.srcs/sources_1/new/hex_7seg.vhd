----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 15:51:39
-- Design Name: 
-- Module Name: hex_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_7seg is
    Port ( 
           hex_i : in std_logic_vector(4-1 downto 0);
           seg_o : out std_logic_vector(7-1 downto 0)
          );
end hex_7seg;

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
   
end Behavioral;
