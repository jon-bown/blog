---
layout: post
title: "⚡ FlashAttention: Speed Up Your LLM 🏎️ "
date: 2023-06-05
categories: ml
---
A big downside of open-source LLMs right now, relative to GPT-4, is the small size of their **context window**. 

The *context window* is the number of tokens a language model can handle at once. GPT-4 on ChatGPT can handle about 12 pages of single space text and a beta version working with about 50 pages.

By comparison, to get the best performance out of the "next best" open-source LLM you can only work with about a single page of single-space text. The amount of context you can fit in one page vs 12 is much more limited. This is because the relationship between sequence length and computational/memory complexity of the self-attention models is *quadratic*. So if you go beyond a page of text with the next best model, the ability of the model to handle the input/output is drastically slower.

Enter the **FlashAttention** technique:

First lets define an important term: **IO-aware**

- IO in IO-aware stands for Input/Output, referring to the data read from and written to a system.

*IO-aware*, in the context of FlashAttention, refers to the attention algorithms accounting for reads and writes between different levels of GPU memory. It's about designing algorithms with an understanding of the cost of moving data between different tiers of the memory hierarchy in a GPU.

Here is a breakdown of the Abstract from the FlashAttention [paper](https://arxiv.org/pdf/2205.14135.pdf):

1. **Transformers' limitations**: Transformers are slow and memory-intensive on long sequences due to the quadratic time and memory complexity of self-attention.

2. **The problem with existing solutions**: Approximate attention methods have tried to reduce computational complexity at the expense of model quality, often failing to achieve real-time speed improvements.

3. **IO-aware attention algorithms**: The authors argue for making attention algorithms IO-aware, considering the reads and writes between GPU memory levels.

4. **Introducing FlashAttention**: FlashAttention is an IO-aware exact attention algorithm that utilizes tiling to minimize memory reads/writes between high bandwidth memory (HBM) and on-chip SRAM in GPUs.

5. **IO complexity of FlashAttention**: FlashAttention necessitates fewer HBM accesses than standard attention and is optimal for a range of SRAM sizes.

6. **Extension to block-sparse attention**: FlashAttention can be extended to block-sparse attention, resulting in an approximate attention algorithm that surpasses the speed of existing methods.

7. **Training speed improvements**: FlashAttention speeds up Transformer training: 15% end-to-end wall-clock speedup on BERT-large (seq. length 512), 3x speedup on GPT-2 (seq. length 1K), and 2.4x speedup on long-range arena (seq. length 1K-4K).

8. **Higher quality models**: FlashAttention enables longer context in Transformers, yielding improved models (0.7 better perplexity on GPT-2 and 6.4 points of lift on long-document classification).

9. **New capabilities**: FlashAttention allows for the first Transformers to perform better than chance on the Path-X challenge (seq. length 16K, 61.4% accuracy) and Path-256 (seq. length 64K, 63.1% accuracy).

FlashAttention is open source and availble immediately to integrate into your LLM project.

![](https://www.googleapis.com/download/storage/v1/b/kaggle-forum-message-attachments/o/inbox%2F1506047%2F81cedabd9785d022b626406d1ea1db2b%2Fflashattn_banner.jpg?generation=1685850412782178&alt=media)

# Important Links

[FlashAttention Repo](https://github.com/HazyResearch/flash-attention)

[FlashAttention Paper](https://arxiv.org/pdf/2205.14135.pdf)




