# MUX 2bit 4 to 1
## Preparation done at home

| **LED** | **Connection** | **Switch** | **Connection** | 
| :-: | :-: | :-: | :-: |
| LED0 | H17 | SW0 | J15 |
| LED1 | K15 | SW1 | L16 |
| LED2 | J13 | SW2 | M13 |
| LED3 | N14 | SW3 | R15 |
| LED4 | R18 | SW4 | R17 |
| LED5 | V17 | SW5 | T18 |
| LED6 | U17 | SW6 | U18 |
| LED7 | U16 | SW7 | R13 |
| LED8 | V16 | SW8 | T8 |
| LED9 | T15 | SW9 | U8 |
| LED10 | U14 | SW10 | R16 |
| LED11 | T16 | SW11 | T13 |
| LED12 | V15 | SW12 | H6 |
| LED13 | V14 | SW13 | U12 |
| LED14 | V12 | SW14 | U11 |
| LED15 | V11 | SW15 | V10 |

## VHDL implementation using VIVADO

```vhdl
entity mux_2bit_4to1 is
port(
    a_i  : in  std_logic_vector (2-1 downto 0);
    b_i  : in  std_logic_vector (2-1 downto 0);
    c_i  : in  std_logic_vector (2-1 downto 0);
    d_i  : in  std_logic_vector (2-1 downto 0);
    sel_i: in  std_logic_vector (2-1 downto 0);
    f_o  : out std_logic_vector (2-1 downto 0)
    );
end mux_2bit_4to1;

architecture Behavioral of mux_2bit_4to1 is
begin
    f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i; 
end Behavioral;
```

``` vhdl
p_stimulus : process 
begin 
    report "Stimulus process started" severity note;

    s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00"; s_sel <= "00"; wait for 100 ns;
        
    s_a <= "00"; wait for 100 ns;
    s_b <= "01"; wait for 100 ns;
        
    s_sel <= "01"; wait for 100 ns;
    s_c <= "00"; wait for 100 ns;
    s_b <= "11"; wait for 100 ns;  
        
    s_d <= "11";  s_c <= "11"; s_b <= "01"; s_a <= "00"; 
    s_sel <= "10"; wait for 100 ns;  
        
    s_d <= "00";  s_c <= "00"; s_b <= "00"; s_a <= "01"; 
    s_sel <= "10"; wait for 100 ns;  
        
    s_d <= "11";  s_c <= "11"; s_b <= "01"; s_a <= "00"; 
    s_sel <= "11"; wait for 100 ns;  
               
        -- Report a note at the end of stimulus process
    report "Stimulus process finished" severity note;
    wait;
end process p_stimulus;
```
## Screenshot of the simulation

![MUX 2bit 4to1 simulation](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/simulationSceenshot.png)


# VIVADO tutorial

## 1. create new project
![first step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/1.png)

![second step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/2.png)

Assign project your desired name
![third step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/3.png)

Select type of project
![fourth step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/4.png)

Create a new source file for your project
![fifth step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/5_0.png)
![fifth step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/5_1.png)

You can skip adding constraints as this is optional
![sixth stpe](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/6.png)

Now you need to add board to your project we are going to choose Nexys A7-50T
![seventh step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/7.png)
After this step this is how your screen should look like
![eigth step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/8.png)


After clicking finish you will have to wait for a bit but after few second pop up should show to you with. After you see it hit ok
![nineth step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/9.png)

After completing all thise steps we need to add simulation source file which is done like this

Click file

![tenth step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/10.png)
and click add Sourcess

Pop up should show up with three options. Choose "add or create simulation sources"
![eleventh step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/11.png)

Now create simulation file
![step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/12.png)

This is important, dont forget to set file as VHDL and before file name ad <b>tb_</b> as shown in the image
![step](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/13.png)

And after this we are done look and sources and if they match this image we are done
![finale](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/03-vivado/images/done.png)
