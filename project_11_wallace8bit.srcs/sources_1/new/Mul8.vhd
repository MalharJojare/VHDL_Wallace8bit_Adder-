library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mul8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           prod : out STD_LOGIC_VECTOR (15 downto 0));
end Mul8;

architecture Behavioral of Mul8 is
component Full_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;

component Half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;
signal s0,s1,s2,s3,s4,s5,s6,s7:STD_LOGIC;
signal c0,c1,c2,c3,c4,c5,c6,c7:STD_LOGIC;
signal SA0,SA1,SA2,SA3,SA4,SA5,SA6,SA7:STD_LOGIC;
signal CA0,CA1,CA2,CA3,CA4,CA5,CA6,CA7:STD_LOGIC;
signal e0,e1,e2,e3,e4,e5,e6,e7:STD_LOGIC;
signal f0,f1,f2,f3,f4,f5,f6,f7:STD_LOGIC;
signal i0,i1,i2,i3,i4,i5,i6,i7:STD_LOGIC;
signal k0,k1,k2,k3,k4,k5,k6,k7:STD_LOGIC;
signal ia0,ia1,ia2,ia3,ia4,ia5,ia6,ia7,ia8,ia9:STD_LOGIC;
signal ka0,ka1,ka2,ka3,ka4,ka5,ka6,ka7,ka8:STD_LOGIC;
signal m0,m1,m2,m3,m4,m5,m6,m7,m8,m9:STD_LOGIC;
signal n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10:STD_LOGIC;
signal na0,na1,na2,na3,na4,na5,na6,na7,na8,na9,na10:STD_LOGIC;
signal ma0,ma1,ma2,ma3,ma4,ma5,ma6,ma7,ma8,ma9,ma10:STD_LOGIC;
signal ba0,ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8,ba9,ba10:STD_LOGIC;
signal b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10:STD_LOGIC;
signal p0,p1,p2,p3,p4,p5,p6,p7 : std_logic_vector(7 downto 0);
begin
process(A,B)
begin
    for i in 0 to 7 loop
        p0(i) <= A(i) and B(0);
        p1(i) <= A(i) and B(1);
        p2(i) <= A(i) and B(2);
        p3(i) <= A(i) and B(3);
        p4(i) <= A(i) and B(4);
        p5(i) <= A(i) and B(5);
        p6(i) <= A(i) and B(6);
        p7(i) <= A(i) and B(7);
    end loop;       
end process;
prod(0) <= p0(0);
prod(1) <= s0;
prod(2) <= i0;
prod(3) <= m0;
prod(4) <= ma0;
prod(5) <= ba0;
prod(6) <= ba1;
prod(7) <= ba2;
prod(8) <= ba3;
prod(9) <= ba4;
prod(10) <= ba5;
prod(11) <= ba6;
prod(12) <= ba7;
prod(13) <= ba8;
prod(14) <= ba9;
prod(15) <= ba10;

--first stage
--1st group
ha11: Half_adder port map(p0(1),p1(0),s0,c0);
fa11: Full_adder port map(p0(2),p1(1),p2(0),s1,c1);
fa12: Full_adder port map(p0(3),p1(2),p2(1),s2,c2);
fa13: Full_adder port map(p0(4),p1(3),p2(2),s3,c3);  
fa14: Full_adder port map(p0(5),p1(4),p2(3),s4,c4);
fa15: Full_adder port map(p0(6),p1(5),p2(4),s5,c5);
fa16: Full_adder port map(p0(7),p1(6),p2(5),s6,c6);
ha12: Half_adder port map(p1(7),p2(6),s7,c7);
--2nd group
ha21: Half_adder port map(p3(1),p4(0),SA0,CA0);
fa21: Full_adder port map(p3(2),p4(1),p5(0),SA1,CA1);
fa22: Full_adder port map(p3(3),p4(2),p5(1),SA2,CA2);
fa23: Full_adder port map(p3(4),p4(3),p5(2),SA3,CA3);
fa24: Full_adder port map(p3(5),p4(4),p5(3),SA4,CA4);
fa25: Full_adder port map(p3(6),p4(5),p5(4),SA5,CA5);
fa26: Full_adder port map(p3(7),p4(6),p5(5),SA6,CA6);
ha22: Half_adder port map(p4(7),p5(6),SA7,CA7);
--3rd group
ha31: Half_adder port map(p6(1),p7(0),e0,f0);
ha32: Half_adder port map(p6(2),p7(1),e1,f1);
ha33: Half_adder port map(p6(3),p7(2),e2,f2);
ha34: Half_adder port map(p6(4),p7(3),e3,f3);
ha35: Half_adder port map(p6(5),p7(4),e4,f4);
ha36: Half_adder port map(p6(6),p7(5),e5,f5);
ha37: Half_adder port map(p6(7),p7(6),e6,f6);
--2nd stage
--1st group
ha41: Half_adder port map(c0,s1,i0,k0);
fa41: Full_adder port map(c1,s2,p3(0),i1,k1);
fa42: Full_adder port map(c2,s3,SA0,i2,k2);
fa43: Full_adder port map(c3,s4,CA0,i3,k3);
fa44: Full_adder port map(c4,s5,CA1,i4,k4);
fa45: Full_adder port map(c5,s6,CA2,i5,k5);
fa46: Full_adder port map(c6,s7,CA3,i6,k6);
fa47: Full_adder port map(c7,p2(7),CA4,i7,k7);
--2nd group
ha51: Half_adder port map(SA2,p6(0),ia0,ka0);
ha52: Half_adder port map(SA3,e0,ia1,ka1);
fa51: Full_adder port map(SA4,f0,e1,ia2,ka2);
fa52: Full_adder port map(SA5,f1,e2,ia3,ka3);
fa53: Full_adder port map(SA6,f2,e3,ia4,ka4);
fa54: Full_adder port map(SA7,f3,e4,ia5,ka5);
fa55: Full_adder port map(p5(7),f4,e5,ia6,ka6);
ha53: Half_adder port map(f5,e6,ia7,ka7);
ha54: Half_adder port map(f6,p7(7),ia8,ka8);
--3rd Stage

ha61: Half_adder port map(k0,i1,m0,n0);
ha62: Half_adder port map(k1,i2,m1,n1);
fa61: Full_adder port map(k2,i3,sa1,m2,n2);
fa62: Full_adder port map(k3,i4,ia1,m3,n3);
fa63: Full_adder port map(k4,i5,ka1,m4,n4);
fa64: Full_adder port map(k5,i6,ka2,m5,n5);
fa65: Full_adder port map(k6,i7,ka3,m6,n6);
fa66: Full_adder port map(k7,ca5,ka4,m7,n7);
ha63: Half_adder port map(ca6,ka5,m8,n8);
ha64: Half_adder port map(ca7,ka6,m9,n9);

--final stage
--1st part
ha71: Half_adder port map(m1,n0,ma0,na0);
ha72: Half_adder port map(m2,n1,ma1,na1);
ha73: Half_adder port map(m3,n2,ma2,na2);
fa71: Full_adder port map(n3,m4,ia2,ma3,na3);
fa72: Full_adder port map(n4,m5,ia3,ma4,na4);
fa73: Full_adder port map(n5,m6,ia4,ma5,na5);
fa74: Full_adder port map(n6,m7,ia5,ma6,na6);
fa75: Full_adder port map(n7,m8,ia6,ma7,na7);
fa76: Full_adder port map(n8,m9,ia7,ma8,na8);
fa77: Full_adder port map(n9,ka7,ia8,ma9,na9);
fa78: Full_adder port map(n10,ka8,ma10,na10);
--2nd part
ha81: Half_adder port map(ma1,na0,ba0,b0);
fa81: Full_adder port map(ma2,na1,b0,ba1,b1);
fa82: Full_adder port map(ma3,na2,b1,ba2,b2);
fa83: Full_adder port map(ma4,na3,b2,ba3,b3);
fa84: Full_adder port map(ma5,na4,b3,ba4,b4);
fa85: Full_adder port map(ma6,na5,b4,ba5,b5);
fa86: Full_adder port map(ma7,na6,b5,ba6,b6);
fa87: Full_adder port map(ma8,na7,b6,ba7,b7);
fa88: Full_adder port map(ma9,na8,b7,ba8,b8);
fa89: Full_adder port map(ma10,na9,b8,ba9,b9);
ha82: Half_adder port map(b9,na10,ba10,b10);
end Behavioral;
