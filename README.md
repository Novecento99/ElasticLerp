# Elerp

This WL script reads a MIDI file containing a sequence of *K* events (notes) and it creates an *elastic path* between *K* points in an N-Dimensional space (e.g. the latent space of a GAN).
The returned sequence of vectors will be such that the corresponding outputs of the generator will form a movie with a swift dynamic near the MIDI events, and a slowly moving image content in between.

## Usage

`wolframscript -f Elerp.wl`

You will be asked to insert the MIDI filename, the frame-rate of the final video and the latent space dimension.
Given that frame-rate of the final video cannot be smaller than the inverse of the minimum distance in seconds between two MIDI events, a non-valid frame-rate will be automatically replaced with the maximum valid one. 


## Discussion

A linear interpolation between two latent vectors **v<sub>1</sub>** and **v<sub>2</sub>** can be written as

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/lerp.png)


where *0 < f<sub>t</sub> < 1* is a parametric curve of the parameter *0 < t < 1*.
In particular, for *f<sub>t</sub> = t* we have the standard definition of *lerp* (linear interpolation).

An *Elastic Lerp* (Elerp) is a lerp defined by the following non-linear parametric curve:

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/Elerp.png)

that is a shifted and rescaled tangent with a *time-warping parameter a*

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/elasticity.png)

Note that the Lerp is the limit of an Elerp for zero time-warp.

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/limit_a.png)

The effect of the time-warping parameter is to slow down the pace of the interpolation between **v<sub>1</sub>** and **v<sub>2</sub>** and to accelerate it in their proximity.

![](https://github.com/Ludwiggle/ElasticLerp/blob/master/PNGs/lerpvselastic.gif)


#### Time Synchronization

Let's say there are a total of *K* MIDI events starting at *t<sub>k</sub>*; we need *K* latent vectors **v<sub>k</sub>** that one might want to import from a file or generate at random (script default).


We want the vector **v<sub>i</sub>** to be returned at time *t<sub>i</sub>* and **v<sub>2</sub>**
