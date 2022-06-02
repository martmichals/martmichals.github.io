---
layout: distill
title: Discord Client
description: A Discord Client, running on a MAX 10 FPGA.
date: 2022-05-14
img: assets/img/dc_client/concept_render.png
importance: 2
category: software & interdisciplinary

authors:
  - name: Martin Michalski
    url: "https://www.linkedin.com/in/martin-michalski-292150175/"
    affiliations:
      name: University of Illinois at Urbana-Champaign
  - name: Trevor Wong
    url: "https://www.linkedin.com/in/trevorxwong"
    affiliations:
      name: University of Illinois at Urbana-Champaign

# Below is an example of injecting additional post-specific styles.
# If you use this post as a template, delete this _styles block.
_styles: >
  .fake-img {
    background: #bbb;
    border: 1px solid rgba(0, 0, 0, 0.1);
    box-shadow: 0 0px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 12px;
  }
  .fake-img p {
    font-family: monospace;
    color: white;
    text-align: left;
    margin: 12px 0;
    text-align: center;
    font-size: 16px;
  }

---

## Background 

This is our final project for ECE 385, Digital Systems Laboratory. This course covers the basics of digital systems design, starting
with building logical circuits on breadboards, and then progressing to digital design for FPGAs with the use of SystemVerilog in Intel's Quartus Prime.
We decided to implement a Discord Client, allowing a user to chat with people on Discord via our FPGA. This project was featured in the end-of-semester
showcase.

## Renders

We started by designing the UI for our client. This guided our design of the graphics card peripheral we later created.

<img src="../../assets/img/dc_client/concept_render.png" style="width:100%">

This UI concept was generated via Python script. The script also converts the fonts used into *.h* files,
used for rendering in the code running on the NIOS-II processor we flashed to the FPGA. 

Below is an image of the UI rendered on the FPGA. This is not a screenshot, as the FPGA is wired to a monitor, not allowing
for screen capturing. We were able to near-perfectly re-create our concept on the FPGA, with the only difference being
non-perfect color replication due to the 12-bit color space on VGA.

<img src="../../assets/img/dc_client/implemented_render.jpg" style="width:100%">

## System Interface

[TODO]

## Hardware

[TODO]

## Software

[TODO]
