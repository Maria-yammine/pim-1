with Ensembles_Tableau;
with Alea;
with Ada.Text_IO; use Ada.Text_IO;
--with Ada.Float_Text_IO; use Ada.Float_Text_IO;

-- Cette procédire calculera le nombre moyen de tirages qu’il faut
-- faire pour obtenir tous les nombres d’un intervalle entier Min..Max en 
-- utilisant le générateur de nombre aléatoire.
procedure Nombre_Moyen_Tirages_Tableau is
    Min : Constant integer := 10; -- La borne inférieure.
    Max : Constant integer := 20; -- La borne supérieure.
    Essais : Constant integer := 100; -- Le nombre d'essais.
    
    package Mon_Alea is
            new Alea (Max, Max);  -- générateur de nombre dans l'intervalle [1, 10].
    use Mon_Alea;

    package Ensembles_Entiers is
            new Ensembles_Tableau (Capacite => 10, T_Element => Integer);
    use Ensembles_Entiers;
    
    Ensemble : T_Ensemble; -- Déclarer une variable ensemble.
    Moyenne : Float; -- La variable moyenne qui stockera le nombre moyen de tirages.
    n_alea: Integer; -- Le nombre aléatoire généré.
begin
    Initialiser (Ensemble);
    Moyenne := 0.0;
    for i in 1..Essais loop
	loop
		Get_Random_Number(n_alea); -- Obtenir un nombre aléatoire.
		Moyenne := Moyenne + Float(1);
		if not(Est_Present (Ensemble, n_alea)) then
			ajouter (Ensemble, n_alea);
        	end if;
		exit when Taille (Ensemble) = Max - Min + 1;
    	end loop;
    end loop;
    Moyenne := Moyenne / Float(100);
    Put_Line("le nombre moyen de tirages qu’il faut faire pour obtenir tous les nombres entre Min et Max est : " & Float'Image(Moyenne));

end Nombre_Moyen_Tirages_Tableau;
