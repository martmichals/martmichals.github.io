---
layout: distill
title: REconnaissance Aircraft
description: A R(emote) E(xpendable) -connaissance Aircraft.
date: 2021-11-25
img: assets/img/reconnaissance_aircraft/cover.png
importance: 2
category: software

authors:
  - name: Martin Michalski
    url: "https://www.linkedin.com/in/martin-michalski-292150175/"
    affiliations:
      name: William Fremd H.S.

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

In my senior year of high school, I was a mentee in Northrop Grumman's HIP program. In this second and final year of the program, I submitted a
project proposal for an low-cost reconnaissance aircraft, able to snap pictures and fly autonomously (stretch goal). In the end, I built the aircraft,
created a system of sensors and controllers, and developed a GUI to display streamed sensor data.

## Aircraft Build

The overall design of the aircraft was sourced from [Flite Test](https://www.flitetest.com/articles/kraken-build). I changed the
power system used, opting to use one powerful motor, as opposed to 2 less powerful motors.

The aircraft plans were first printed, taped together, and then traced onto foam boards.

<img src="../../assets/img/reconnaissance_aircraft/printed_taped_plans.jpg" style="width:100%;"/>

The parts were then cut out of the foamboard.

<img src="../../assets/img/reconnaissance_aircraft/cut_pieces_floor.jpg" style="width:100%;"/>

The parts were then assembled to create the finished airframe.

<img src="../../assets/img/reconnaissance_aircraft/unpainted_plane.jpg" style="width:100%;"/>

Here is a closer look at the power "pod" that I created to house the brushless motor,
battery, RC reciever, and ESC (Electronic Speed Control). Once everything was assembled, the plane was test flown for the first time!

<img src="../../assets/img/reconnaissance_aircraft/power_system_close.jpg" style="width:100%;"/>

After a successful maiden flight, the aircraft got a paint job!

<img src="../../assets/img/reconnaissance_aircraft/paint_job_1.jpg" style="width:100%;"/>

<img src="../../assets/img/reconnaissance_aircraft/paint_job_2.jpg" style="width:100%;"/>

<img src="../../assets/img/reconnaissance_aircraft/paint_job_3.jpg" style="width:100%;"/>

## Onboard Electronics

The sensors onboard the aircraft were meant to serve three purposes:
 * Monitor the aircraft orientation and position (telemetry)
   * GPS Sensor
   * Gyroscope
 * Stream aircraft telemetry data to ground
   * Xbee transmitter
 * Photograph the ground
   * Raspberry Pi Camera

<img src="../../assets/img/reconnaissance_aircraft/onboard_electronics_schematic.png" style="width:100%;"/>

The sensors, along with a Raspberry Pi and Arduino MEGA were mounted to an acrylic board, which was then mounted to the 
airframe.

<img src="../../assets/img/reconnaissance_aircraft/onboard_electronics.png" style="width:100%;"/>

<img src="../../assets/img/reconnaissance_aircraft/electronics_on_plane.png" style="width:100%;"/>

## GUI

In order to ease the interpretation of telemetry streamed from the aircraft, I developed a GUI which ran on a groundstation (laptop with an Xbee reciever).
The gauges are meant to roughly mimic real aircraft gauges and indicate:
 * Attitude
 * Groundspeed
 * Heading
 * Position (via map)

<img src="../../assets/img/reconnaissance_aircraft/gui.png" style="width:100%;"/>

## System Demonstration

Here is a video of the full system at work. Pictured are the aircraft flying, along with the streamed data in the GUI. The attitude indicator is shakey
due the gyroscope's position on the acrylic board (far from stable mounting points, in an area with high vibration).

<iframe height="350" width="100%" src="https://www.youtube.com/embed/ujrxqKpUfvo"/>

