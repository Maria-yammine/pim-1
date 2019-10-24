-- Implantation du module Ensembles.

with Ada.Unchecked_Deallocation;

package body Ensembles_Chainage is
    
    -- Libérer la mémoire alloué auparavant.
    procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule, T_Ensemble);

    procedure Initialiser (Ensemble : out T_Ensemble) is
    begin
        Ensemble := Null;
    end Initialiser;

    procedure Detruire (Ensemble : in out T_Ensemble) is
    begin
        if (Ensemble /= Null) then
		Detruire (Ensemble.all.Suivant);
		Free (Ensemble);
	else
		null;
	end if;
    end Detruire;

    function Est_Vide (Ensemble : in T_Ensemble) return Boolean is
    begin
        return Ensemble = Null;
    end Est_Vide;

    function Taille (Ensemble : in T_Ensemble) return Integer is
    	Count : Integer;
    	Temp : T_Ensemble;
    begin
    	Count := 0;
	Temp := Ensemble;
	
	while (Temp /= Null) loop
		Count := Count + 1;
		Temp := Temp.all.Suivant;
	end loop;

        return Count;
    end Taille;

    function Est_Present (Ensemble : in T_Ensemble; Element : in T_Element) return Boolean is
        present : Boolean;
	Temp : T_Ensemble;
    begin
        present := False;
        Temp := Ensemble;

	while (Temp /= Null) loop
                if (Temp.all.Element = Element) then
                	present := True;
            	end if;
                Temp := Temp.all.Suivant;
        end loop;

        return present;
    end Est_Present;

    procedure Ajouter (Ensemble : in out T_Ensemble; Element : in T_Element) is
    	Nouvelle_Cellule, Temp : T_Ensemble;
    begin
    	-- Créer une nouvelle cellule
    	Nouvelle_Cellule := New T_Cellule;
	Nouvelle_Cellule.all.Element := Element;
	Nouvelle_Cellule.all.Suivant := Null;

        if ( Ensemble = Null) then -- Si l'ensemble est vide.
		Ensemble := Nouvelle_Cellule; 
	else -- Sinon, on ajoute à la fin de l'ensemble.
		Temp := Ensemble;

        	while (Temp.all.Suivant /= Null) loop
              
                	Temp := Temp.all.Suivant;
        	end loop;
		Temp.all.Suivant := Nouvelle_Cellule;
	end if;
    end Ajouter;

    procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) is
        Temp, Precedent : T_Ensemble;
    begin
    	Temp := Ensemble;

        if (Temp.all.Element = Element) then
		Ensemble := Temp.all.Suivant;
		Free (Temp);
	end if;
	
	while ( Temp /= Null and then Temp.all.Element /= Element) loop
		Precedent := Temp;
		Temp := Temp.all.Suivant;
	end loop;
	
	if (Temp /= Null) then -- Si Element est dans Ensemble.
		Precedent := Temp.all.Suivant;
		Free (Temp); -- Libérer Temp.
	else -- Si Element n'est pas trouvé donc on fait rien.
		Null;
	end if;
	
    end Supprimer;

    procedure Appliquer_Sur_Tous (Ensemble : in T_Ensemble) is
    	Temp : T_Ensemble;
    begin
    	while (Temp /= NULL) loop
		Operation (Temp.all.Element);
        	Temp := Temp.all.Suivant;
    	end loop;
    end Appliquer_Sur_Tous;

end Ensembles_Chainage;
