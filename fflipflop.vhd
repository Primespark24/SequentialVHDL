-- making a flipflop to use in our divByThree
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fflipflop is
    Port ( d : in STD_LOGIC;    --there is 4 parts to this flipflip
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           y : out STD_LOGIC;
           noty : out std_logic);
end fflipflop;

architecture fflipflop of fflipflop is
begin
    process (clk, reset, d) begin       --makes a process using those parts
    -- ERROR: if reset <= '1' then y <= '0'; noty <= '1';        --if there was  a reset, y should be 1
    -- You were checking if reset was less than or equal to 1 
    if reset = '1' then y <= '0'; noty <= '1';        --if there was  a reset, y should be 1
    elsif rising_edge(clk) then y <= d; noty <= not d; --if there wasn't a reset and the clk went high, then make y to d
    end if;
end process;

end fflipflop;