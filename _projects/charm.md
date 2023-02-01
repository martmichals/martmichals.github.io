---
layout: distill
title: CHARM
description: CHeap Accessible Resilient Mesh.
date: 2023-02-01
img: assets/img/charm/charm_complete.png
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
  - name: Melissa Pai
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

There are a variety of situations in which people have limited cellular or internet connectivity. 
For example, a natural disaster may wipe out cell towers, leaving victims without a means of 
contacting rescuers or loved ones. Our system aims to be a lightweight, cheap, and quickly
deployable solution to this problem. Emergency responders can spread CHARM nodes across
a large area, at which point the nodes connect to one another and create a large WiFi network which
may then be used by victims and responders.

<img src="../../assets/img/charm/all_nodes.png" style="width:100%">
<p align = "center">CHARM Nodes. v1.0 top, v1.1 bottom.</p>

## Requirements

Our project fulfilled high level requirements defined in the first weeks of the course.

1. The system shall cover at least $$7500\:m^2$$ with publicly-accessible WiFi, 
using a maximum of 5 CHARM nodes.
1. Each node shall weigh no more than 1.5 kg and not exceed $$8000\:cm^3$$ of volume.
1. The system shall be monitored via a web-interface which is able to enumerate 
the location (±10 m), battery voltage (± 0.1V), and networking telemetry for each node.

## System Overview

Our design was split into 4 subsystems. The Power Management Subsystem is responsible
for charging the 2 Li-ion batteries, and providing 3.3V from the batteries to 
the sensors and microcomputer in the other two on-board subsystems. The Sensor
Subsystem provides GPS and battery voltage data to the on-board microcomputer. The Routing
Subsystem is host to the on-board microcomputer, which was responsible for routing
network traffic, as well as sending the node's sensor data to the System Monitor, a 
a web interface for used for monitoring all the nodes in the network.


<img src="../../assets/img/charm/block.png" style="width:100%">
<p align = "center">Block Diagram</p>

I was responsible for the System Monitor
and Routing Subsystems, and thus will only cover these systems in greater detail.

## System Monitor

The System Monitor is a full-stack web application that displays the location and status of
every node. I wrote the backend in Node.js, including methods to save and retrieve
node data. I wrote the frontend using React.js and the Google Maps API to visualize
the location and status of each node.

<img src="../../assets/img/charm/system_monitor.png" style="width:100%">
<p align = "center">System Monitor Frontend</p>

## Routing Subsystem 

The Routing Subsystem is comprised of the Omega2S+ and a few passive components.
The Omega2S+ runs processes to route traffic in the mesh, as well as send telemetry about
the node state to the System Monitor.

As shown in the Block Diagram, the routing subsystem serves as the center
of our design. It takes in data from the GPS Unit and Battery Voltage Monitor via USB
and $$I^2C$$, respectively, while also receiving and sending network traffic via 2.4 Ghz U.FL
antenna. It is powered by the Power Management Subsystem with 3.3 V (±0.1V).

This subsystem is responsible for providing WiFi (High-Level Requirement 1) and sending telemetry from the sensors (High-Level Requirement 3).

## Greater Detail

If you would like to read more about this project, check out the 
[GitHub repo](https://github.com/CaptnSisko/CHARM) and the 
[UIUC project page](https://courses.engr.illinois.edu/ece445/projects.asp).
These contain the project source and much more detailed documentation,
respectively.
