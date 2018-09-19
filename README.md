# ElasticLerp

This WL script reads a MIDI file containing a sequence of *k* events (notes) and it creates an *elastic path* between *k* points in an N-Dimensional space (e.g. the latent space of a Generative Adversarial Network).

A linear interpolation between two latent vectors **v<sub>1</sub>** and **v<sub>2</sub>** can be written as

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/lerp.png)


where *0 < f<sub>t</sub> < 1* is a parametric curve of the parameter *0 < t < 1*.
In particular, for *f<sub>t</sub> = t* we have the standard definition of *lerp* (linear interpolation).

An *Elastic Lerp* (Elerp) is a lerp defined by the following non-linear parametric curve:

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/Elerp.png)

that is a shifted and rescaled tangent with a *time-warping parameter a*

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/elasticity.png)

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/lerpvselastic.gif)
