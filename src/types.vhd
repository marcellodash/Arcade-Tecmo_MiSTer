-- Copyright (c) 2019 Josh Bassett
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package types is
  subtype byte_t is std_logic_vector(7 downto 0);
  subtype nibble_t is std_logic_vector(3 downto 0);

  -- memory sizes
  constant PROG_ROM_1_ADDR_WIDTH  : natural := 15; -- 32kB
  constant PROG_ROM_2_ADDR_WIDTH  : natural := 14; -- 16kB
  constant PROG_ROM_3_ADDR_WIDTH  : natural := 15; -- 32kB
  constant WORK_RAM_ADDR_WIDTH    : natural := 12; -- 4kB
  constant CHAR_RAM_ADDR_WIDTH    : natural := 11; -- 2kB
  constant CHAR_ROM_ADDR_WIDTH    : natural := 15; -- 32kB
  constant FG_RAM_ADDR_WIDTH      : natural := 10; -- 1kB
  constant FG_ROM_ADDR_WIDTH      : natural := 17; -- 128kB
  constant BG_RAM_ADDR_WIDTH      : natural := 10; -- 1kB
  constant BG_ROM_ADDR_WIDTH      : natural := 17; -- 128kB
  constant SPRITE_RAM_ADDR_WIDTH  : natural := 11; -- 2kB
  constant SPRITE_ROM_ADDR_WIDTH  : natural := 17; -- 128kB
  constant PALETTE_RAM_ADDR_WIDTH : natural := 11; -- 2kB

  -- colour depth
  constant COLOR_DEPTH_R : natural := 4;
  constant COLOR_DEPTH_G : natural := 4;
  constant COLOR_DEPTH_B : natural := 4;

  -- represents a position
  type pos_t is record
    x : unsigned(8 downto 0);
    y : unsigned(8 downto 0);
  end record pos_t;

  -- represents the video signals
  type video_t is record
    -- position
    x : unsigned(8 downto 0);
    y : unsigned(8 downto 0);

    -- sync signals
    hsync : std_logic;
    vsync : std_logic;
    csync : std_logic;

    -- blank signals
    hblank : std_logic;
    vblank : std_logic;

    -- enable video output
    enable : std_logic;
  end record video_t;

  -- represents a RGB colour value
  type rgb_t is record
    r : std_logic_vector(COLOR_DEPTH_R-1 downto 0);
    g : std_logic_vector(COLOR_DEPTH_G-1 downto 0);
    b : std_logic_vector(COLOR_DEPTH_B-1 downto 0);
  end record rgb_t;

  -- represents a sprite
  type sprite_t is record
    bank     : unsigned(3 downto 0);
    code     : unsigned(7 downto 0);
    color    : unsigned(3 downto 0);
    enable   : std_logic;
    flip_x   : std_logic;
    flip_y   : std_logic;
    pos_x    : unsigned(8 downto 0);
    pos_y    : unsigned(8 downto 0);
    priority : unsigned(1 downto 0);
    size     : unsigned(1 downto 0);
  end record sprite_t;
end package types;
