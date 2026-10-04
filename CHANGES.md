# Revision of the KAW 2026 proposal: what changed

`proposal_revised.tex` compiles to **6 pages** (about 1.4 lines spare on page 6). Layout, preamble
and bibliography are unchanged, and all 25 references are still cited.

## Additions requested by the reviews
- **Page 1 for non-probabilists.** Defines local score, incompatibility and reference-law error.
  Adds "Mathematically, the project develops a perturbation theory for Gibbs samplers with
  incompatible local conditionals." Explains the factor 19 as the radius lost by a coarse row-sum
  estimate. States recruitment "from outside Sweden".
- **Theorem A repositioned.** The two inequalities in (3) are now a *preliminary reduction*. The
  second one is credited to Rebeschini–van Handel. Target Theorem A is now the decay bound (4) on
  the weighted correction RLt. The novelty sentence in §2.1 now matches.
- **Rudolf–Schweizer answered in advance.** The baseline is identified as the [RS18] route with
  contraction from the learned chain, made spatially weighted. The text then explains why that route
  fails without learned contraction, which is why Theorem B is needed.
- **Part 1 environment.** One sentence covers WASP, LUNARC, COMPUTE and the Centre's seminars. A
  bridge sentence links the coarse-graining papers to the recent learned-dynamics work. Friesen now
  co-leads, with the fellow, the coupling, ergodicity and reflection-distance analysis for Theorem B.
- **Part 3 reordered.** It leads with the competence sought and recruitment from outside Sweden. Then
  come the open competition and the committee roles, and the statement that Katsoulakis is not on the
  committee. "Katsoulakis provides continuity" is gone. Gu's line at Lund is presented as distinct,
  with a new group and a new co-mentor.
- **Open access.** One sentence in §3.2 commits to open access and deposit in Lund University's
  repository, with publication costs budgeted as direct costs.

## Small corrections
- The tanh residuals are incompatible whenever some b_ij ≠ 0, with the curl shown.
- ρ_h < 1 is stated for 0 < h < 2m̃/L².
- √h is stated as the Euler rate for the C¹/Lipschitz class, with O(h) under C² assumptions.
- Month 4 now benchmarks the metrics. Month 8 makes the final metric choice.
- The heading "3.3." is now "3.3".
- The uniformity of the score constants and the fourth moments is restored. The test function is
  renamed φ so that it does not clash with the field f.

## Not changed, on purpose
- **Page guard.** `\ifnum\value{page}>7` was left as is. A test confirmed that it passes a 6-page
  file and rejects a 7-page one. Changing it to `>6` would reject a valid 6-page proposal.
- **Reference list.** Nothing was shortened, because on the six-page route the character count
  does not apply.

## Please confirm before submitting
1. **WASP wording.** The text says "WASP ..., where I have a Lighthouse role". Adjust it if the role
   has a specific title.
2. **LUNARC, COMPUTE and seminars.** Check that the certification computations will run on LUNARC,
   and that COMPUTE and the seminar arrangement are right.
3. **Budget.** Check that open-access publication costs really are in the budget as direct costs.
4. **Friesen.** Check that he agrees to co-lead the Theorem B coupling analysis with the fellow.
5. **Committee.** The text now says Villanueva-Perez "assesses fit with the optional imaging study".
   A reviewer flagged that having a physicist on the committee is a weakness. Consider replacing
   him with a mathematician if that is possible.
6. **Preliminary reduction.** It now asserts the Rebeschini–van Handel comparison, instead of the
   earlier "is to control / suggests". Check that you are comfortable stating it as a known result.
