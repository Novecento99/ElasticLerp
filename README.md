# ElasticLerp

This WL script reads a MIDI file containing a sequence of *k* events (notes) and it creates an *elastic path* between *k* points in an N-Dimensional space (e.g. the latent space of a Generative Adversarial Network).

An interpolation between two latent vectors **v<sub>1</sub>** and **v<sub>2</sub>** can be written as  (*1-f<sub>t</sub>*) **v<sub>1</sub>** + *f<sub>t</sub>* **v<sub>2</sub>**,
where *0 < f<sub>t</sub> < 1* is a parametric curve of the parameter *t* with *0 < t < 1*. In particular, for *f<sub>t</sub> = t* we have the standard definition of a *lerp* (linear interpolation).

An *Elastic Lerp* is a lerp where the parametric curve is a translated and rescaled tangent:

![](https://github.com/Ludwiggle/ElasticLerp/tangentLerp.png)
