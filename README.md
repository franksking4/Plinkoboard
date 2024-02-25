#### Plinko Verilog Simulation

In Plinko, a ball is dropped and bounces off of pegs until it falls into one of many cubbies.

![image](https://github.com/franksking4/Plinkoboard/assets/74384543/d34978f4-2bc8-4087-8d1a-4eff55c958d0)

The middle cubby has the highest percentage of being dropped into by the ball. After that, the cubbies to the left and right of the middle cubby both have the second highest percentage of being dropped into by the ball. Therefore, the cubby at the left and right ends of the board have the lowest percentage of being dropped into by the ball. This can be modeled by a graph of probability distribution

![image](https://github.com/franksking4/Plinkoboard/assets/74384543/bbba3160-0a57-4ba6-91ef-86df1a2893c8)

My goal was to implement the probability distribution graph of a Plinkoboard using Verilog. To do this, I constructed a module that takes in a clock and reset input as well as a random number that is 7 bits long. To find which cubby the ball should fall into, I created a for-loop to count the number of 1s in the number when in binary. If there were no 1s in the number, the ball would fall into the first cubby, if there was one 1, the ball would fall into the second cubby, and so on. The module outputs the count of how many balls have fallen into each of the cubby. I used a testbench to see what would happen if 80 balls were dropped

### Testbench:

![image](https://github.com/franksking4/Plinkoboard/assets/74384543/75f59b92-eb3b-429b-a1be-7a1f6c9370d5)

As expected, the center two cubbies had the most balls while the left-most and right-most cubbies had the least balls.

### Netlist:

![image](https://github.com/franksking4/Plinkoboard/assets/74384543/b1f2f6bf-197a-4430-8f67-4a2aadae9b7e)
