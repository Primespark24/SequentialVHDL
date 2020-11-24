-----------------------------------------------
-- BEN GREENWOOD
-- WITH HELP FROM TYLER GAMLEM, BRYCEN MARTIN
-- Module Name:    divideby3FSM 
-- A true divide by 3 clock with 50% duty cycle
-----------------------------------------------
library IEEE; use IEEE.STD_LOGIC_1164.ALL;

entity divideby3FSM_50 is
    port ( clk :   in  STD_LOGIC;
           reset : in  STD_LOGIC;
           yy :    out  STD_LOGIC);
end divideby3FSM_50;

architecture Behavioral of divideby3FSM_50 is
   component fflipflop is
      Port ( d : in STD_LOGIC;
             reset : in STD_LOGIC;
             clk : in STD_LOGIC;
             y : out STD_LOGIC;
             noty : out STD_LOGIC);
  end component;
  
   -- create signals here to wire the hardware edge
   -- triggered latches together
   signal notay, notby, b1, by, cy: STD_LOGIC;


begin
   -- Edge Triggered Latch A goes here
   A : fflipflop port map(clk => clk, reset => reset, d => notay and notby, y => b1, noty => notay);
   -- Edge Triggered Latch B goes here
   B : fflipflop port map (clk => clk, reset => reset, d => b1, y => by, noty => notby);
   -- Edge Triggered Latch C goes here
   C : fflipflop port map (clk => not clk, reset => reset, d=> by, y => cy);
   -- Generate the output signal y here
	yy <= by or cy;
end Behavioral;