import numpy as np
from scipy.spatial import distance
from scipy.stats import norm
import mido


def sound_volume(msg):
    return msg.velocity


def time(msg):
    return msg.time


midi_file = input("path to midi file = ")
midi = mido.MidiFile(midi_file)
transients = []
for msg in midi:
    if msg.type == "note_on" and sound_volume(msg) > 0:
        transients.append(time(msg))
transients = list(dict.fromkeys(transients))

framerate_input = input("framerate = ")
framerate = int(framerate_input) if framerate_input.isdigit() else None
min_diff = min(np.diff(transients))
r = framerate if framerate and framerate > 1 / min_diff else int(np.ceil(1 / min_diff))
if not framerate or framerate <= 1 / min_diff:
    print("invalid framerate")
    print(f"framerate set to {r}\n")

latent_space_dimension_input = input("\n\tlatent space dimension = ")
ld = (
    int(latent_space_dimension_input)
    if latent_space_dimension_input.isdigit()
    else None
)
if not ld:
    print("invalid dimension")
    exit()

laTour = np.random.normal(size=(len(transients), ld))
tour_indices = distance.cdist(laTour, laTour).argmin(axis=1)
laTour = laTour[tour_indices[:-1]]

lerped = []
for i, (start, end) in enumerate(zip(laTour, laTour[1:])):
    steps = np.tan(0.77 * np.pi * (np.arange(r) + 0.5) / r)
    steps = np.interp(steps, (steps.min(), steps.max()), (0, 1))
    for step in steps:
        lerped.append(start * (1 - step) + end * step)

print("\n")
np.savetxt("elasticLatents.dat", lerped)
print("elasticLatents.dat")
