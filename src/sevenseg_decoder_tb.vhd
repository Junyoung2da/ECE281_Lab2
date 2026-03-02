----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2026 10:41:07 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is

    -- declare the component of your top-level design unit under test (UUT)
    component sevenseg_decoder is
        Port ( 
            i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
            o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
            );
        end component sevenseg_decoder;
    
    -- These signals will be wired to match the sevenseg truth table
    signal w_in     :   std_logic_vector(3 downto 0);
    signal w_out    :   std_logic_vector(6 downto 0);


begin
    -- PORT MAPS ----------------------------------------------------------
    sevenseg_decoder_uut: sevenseg_decoder
    port map(
    i_Hex(0)    => w_in(0),
    i_Hex(1)    => w_in(1),
    i_Hex(2)    => w_in(2),
    i_Hex(3)    => w_in(3),
    o_seg_n(0)  => w_out(0),
    o_seg_n(1)  => w_out(1),
    o_seg_n(2)  => w_out(2),
    o_seg_n(3)  => w_out(3),
    o_seg_n(4)  => w_out(4),
    o_seg_n(5)  => w_out(5),
    o_seg_n(6)  => w_out(6)
    );
    
    
    -- PROCESS---------------------------------------
    -- Test plan process
    -- Testing each combination of i_Hex
    test_process: process
    begin
        -- do the test stuff
        w_in <=  "0000";wait for 10 ns;
            assert w_out = "1000000" report "error on 0" severity failure;
        w_in <=  "0001";wait for 10 ns;
            assert w_out = "1111001" report "error on 1" severity failure;
        w_in <=  "0010";wait for 10 ns;
            assert w_out = "0100100" report "error on 2" severity failure;
        w_in <=  "0011";wait for 10 ns;
            assert w_out = "0110000" report "error on 3" severity failure;
        w_in <=  "0100";wait for 10 ns;
            assert w_out = "0011001" report "error on 4" severity failure;
        w_in <=  "0101";wait for 10 ns;
            assert w_out = "0010010" report "error on 5" severity failure;
        w_in <=  "0110";wait for 10 ns;
            assert w_out = "0000010" report "error on 6" severity failure;
        w_in <=  "0111";wait for 10 ns;
            assert w_out = "1111000" report "error on 7" severity failure;
        w_in <=  "1000";wait for 10 ns;
            assert w_out = "0000000" report "error on 8" severity failure;
        w_in <=  "1001";wait for 10 ns;
            assert w_out = "0011000" report "error on 9" severity failure;
        w_in <=  "1111";wait for 10 ns;
            assert w_out = "1111111" report "error on other" severity failure;
        wait; -- wait forever
    
    end process;


end test_bench;
