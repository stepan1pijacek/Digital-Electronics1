<h1>LABS01 gates</h1>

<h2>1. Verification of De Morgan's laws</h2>
<h3> VHDL implementation</h3>

```vhdl
architecture dataflow of gates is
begin
    f_o     <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o <= not (not (not b_i and a_i) and not(not b_i and not c_i));
    fnor_o   <= (not (b_i or not a_i)) or (not (c_i or b_i));

end architecture dataflow;

```
### Logical table


| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |

### Time waveforms
![De Morgans laws] (images/deMoragnsLawWF.png)

### Link to EDA playground
https://www.edaplayground.com/x/sjDZ

<h2> Verfication of Distributive laws </h2>
