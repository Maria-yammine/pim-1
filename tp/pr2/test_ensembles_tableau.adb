with Ensembles_Tableau;

-- Programme de test du module Ensemble.
procedure Test_Ensembles_Tableau is

    package Ensemble_Caractere is
        new Ensembles_Tableau (Capacite => 8, T_Element => Character);
    use Ensemble_Caractere;

    -- Initialiser un ensemble avec 'A' puis 'B' empilés dans l'ensemble vide.
    procedure Init (Ensemble : out T_Ensemble) is
    begin
        Initialiser (Ensemble);
        Ajouter (Ensemble, 'A');
        Ajouter (Ensemble, 'B');
    end Init;

    procedure Tester_Est_Vide is
        E1, E2 : T_Ensemble;
    begin
        Initialiser (E1);
        pragma Assert (Est_Vide (E1));

        Ajouter (E1, 'A');
        pragma Assert (not Est_Vide (E1));

        Init (E2);
        pragma Assert (not Est_Vide (E2));
    end Tester_Est_Vide;

    procedure Tester_Ajouter is
        E : T_Ensemble;
    begin
        Init (E);
        pragma Assert (not Est_Vide (E));
        Ajouter (E, 'N');
        pragma Assert (Est_Present (E, 'N'));
        pragma Assert (Est_Vide (E));
    end Tester_Ajouter;

    procedure Tester_Supprimer is
        E : T_Ensemble;
    begin
        Init (E);
        Supprimer (E, 'A');
        pragma Assert (Est_Present (E, 'O'));
        Supprimer (E, 'B');
        pragma Assert (Est_Vide (E));
    end Tester_Supprimer;

begin
    Tester_Est_Vide;
    Tester_Ajouter;
    Tester_Supprimer;
end Test_Ensembles_Tableau;
