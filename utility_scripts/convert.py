#!/usr/bin/env python

def title(title: str):
    title = f" {title} "
    print(f"{title:#^80}")
    pass


def yard_to_meter(input: float) -> float:
    meter = input*1143
    return meter/1250


def inch_to_meter(input: float) -> float:
    return yard_to_meter(input/36)


def pound_to_kg(input: float) -> float:
    gram = input*453.59237
    return gram/1000


def ounce_to_kg(input: float) -> float:
    return pound_to_kg(input/16)


title("Vortex AMG")
print("Magnification: 1-10x")
imperial = 8.4
metric = inch_to_meter(imperial)
print(f"Length: {imperial:5.2f} in, {metric:.4f} m")
imperial = 18.8
metric = ounce_to_kg(imperial)
print(f"Weight: {imperial:5.2f} oz, {metric:.4f} kg")

title("Eotech Vudu")
print("Magnification: 1-10x")
imperial = 10.63
metric = inch_to_meter(imperial)
print(f"Length: {imperial:5.2f} in, {metric:.4f} m")
imperial = 21.3
metric = ounce_to_kg(imperial)
print(f"Weight: {imperial:5.2f} oz, {metric:.4f} kg")

title("Eotech Vudu")
print("Magnification: 3-9x")
imperial = 6.8
metric = inch_to_meter(imperial)
print(f"Length: {imperial:5.2f} in, {metric:.4f} m")
imperial = 16.0
metric = ounce_to_kg(imperial)
print(f"Weight: {imperial:5.2f} oz, {metric:.4f} kg")

title("Eotech Vudu")
print("Magnification: 4-12x")
imperial = 7.1
metric = inch_to_meter(imperial)
print(f"Length: {imperial:5.2f} in, {metric:.4f} m")
imperial = 16.9
metric = ounce_to_kg(imperial)
print(f"Weight: {imperial:5.2f} oz, {metric:.4f} kg")
