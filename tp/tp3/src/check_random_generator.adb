with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Alea;

procedure Check_Random_Generator is
	
	package Mon_Alea is
		new Alea (1, 9);
	use Mon_Alea;

	Capacity : Constant Integer := 256;
	Type T_List is array(1..Capacity) of Integer;
	Type T_Generator is record
		List : T_List;
		Length : Integer; -- { 10 <= Length <= Capacity }
	end record;
	Generator : T_Generator;
	Length : Integer;
	Possibilities : Integer;
	
	procedure Handle_Error_Input ( Length : In Integer) is
	begin
		if Length = 0 then
                        New_Line(1);
                        Put_Line("Error : Length should be greater than 10 and least than" & Integer'Image(Capacity) & ".");
                        Put_Line("Your have not generated any number.");
                        Put_Line("Please try again!");
                elsif Length > 0 and Length < 10 then
                        New_Line(1);
                        Put_Line("Error : Length should be greater than 10 and least than" & Integer'Image(Capacity) & ".");
                        Put_Line("Your sample is too small.");
                        Put_Line("Please try again!");
                elsif Length < 0 then
                        New_Line(1);
                        Put_Line("Error : Length should be greater than 10 and least than" & Integer'Image(Capacity) & ".");
                        Put_Line("Please try again!");
                end if;
	end Handle_Error_Input;
		

	function Init_Generator ( Length : In Integer) return T_Generator is
		Generator : T_Generator;
	begin
		Generator.Length := Length;
		for i in 1..Generator.Length loop
			Get_Random_Number (Generator.List(i));		
		end loop;
		return Generator;
	end Init_Generator;

	procedure Print_Generator( Generator : In T_Generator) is
	begin
		for i in 1 .. Generator.Length loop
			Put(Integer'Image(Generator.List(i)));
		end loop;
	end Print_Generator;

	function Absolute_Frequency_Theoretical (Length, Possibilities : In Integer) return Float is
		Abs_Frequency : Float;
	begin
		Abs_Frequency := Float(Length) / Float(Possibilities);
		return Abs_Frequency;
	end Absolute_Frequency_Theoretical;
	
	function Occurrence ( Generator : In T_Generator; Item : In Integer) return Integer is
		Count : Integer;
	begin
		Count := 0;
		for i in 1..Generator.Length loop
			if Generator.List(i) = Item then
				Count := Count + 1;
			end if;
		end loop;
		return Count;
	end Occurrence;

	function Max_Frequency (Generator : In T_Generator) return Integer is
                Maxi_Frequency : Integer;
        begin
		Maxi_Frequency := Occurrence (Generator, Generator.List(1));
                for i in 2..Generator.Length loop
			if Occurrence (Generator, Generator.List(i)) > Maxi_Frequency then
				Maxi_Frequency := Occurrence (Generator, Generator.List(i));
			end if;
		end loop;
                return Maxi_Frequency;
        end Max_Frequency;
	
	function Min_Frequency (Generator : In T_Generator) return Integer is
        	Mini_Frequency : Integer;
	begin
		Mini_Frequency := Occurrence (Generator, Generator.List(1));
                for i in 2..Generator.Length loop
                        if Occurrence (Generator, Generator.List(i)) < Mini_Frequency then
                                Mini_Frequency := Occurrence (Generator, Generator.List(i));
                        end if;
                end loop;
                return Mini_Frequency;
        end Min_Frequency;

begin
	Possibilities := 9;

	Put_Line("********************Check random generator*********************");
	New_Line(1);
	Get_Length:
	loop
		Put("Enter the length of your generator, length should be least than" & Integer'Image(Capacity) & " : ");
		Get(Length);
		Handle_Error_Input ( Length);
		New_Line(1);
		exit Get_Length when Length >= 10;
	end loop Get_Length;

	Generator := Init_Generator (Length);
	Print_Generator (Generator);

	New_Line(2);
	Put_Line("Absolute frequency theoretical :" & Float'Image(Absolute_Frequency_Theoretical (Length, Possibilities))); 
	Put_Line("Maximal frequency :" & Integer'Image(Max_Frequency (Generator)));
	Put_Line("Minimal frequency :" & Integer'Image(Min_Frequency (Generator)));

	New_Line(2);
	Put_Line("****************************GOODBYE****************************");

end Check_Random_Generator;
