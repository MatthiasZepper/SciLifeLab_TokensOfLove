# Tokens of Love: Potentials and Pitfalls of Using Large Language Models

This repository contains the slides, literature, and figures for the talk "Tokens of Love" about Large Language Models (LLMs). It was delivered on February 14, 2025 (Valentin's Day) by [Matthias Zepper](https://www.linkedin.com/in/matthias-zepper-05b752212/) at [SciLifeLab](https://www.scilifelab.se) in Stockholm. 

The presentation explores the potentials and pitfalls of using LLMs, covering topics such as AI integrations, generative models, prompt engineering, and the future of AI in scientific research.

## Presentation slides

- The [presentation slides rendered to PDF](./scilifelab-llms.pdf) 
- The source file for the presentation is [`scilifelab-llms.tex`](./scilifelab-llms.tex).

To compile the slides, ensure you have LaTeX with Beamer installed, you will need BibLaTeX/Biber for bibliography management. Compile using `lualatex` or `xelatex` followed by `biber` and another LaTeX run.

My custom _SciLifeLab_ theme is included in the repository. It uses the colors of [the official visual guide](https://www.scilifelab.se/community-pages/resources/visual-identity/), but not the font faces. I took the liberty to replace Lato/Lora with [Biolinum by Philipp H. Poll](https://en.wikipedia.org/wiki/Linux_Libertine), which you may [have to install separately](https://ctan.org/pkg/libertine).

## Repository Structure

- **./literature/**: Includes the bibliography file `scilifelabllms.bib` with references cited in the presentation.
- **./figures/**: Contains all the images and figures used in the slides.
- **./training_data_example/**: Some public training data examples that were eventually not used for the presentation.

## Summary of Presentation Content

1. **Valentine's Day 2025**: Posits that mankind is in love with AI.
2. **AI Integrations and Services**: Highlights various AI applications in data analysis, pipeline development, and synthetic DNA generation.
3. **Encounters with AI-Generated Content**: Examines the impact of AI-generated content on scientific language and search engines.
4. **Crystal-ball gazing**: Contrasts extremely negative and positive scenarios of the future, and suggests that knowing more about AI can never harm.
5. **Primer on Language Models**: Provides a detailed explanation of language models, their training, and their applications.
6. **Architectures and Key Innovations**: Discusses the architecture of LLMs, including transformers and token embeddings.
7. **Generative Models**: Explores the process of text generation and the importance of context.
8. **Interacting with LLM Models**: Covers prompt engineering and reasoning models.
9. **Augmenting LLM Models**: Introduces retrieval-augmented generation (RAG) and the Model Context Protocol.
10. **Outlook**: Speculates on the future of AI and its impact on information access.

## License

All original (self/AI-generated) content in these slides and this repository is released under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/). However, certain copyrighted images, including works of art and cartoon characters, are used under Fair Use for nonprofit educational purposes and are not covered by this license.
