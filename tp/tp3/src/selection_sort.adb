with Ada.Text_IO;
use Ada.Text_IO;
with Alea;

procedure Selection_Sort is

	Capacity : Constant Integer := 32;
	package Mon_Alea is
		new Alea (2, Capacity);
	use Mon_Alea;
	Type T_List is Array (1..Capacity) of Integer;
	Type T_Vector is record
		List : T_List;
		Length : Integer; -- { 1 < Length <= Capacity }
	end record;
	Sorted, Vector : T_Vector;

	function Init_Vector return T_Vector is
		Vector : T_Vector;
	begin
		Get_Random_Number( Vector.Length);
		for i in 1..Vector.Length loop
			Get_Random_Number(Vector.List(i));
		end loop;
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

	
	function Sort_Vector (Vector : In Out T_Vector) return T_Vector is
		Init_Index : Integer;
	begin
		Init_Index := 1;
		Put("----------Initial vector : ");
       		Print_Vector(Vector);
		Put_Line(" ----------");
        	Sort_Vector:
        	loop
                	New_Line(2);
                	Vector.List := Permute(Vector.List, Min_Index_Vector(Vector.List, Init_Index, Vector.Length), Init_Index);
                	Put("After"& Integer'Image(Init_Index) & " step : ");
                	Print_Vector(Vector);
                	Init_Index := Init_Index + 1;
                	exit Sort_Vector when Init_Index = Vector.Length;
        	end loop Sort_Vector;
		return Vector;
	end Sort_Vector;
	
	procedure Check_Sorted_Vector (Vector : In T_Vector) is
	begin
		for i in 1..(Vector.Length - 1) loop
			if Vector.List(i) > Vector.List(i + 1) then
				Put_Line("Error in the program");
			end if;
		end loop;
	end Check_Sorted_Vector;
	
	function Occurrence ( Vector : In T_Vector; Item : In Integer) return Integer is
		Count : Integer;
	begin
		Count := 0;
		for i in 1..Vector.Length loop
			if Vector.List(i) = Item then
				Count := Count + 1;
			end if;
		end loop;
		return Count;
	end Occurrence;
	
	procedure Check_Items ( Sorted, Vector : IN T_Vector) is
	begin
		for i in 1..Sorted.Length loop
			for j in 1..Vector.Length loop
				if Sorted.List(i) = Vector.List(j) and Occurrence ( Vector, Vector.List(j)) /= Occurrence ( Sorted, Sorted.List(j)) then
					Put_Line("Error in the program");
				end if;
                	end loop;
		end loop;
	end Check_Items;

	procedure Check_Length ( Sorted, Vector : In T_Vector) is
        begin
                if Sorted.Length /= Vector.Length then
                        Put_Line("Error in the program");
                end if;
        end Check_Length;


begin	
	Put_Line("************************Selection sort ************************");
	New_Line(1);
	for i in 1..5 loop
		Vector := Init_Vector;
		Sorted := Sort_Vector ( Vector);
		Check_Sorted_Vector ( Sorted);
		Check_Length ( Sorted, Vector);
		Check_Items ( Sorted, Vector);
		New_Line(2);
	end loop;
	Put_Line("****************************GOODBYE****************************");
end Selection_Sort;
