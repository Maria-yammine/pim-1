with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Selection_Sort is

	Capacity : CONSTANT Integer := 10;
	Type T_List is Array (1..Capacity) of Integer;

	Type T_Vector is record
		List : T_List;
		Length : Integer; -- { 1 < Length <= Capacity }
	end record;

	Vector : T_Vector;
	Number_items : Integer;
	Init_Index : Integer;

	function Init_Vector ( Number_items : in Integer) return T_Vector is
		Vector : T_Vector;
	begin
		Vector.Length := Number_items;
		New_Line(1);
		for i in 1..Number_Items loop
			Put("Type the" & Integer'Image(i) & " item : ");
			Get(Vector.List(i));
		end loop;
		New_Line(1);
		return Vector;
	end Init_Vector;

	procedure Print_Vector( Vector : in T_Vector) is
	begin    
		for i in 1 .. Vector.Length loop
			Put(Integer'Image(Vector.List(i)));
		end loop;
	end Print_Vector;

	function Min_Index_Vector ( List : in T_List; Init_Index, Length : in Integer) return Integer is
		Min : Integer;
	begin
		Min := Init_Index;
		for i in (Init_Index + 1)..Length loop
			if List(i) < List(Min) then
				Min := i;
			end if;
		end loop;
		return Min;
	end Min_Index_Vector;

	function Permute ( List : in out T_list; Min, Init_Index : in Integer) return T_List is
		Temp : Integer;

	begin 
		if Min /= Init_Index then
			Temp := List(Init_Index);
			List(Init_Index) := List(Min);
			List(Min) := Temp;
		end if;
		return List;
	end Permute;

begin
	Init_Index := 1;
	
	Put_Line("************************Selection sort ************************");
	New_Line(1);
	
        Get_Length:
	loop
		Put("Enter the length of your vector, length should be least than" & Integer'Image(Capacity) & " : ");
		Get(Number_Items);
		if Number_Items = 0 then
			New_Line(1);
			Put_Line("Error : Length should be greater than 1 and least than" & Integer'Image(Capacity) & ".");
			Put_Line("Your list is void, you have nothing to sort.");
			Put_Line("Please try again!");
		elsif Number_Items = 1 then
                        New_Line(1);
                        Put_Line("Error : Length should be greater than 1 and least than" & Integer'Image(Capacity) & ".");
			Put_Line("Your list is already sorted, you have just one item.");
                        Put_Line("Please try again!");
		elsif Number_Items < 0 then
			New_Line(1);
			Put_Line("Error : Length should be greater than 1 and least than" & Integer'Image(Capacity) & ".");
			Put_Line("Please try again!");
		end if;
		New_Line(1);
        	exit Get_Length when Number_Items > 1;
	end loop Get_Length;

	Vector := Init_Vector(number_items);

	Put("Initial vector : ");
	Print_Vector(Vector);

	Sort_Vector:
	loop
  	       	New_Line(2);
		Vector.List := Permute(Vector.List, Min_Index_Vector(Vector.List, Init_Index, Vector.Length), Init_Index);
		Put("After"& Integer'Image(Init_Index) & " step : ");
		Print_Vector(Vector);
		Init_Index := Init_Index + 1; 
		exit Sort_Vector when Init_Index = Vector.Length;
	end loop Sort_Vector;
	New_Line(2);
	Put_Line("****************************GOODBYE****************************");

end Selection_Sort;
