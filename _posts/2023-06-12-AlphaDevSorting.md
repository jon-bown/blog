---
layout: post
title: "🚀 AlphaDev: Revolutionizing Sorting Algorithms! 💡"
description: "AlphaDev major breakthrough in sorting algorithms"
date: 2023-06-12
categories: ml
---

Back in my early days of learning programming, sorting was a huge topic in the Algorithms and Data Structures class. I remember learning about the complexity of different sorting algorithms and clearly seeing the advantage of using more advanced algorithms like QuickSort or MergeSort. Those were the best we could do right?

According to several articles published last week, one of the first improvements in sorting algorithms in over a decade has been accomplished by AlphaDev, a product of Google's DeepMind that originally used reinforcement learning (RL) to master games like Chess and Go.

## A Bit About Alpha Dev

**AlphaDev** now applies the principles of RL and other learning strategies to the realm of programming. In particular, it has been used to generate and optimize sorting algorithms. The AI treats the creation and optimization of algorithms as a game, striving to minimize runtime while avoiding errors.

Essentially, AlphaDev uses a combination of tactics, including decision-tree analysis (borrowed from game-playing AI systems), reinforcement learning, and a focus on minimizing latency (the delay before a transfer of data begins following an instruction for its transfer), to write and optimize its own code.

## Optimization of Sorting Functions

- DeepMind used AlphaDev to focus on enhancing specific sorting functions present in the C++ standard libraries. 

> These functions were designed to manage small, specific scenarios, such as sorting three, four, or five items, as well as other functions that could manage an indefinite number of items up to a limit.

- The functions dealing with a fixed number of items didn't need to use branching (a coding technique where different code gets executed based on the state of a variable). 

> For these types of functions, it was observed that the efficiency generally increased when the number of instructions decreased.

- AlphaDev was successful in boosting the performance of these fixed-number sorting functions by reducing the number of instructions they required. 

> It managed to make the functions sorting 3, 5, and 8 items more efficient by eliminating one instruction, and it made even larger improvements to the functions sorting 6 and 7 items.

- The only function AlphaDev couldn't enhance was the existing human code that sorts four items.

- The improved performance from fewer instructions was confirmed through tests on real-world systems.

> When it came to functions that sorted a variable number of entries and involved branching in the code, the efficiency was evaluated on 100 different machines because their performance can be influenced by different processor hardware capabilities.

- Even with the added complexity of these variable sorting functions, AlphaDev managed to find ways to enhance their performance as well. This demonstrated its ability to optimize not just specific sorting functions, but also more flexible, complex ones.

## A New Approach to Sorting

- **Existing Implementation:**
  - The code performs a series of checks to identify the number of items to sort.
  - The corresponding dedicated sorting function for that particular number of items is then called to sort the items.

- **Revised Code (by AlphaDev):**
  - First, the code checks if there are two items:
    - If yes, it calls a separate function to sort them.
  - If the count is more than two items, the code sorts the first three items.
  - If exactly three items are present, it returns the sorted list directly.
  - When there are four items:
    - The revised code runs a specialized segment that efficiently inserts the fourth item into the correct position in an already sorted set of the first three items.
  
Despite appearing unusual, this approach of dealing with four items showed consistent improvement over the original code. 

Although the articles didn't cite the specific speed improvements, the performance improvement could be up to 70% faster according to the NewScientist article. Incredible! These are algorithms used by all sorts of tasks every single day all over the world. That sort of performance improvement could lead to a drastically different computing landscape in the near future.

# Learn More

[Ars Technica Article](https://arstechnica.com/science/2023/06/googles-deepmind-develops-a-system-that-writes-efficient-algorithms/)

[Nature Article](https://www.nature.com/articles/d41586-023-01883-4)

[NewScientist](https://www.newscientist.com/article/2376512-deepmind-ais-new-way-to-sort-objects-could-speed-up-global-computing/)

[Google DeepMind Article](https://www.deepmind.com/blog/alphadev-discovers-faster-sorting-algorithms)