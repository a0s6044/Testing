# Brief for revising the KAW 2026 proposal (Sopasakis, Lund)

Deadline: Monday 5 Oct 2026, 13:00. The applicant has chosen the **six A4 page** route of the call
("Max 6 A4-pages or 21,000 characters including spaces"). The current source compiles to exactly
6 pages with ~1 line of slack on page 6. **Layout must not change** (12pt, same geometry, same
`\footnotesize` references). Any addition must be paid for by compressing existing text
*without losing information* (facts, numbers, citations, assumptions, caveats). The applicant's
instruction: "implement really needed pieces which will definitely add valuable information for
success ... use what is there but if you change things reduce content without losing information.
Should be super clear."

The source is `/home/user/Testing/proposal_original.tex`. All 25 references exist and support the
sentences that cite them: **keep all 25 `\bibitem`s and all `\cite`s**. Abbreviating journal names
or trimming subtitles inside the bibliography is allowed if room is needed; dropping a reference is not.

## Reviewer verdicts (two review layers, consolidated)

What is fine and must be preserved: all calculations (AR(1) bound, resolvent identity, factor
19 / 2ξ, two-site bound, step-size budget) are correct; the numerics (θ≈0.39, sensitivity≈2.01,
0.393) reproduce; references are correct; the honesty of "what it does not prove", the disclosed
×110 multiplier and the fallback with a stated success criterion were singled out as strengths.

### Must implement (ranked)

1. **Theorem A looks like a known result.** In eq. (3) `eq:transfer`, the first inequality follows
   directly from the displayed line above it (the Lipschitz/Cauchy–Schwarz estimate), and the second
   is the Rebeschini–van Handel comparison theorem [RvH14], cited in the same paragraph; yet §2.1
   says "Two estimates are new" and lists the transfer bound as one of them. Fix: keep (3) as the
   *preliminary reduction* (a lemma / starting step) and state as **Target Theorem A** the genuinely
   new result: the explicit decaying bound on the weighted correction,
   `\sum_{i\in S}[RLt]_i \le K_S M_b (1+r)^p e^{-\kappa r}`, uniform in N and r, under polynomial
   neighbourhood growth and exponential kernel bounds, with the corresponding weighted tail
   statement on general bounded-degree graphs. Reword §2.1 "The proposed novelty" accordingly.
   Also answer in advance the obvious referee question: **why not obtain contraction from the
   learned chain via Rudolf–Schweizer [RS18]?** Answer: the learned local drifts may be incompatible,
   so they need not be the conditionals or score of any common invariant Gibbs law; [RS18] needs
   Wasserstein contractivity of one chain and a one-step kernel discrepancy that is uniform in the
   state or integrated along the perturbed (learned) trajectory, whereas our input is population
   error under the *reference* law, which does not directly control the learned trajectory. That is
   exactly what Theorem B's defect-feedback recursion supplies, at the price of Λd.
   Sharpest form of the answer (verified by the lead): [RS18] integrates the one-step kernel
   discrepancy along the law of the *perturbed* chain and needs contraction of the *unperturbed*
   chain. If the learned chain contracts, take it as the unperturbed chain: the exact chain then
   plays the perturbation, its law is the stationary reference law, and the discrepancy is
   integrated under the reference law — this is precisely our Baseline proposition (so the
   baseline can honestly be described as "the [RS18] route, with contraction from the learned
   chain", plus spatial weighting). Without learned contraction (the nonconvex case of Theorem B)
   [RS18] must use the exact chain's contraction and then requires the discrepancy along the
   learned trajectory, which reference-law error does not control (cf. [CCSW26]); and since the
   drifts may be incompatible there is no common invariant Gibbs law whose scores could be compared
   (cf. [CLT]). Two or three sentences suffice; place them where the baseline or Theorem B is
   introduced, or in §2.1.

2. **Page 1 must be readable by a non-probabilist** (the KVA Mathematics Class is mostly not
   probabilists). Terms "reference-law error" and "incompatible updates" are used before being
   explained; the "19 times larger" sentence cannot be understood on page 1. Add a plain sentence
   along the lines of: "A local score is the gradient of a conditional log-density; separately
   learned local rules may be incompatible, meaning that they need not come from any single joint
   density. Mathematically, the project develops a perturbation theory for Gibbs samplers with
   inconsistent local conditionals." Explain "reference-law error" (error measured under the true
   conditional law, not along the sampler's own trajectory). Either explain the factor 19 as the
   loss in required neighbourhood radius when a coarse row-sum estimate replaces the full resolvent,
   or move that detail to §2.5 (it already appears there).

3. **Part 3 has its priorities backwards.** The call asks Part 3 to describe the competence sought,
   and the programme's purpose is recruiting mathematicians from **outside Sweden**; the words
   "foreign"/"abroad"/"outside Sweden" never appear. Lead §3.1 with the competence sought: a
   researcher recruited from outside Sweden, with expertise in probability, stochastic analysis,
   optimal transport or numerical analysis, and the ability to lead a theorem independently. Then
   Gu's fit and **independence**: she is Katsoulakis's PhD student and current postdoc, and the text
   says Katsoulakis "provides continuity" (delete that framing). State concretely that **Friesen will
   co-lead the coupling, ergodicity and reflection-distance analysis for Theorem B** (currently he
   has no concrete role although Theorem B rests on his expertise). Make clear that Katsoulakis is a
   co-mentor and **is not on the hiring committee**. Villanueva-Perez (a physicist) sits on the
   committee: either explain his application-oriented role and that the mathematical assessment is
   led by the mathematicians, or adjust. Keep: international advertisement, open competition,
   authorship policy, freedom to publish independently, fellow leads Theorem B and chooses extension.

4. **Part 1 does not describe the department.** WASP, LUNARC, COMPUTE and the seminars are never
   mentioned; omitting the applicant's WASP Lighthouse role in a Wallenberg application is a missed
   opportunity. Add ONE compact sentence using only these facts (do not invent details):
   - WASP = Wallenberg AI, Autonomous Systems and Software Program (KAW-funded); the applicant has a
     WASP Lighthouse role (exact nature unknown to you: write "my WASP Lighthouse role" or
     equivalent wording that is true whatever the role; do not say "I lead" or name a topic).
   - LUNARC = Lund University's centre for scientific and technical computing (HPC resources).
   - COMPUTE = Lund University's research school in scientific computing.
   - The Centre's seminar series (mathematical statistics / numerical analysis) will host the
     fellow's working seminar.
   Also add a **bridge sentence** in §1.1 between the 2002–2012 mathematics papers and the recent
   applied-ML work, e.g.: "The project is the next mathematical step in this trajectory: my earlier
   work analysed local stochastic interactions and coarse-graining, while my recent graph and
   learned-dynamics work provides the setting in which their stability theory is now needed."
   (The existing sentence "The coarse-graining work asked this project's question for a fixed
   approximation ... Here the approximation is learned." may be merged with it.)

5. **Small mathematical slips (all must be fixed):**
   - tanh residual example: any nonzero `b_{ij}` already gives incompatibility (cross-derivative
     `b_{ij}\,\mathrm{sech}^2 z_j` cannot equal `b_{ji}\,\mathrm{sech}^2 x_i` for all arguments
     unless both vanish). Replace "when b_ij is nonsymmetric" by "whenever some b_{ij}\neq 0".
   - `\rho_h<1` only holds for `0<h<2\widetilde m/L^2`: state it.
   - The `\sqrt h` Euler error is right for the C¹/Lipschitz class used; say so, and mention the
     O(h) refinement only conditionally under C²-type drift assumptions.
   - The metric decision is dated both "by month 4" and "by month 8": make month 4 the point for
     benchmarking candidate metrics and fixing moment assumptions, and month 8 the final metric
     choice after stress tests.
   - Page guard: LEAVE `\ifnum\value{page}>7` UNCHANGED. It is tested and correct: after the final
     `\clearpage` the counter equals last page + 1, so a 6-page file passes and a 7-page file errors.
     (One reviewer claimed it permits seven pages; that claim is wrong and `>6` would break the build.)

6. **Open access** is a call requirement (funded articles archived in openly searchable databases;
   related costs eligible as direct costs). Add one sentence committing to open-access publication
   via Lund University's repository / the KAW open-access requirement and stating that publication
   costs are included in the budget (place it in §3.2 or §3.3, next to "release reproducible code").

### Do NOT do
- Do not change layout parameters (font size, margins, header/footer, `\footnotesize` bibliography).
- Do not drop any reference, number, assumption, caveat, named person, date or milestone.
- Do not weaken the honesty statements ("what it does not prove", ×110 multiplier, fallback).
- Do not introduce new mathematical claims that are not in the original, except the explanations
  requested above.
- Do not add a model identifier or AI attribution anywhere in the document.
