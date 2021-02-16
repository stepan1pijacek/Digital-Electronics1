<h1>LABS01 gates</h1>

<h2>1. Verification of De Morgan's laws</h2>
<h3>Equations</h3>
f(c, b, a) = !b * a + !c * !b <br />
f(c, b, a)NAND = !(!(!b * a) * !(!b * !c)) <br />
f(c, b, a)NOR = !(b + !a) + !(c + b) <br />
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
![De Morgans laws](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/01-gates/images/deMoragnsLawWF.png)

### Link to EDA playground
https://www.edaplayground.com/x/sjDZ

<h2>2. Verfication of Distributive laws </h2>
<br />
<h3> Equations </h3>
x*y + x*z = x*(y + z) <br />
(x + y)*(x + z) = x + (y*z) <br />
<h3>VHDL implementation</h3>
<br />

```vhdl
architecture dataflow of gates is
begin
    f0_o <= (a_i and b_i) or (a_i and c_i);
    f1_o <= a_i and (b_i or c_i);
    f2_o <= (a_i or b_i) and (a_i or c_i);
    f3_o <= a_i or (b_i and c_i);
end architecture dataflow;
```
<h3>Time waveforms</h3>
![Distribution laws](https://github.com/stepan1pijacek/Digital-Electronics1/blob/main/LABS/01-gates/images/distributionLaws.png)

<h3> Link to EDA playground </h3>
https://www.edaplayground.com/x/mbre
