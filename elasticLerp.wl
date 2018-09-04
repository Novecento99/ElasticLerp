framerate=60;

midi = Import["MIDI4.mid"][[1,1;;-1]]

transients = midi[[All, 2, 1]] // DeleteDuplicates

(*latents=RandomVariate[NormalDistribution[],{Length@transients,512}]*)
latents=Import["selectedLatents.dat"][[1;;Length@transients]]//RandomSample

latentsInt=Table[
                 #1(1-i)+#2 i,
                 {i,Most@Rescale@Table[Tan[0.77 Pi(k-1/2)],{k,0,1,1/#3}]}
                ]&@@@(
                      Append[#1,#2]&~MapThread~{Partition[latents,2,1],
                                                framerate*Differences@transients//Round}
                     )//Join@@#&//#~Append~Last@latents &



latentsIntPart20=latentsInt~Partition~20;

(Export["latentsInt.dat",#1];
indx=StringPadLeft[ToString@First@#2,3,"0"];
"python import_examples.py"//Run;
"mkdir slerpImg"<>indx//Run;
"mv *.png slerpImg"<>indx<>"/"//Run)&~MapIndexed~latentsIntPart20
