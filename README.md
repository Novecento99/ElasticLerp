# ElasticLerp

This WL script reads a MIDI file containing a sequence of *k* events (notes) and it creates an *elastic path* between *k* points in an N-Dimensional space (e.g. the latent space of a Generative Adversarial Network).

An interpolation between two latent vectors can be written as

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/lerp.png)

where *0 < f<sub>t</sub> < 1* is a parametric curve of the parameter *t* with *0 < t < 1*. In particular, a lerp is *f<sub>t</sub> = t*

```Mathematica
Tan[ (k-1/2)]~Table~{k,0,1,1/#3}//Rescale
```
