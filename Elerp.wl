
"||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

vol=<|#[[4]]|>@SoundVolume&
time=#[[2]]&

transients=First@Import@InputString["\n	MIDI file: "]~
           Select~(vol@#>0&) //
           First/@time/@#& //
           DeleteDuplicates
           
"||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

r=If[#1>#2 && IntegerQ@#1, #1, 
     Echo@"invalid framerate";
     Echo["framerate set to "<>ToString@#2]<>"\n";
     #2
    ]&@@{Input@"\n	framerate = ",
         1/Min@Differences@transients//Ceiling}

Pause@.05
           
ld=Input@"\n	latent space dimension = "//
   If[IntegerQ@#,#,
      Echo@"invalid dimension"; Exit[]
     ]&

"||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
 
laTour=NormalDistribution[]~
       RandomVariate~{Length@transients,ld}//
       Partition[#,2,1]&


lerped=Table[#1(1-i)+#2 i,
               {i,Most@Rescale@Table[Tan[.77 Pi(k-1/2)],
                                      {k,0,1,1/#3}]}
              ]&@@@Append@@@Transpose@
                {laTour,
                 r Differences@transients//Round} //
         Join@@#&

"||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

Print@"\n"
"elasticLatents.dat"~Export~lerped//Echo
