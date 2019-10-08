with Text_IO;
use Text_IO;

procedure Date is

    -- Calculate the number of days in a given months
    procedure Calcul_Days_Of_Month (Month: IN Integer) return Integer with
            Pre => Month >= 1 and Month <= 12,
            Post => Calcul_Days_Of_Month'Result >= 28 or Calcul_Days_Of_Month'Result <= 31



begin

end Date;
