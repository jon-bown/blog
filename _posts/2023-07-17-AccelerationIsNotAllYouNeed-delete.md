---
layout: post
title: "Acceleration Is Not All You Need: The State of AI Hardware"
description: "My submission to The State of AI Kaggle Competition 2023"
date: 2023-07-17
categories: ml
---


## Table of Contents
1. [Transforming The AI Landscape](#transforming-the-ai-landscape)
2. [The Deep Learning Hardware Revolution: An Overview](#the-deep-learning-hardware-revolution-an-overview)
3. [Measuring AI Hardware Progress](#evaluating-ai-hardware-methodologies-and-metrics)
4. [MLPerf: A Comprehensive Benchmarking Tool](#mlperf-a-comprehensive-benchmarking-tool)
5. [A Journey Through AI Hardware Advancements](#a-journey-through-ai-hardware-advancements)
    - [2021: An Unprecedented Leap](#2021-an-unprecedented-leap)
    - [2022: Going Mainstream](#2022-going-mainstream)
    - [2023: A New Landscape](#2023-a-new-landscape)
6. [Greater Pace: Prospects and Challenges](#greater-pace-prospects-and-challenges)
7. [What the Community Has Learned](#what-the-community-has-learned)
8. [References](#references)
9. [Acknowledgements](#acknowledgements)


# Transforming the AI Landscape
<div style="height: 5px; background-color: #76B900"></div>

Since early 2021, there has been an unprecedented transformation in artificial intelligence (AI) system hardware capabilities, surpassing traditional benchmarks such as Moore's Law, which predicts a two-year doubling rate of transistors on a circuit. Processing capability has historically been limited by the number of transistors; however, recent years have witnessed an accelerated doubling rate of processing power, particularly in hardware designed for AI applications. The current doubling rates are outpacing not only technological growth as predicted by Moore's Law, but also biological evolution, which has taken millions of years. This has occurred despite an overall deceleration in the doubling rate of transistors. Epic Games CEO Tim Sweeney recently noted this phenomenon, "Artificial intelligence is doubling at a rate much faster than Moore’s Law’s 2 years, or evolutionary biology’s 2M years. Why? Because we’re bootstrapping it on the back of both laws. And if it can feed back into its own acceleration, that’s a stacked exponential" (Sweeney, 2023). 

This raises the question: How has such rapid innovation in AI systems been enabled despite a slowdown in traditional hardware performance standards? The rapid acceleration of AI related hardware capabilities has profound implications for the practitioners within the machine learning (ML) community and the long-term outlook for our ability to provide value. This essay will explore the key breakthroughs, driving forces, and alternate performance measures of processing hardware developed during the period of 2021 to mid-2023. The discussion will focus on how processing and acceleration advancements impact various data types, improve the efficiency of AI applications, and make complex AI systems more accessible. While it is impossible to detail every development, this essay strives to provide a comprehensive picture of how working and experimenting with AI hardware within this recent timeframe has changed the ML community.

# The Deep Learning Hardware Revolution: An Overview
<div style="height: 5px; background-color: #76B900"></div>

Coined in 1956 by scientists including John McCarthy and Marvin Minsky, "artificial intelligence" ignited an investment wave that led to an "AI bubble" during the 1970s. However, the computational demands of early AI quickly outpaced CPU capabilities. CPUs are capable of performing a variety of complex tasks, but they do so sequentially. This meant that they were not well-suited to the vector and matrix operations that AI algorithms require. When the "AI Bubble" burst in the early 1980s, AI development regressed into what is now referred to as the "AI winter" (Jotrin Electronics, 2022)

In 1999, Nvidia introduced the Graphics Processing Unit (GPU), a new type of processor that enabled many operations to be performed simultaneously. This speedup in computation capability earned GPUs the name "accelerators." GPUs are much better suited to manage the vector and matrix operations that AI algorithms require.

The true potential of GPUs for AI was first recognized in 2012 when a neural network model known as AlexNet, trained using Nvidia's GPUs, won the ImageNet competition. This achievement sparked widespread acceptance of GPUs for AI (Amodei & Hernandez, 2018). Since then, specialized hardware accelerators meant for large amounts of mathematical computations such as Tensor Processing Units (TPUs), Neural Processing Units (NPUs), and Intelligence Processing Units (IPUs) have become essential tools for AI model training and deployment. Further innovations in the field, including AI-assisted chip design, started gaining popularity around 2018. These led to the development of frameworks like Google's chip design optimization platform (Goldie & Mirhoseini, 2020) and Synopsys' DSO.ai, an AI application for autonomous chip design (Synopsys, 2023).

The ongoing global chip shortage, triggered by the COVID-19 pandemic, has highlighted the need for semiconductor production innovations. The shortage has been exacerbated by sharp increases in consumer electronics demand during the pandemic and the ever-growing demand for GPUs to train more complex AI models. Despite these setbacks, there have been significant AI hardware advancements between 2021 and 2023.


# Measuring AI Hardware Progress
<div style="height: 5px; background-color: #76B900"></div>

Before examining hardware advancements, it is essential to establish common performance measurement terminology. CPU power is typically assessed by transistor count, size of transistors in nanometers (nm), or clock speed in terahertz (THz). Accelerators like GPUs measure computational capacity, often termed "bulk compute," in floating point operations per second (FLOPS) or integer-based operations per second (OPS). These units gauge the calculations a chip can perform in one second, with variants like TeraFLOPS/TeraOPS (trillion FLOPS/OPS), PetaFLOPS/PetaOPS (quadrillion FLOPS/OPS), and ExaFLOPS/ExaOPS (quintillion FLOPS/OPS). Also, total energy used (watts), energy efficiency (FLOPS/OPS per watt) and data transfer capability, measured in megabytes (MB), terabytes (TB), or petabytes (PB) per second, are important accelerator performance indicators.

Using only CPU power or transistor count to compare hardware overlooks recent AI compute progress. For instance, Apple's NPU or "neural engine" has seen over 100% annual improvements in bulk compute, surpassing both CPU and GPU growth. Figure 1a shows the historical processing power of Apple's A-series iPhone System on a Chip (SoC) as well as the isolated CPU, GPU, NPU. The composition of the A14 SoC is shown in Figure 1b. The growth in bulk compute in the SoC, shown by the dotted line, is on an annual improvement pace of 118% since 2015 (Vellante & Floyer, 2021).


<div align="center" style="background-color: #333; padding: 20px;">
      <img src="/assets/images/kaggle-essay-2023/npuExplosion.jpg" width="90%">
</div>
<div align="left" style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 0;">
<b>Figure 1.</b> Apple iPhone A-series compute growth and A14 SoC composition. (a) The left panel shows the growth in operations per second capability of Apple's A-series chips. (b) The right panel illustrates the composition of the Apple iPhone A14 SoC. From "A New Era of Innovation: Moore's Law Is Not Dead and AI Is Ready to Explode", by J. Vellante & D. Floyer, 2021.
</div>