#28/10/2020
#Bahnishikha
#calculation of free energy for each 10-mer

open  (FH, "10_mer_seq.fna") or die "error $!";
open (FH1, ">", "10_mer_out.txt") or die "error $!";
chomp(@arr=<FH>);close(FH);
shift(@arr);
my $genome=join("",@arr);
print FH1 "sequence length=". length($genome). "\nsequence is:$genome\n";

for ($i = 0; $i<length($genome);$i+=10)
{
my $dec_mer=substr($genome,$i,10), $c=9,$v=$i+$c;

print FH1 "\nindex no.:\t",$i,"-","$v","\n10-mer sequence is:","\t$dec_mer\n";
my $DNA_energy=0;

 for ($n = 0; $n<length($dec_mer)-1;$n++)
 {
  my $din=substr($dec_mer,$n,2);
   if($din eq "AA"){$DNA_energy+="-1.02";}
   elsif($din eq "AC"){$DNA_energy+="-1.43";}
   elsif($din eq "AG"){$DNA_energy+="-1.16";}
   elsif($din eq "AT"){$DNA_energy+="-0.9";}
   elsif($din eq "CA"){$DNA_energy+="-1.7";}
   elsif($din eq "CC"){$DNA_energy+="-1.77";}
   elsif($din eq "CG"){$DNA_energy+="-2.09";}
   elsif($din eq "CT"){$DNA_energy+="-1.16";}
   elsif($din eq "GA"){$DNA_energy+="-1.46";}
   elsif($din eq "GC"){$DNA_energy+="-2.28";}
   elsif($din eq "GG"){$DNA_energy+="-1.77";}
   elsif($din eq "GT"){$DNA_energy+="-1.43";}
   elsif($din eq "TA"){$DNA_energy+="-0.9";}
   elsif($din eq "TC"){$DNA_energy+="-1.46";}
   elsif($din eq "TG"){$DNA_energy+="-1.7";}
   elsif($din eq "TT"){$DNA_energy+="-1.02";}
   print  FH1 $n,"\t$din\t$DNA_energy\n";
 }



print FH1 "Total energy of the sequence:$DNA_energy\n";
$energy+=$DNA_energy;
}
print FH1 "Sum of all the energy:$energy";
close(FH1);
