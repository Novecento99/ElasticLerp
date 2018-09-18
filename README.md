# ElasticLerp

This WL script reads a MIDI file containing *k* events and it creates an *elastic path* between *k* points in an N-Dimensional space. This high dimensional space could be the latent space of a generative neural network (e.g. GAN).

A standard linear interpolation between two latent vectors has the form

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/lerp.png)

```Mathematica
Tan[ (k-1/2)]~Table~{k,0,1,1/#3}//Rescale
```
