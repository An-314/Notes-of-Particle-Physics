#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [粒子物理第4次作业],
  author: "AnZreww",
  time: "2026年11月",
  cb-counter-depth: 1,
  matheq-depth: 1,
  font-size: 13pt,
  par-leading: 0.6em,
  counter-depth: 1,
)
#set math.equation(numbering: none)

// Bettini, Introduction to Elementary Particle Physics, 3rd ed. (2024),
// Chapter 4, Problems, pp. 179–181 (PDF pp. 197–199).
// Exercise 4.13: the restriction "I = 0" is removed as assigned.
#let ex(num, body) = block(breakable: false)[
  #exercise(count: false, subname: [#num], body)
]

#ex("4.1")[
  Consider the following three states: $pi^0$, $pi^+ pi^+ pi^-$ and $rho^+$. Define which of them is a $G$-parity eigenstate and, in this case, give the eigenvalue.
]

#ex("4.5")[
  In a bubble chamber experiment on a $K^-$ beam, a sample of events of the reaction $K^- + p -> Lambda^0 + pi^+ + pi^-$ is selected. A resonance is detected both in the $Lambda^0 pi^+$ and $Lambda^0 pi^-$ mass distributions. In both, the mass of the resonance is $M = 1385 "MeV"$ and its width $Gamma = 50 "MeV"$. It is called $Sigma(1385)$. (a) What are the strangeness, the hypercharge, the isospin and its third component of the resonance $Lambda^0 pi^+$? (b) If the study of the angular distributions establishes that the orbital angular momentum of the $Lambda^0 pi$ systems is $L=1$, what are the possible spin parity values $J^P$?
]

#ex("4.7")[
  State the three reasons forbidding the decay $rho^0 -> pi^0 pi^0$.
]

#ex("4.8")[
  The $rho^0$ has spin 1; the $f^0$ meson has spin 2. Both decay into $pi^+ pi^-$. Is the $pi^0 gamma$ decay forbidden for one of them, for both, or for none?
]

#ex("4.11")[
  A low-energy antiproton beam is introduced into a bubble chamber. Two exposures are made, one with the chamber full of liquid hydrogen (to study the interactions on protons) and one with the chamber full of liquid deuterium (to study the interactions on neutrons). The beam energy is such that the antiprotons come to rest in the chamber. We know that the stopped antiprotons are captured in an ‘antiproton’ atom and, when they reach an S wave, annihilate. The $overline(p) p$ and $overline(p) n$ in S wave are, in spectroscopic notation, the triplet $""^3 S_1$ and the singlet $""^1 S_0$. List the possible values of the total angular momentum and parity $J^P$ and isospin $I$. Establish what are the eigenstates of $C$ and those of $G$ and give the eigenvalues. What are the quantum numbers of the possible initial states of the process $overline(p) n -> pi^- pi^- pi^+$? Consider the following three groups of processes. Compute for each the ratios between the processes:
  $
    (a) & quad overline(p) n -> rho^0 pi^-; quad overline(p) n -> rho^- pi^0 \
    (b) & quad overline(p) p (I=1) -> rho^+ pi^-; \
        & quad overline(p) p (I=1) -> rho^0 pi^0; \
        & quad overline(p) p (I=1) -> rho^- pi^+ \
    (c) & quad overline(p) p (I=0) -> rho^+ pi^-; \
        & quad overline(p) p (I=0) -> rho^0 pi^0; \
        & quad overline(p) p (I=0) -> rho^- pi^+.
  $
]

#ex("4.12")[
  Establish the possible total isospin values of the $2 pi^0$ system.
]

#ex("4.13")[
  Find the Dalitz plot zeros for the $3 pi^0$ states with $J^P=0^-$, $1^-$ and $1^+$.
]

#ex("4.14")[
  Knowing that the spin and parity of the deuteron are $J^P=1^+$, give its possible states in spectroscopic notation.
]

#ex("4.16")[
  A particle has baryon number $cal(B)=1$, charge $Q=+1$, charm $C=1$, strangeness $S=0$, beauty $B=0$, top $T=0$. Define its valence quark content.
]

#ex("4.17")[
  Consider the following quantum number combinations, with, in every case $cal(B)=1$ and $T=0$:
  $
    Q,C,S,B & = -1,0,-3,0; \
    Q,C,S,B & = 2,1,0,0; \
    Q,C,S,B & = 1,1,-1,0; \
    Q,C,S,B & = 0,1,-2,0; \
    Q,C,S,B & = 0,0,0,-1.
  $
  Define the valence quark contents for each one.
]

#ex("4.18")[
  Consider the following quantum number combinations, with, in every case $cal(B)=0$ and $T=0$:
  $
    Q,S,C,B & = 1,0,1,0; \
    Q,S,C,B & = 0,0,-1,0; \
    Q,S,C,B & = 1,0,0,1; \
    Q,S,C,B & = 1,0,1,1.
  $
  Define the valence quark contents of each one.
]

#ex("4.19")[
  Explain why each of the following particles cannot exist according to the quark model: a positive strangeness and negative charm meson; a spin 0 baryon; an antibaryon with charge +2; a positive meson with strangeness −1.
]

#ex("4.23")[
  Consider a $D^0$ meson produced with energy $E=20 "GeV"$. We wish to resolve its production and the decay vertices in at least $90%$ of cases. What spatial resolution will we need? Mention adequate detectors.
]

#ex("4.24")[
  Consider the cross-section of the process $e^+ e^- -> f^+ f^-$ as a function of the centre of mass energy $sqrt(s)$ near a resonance of mass $M_R$ and total width $Gamma$. Assuming that the Breit–Wigner formula correctly describes its line shape, calculate its integral over energy (the ‘peak area’). Assume $Gamma/2 << M_R$.
]

#ex("4.27")[
  Write the scattering amplitudes of the following processes in terms of the total isospin amplitudes:
  $
    (1) & quad K^- p -> pi^- Sigma^+, \
    (2) & quad K^- p -> pi^0 Sigma^0, \
    (3) & quad K^- p -> pi^+ Sigma^-, \
    (4) & quad overline(K)^0 p -> pi^0 Sigma^+, \
    (5) & quad overline(K)^0 p -> pi^+ Sigma^0.
  $
]

#ex("4.28")[
  Which of the following reactions is allowed or forbidden by strong interactions? Specify the reason(s) in each case.
  $
    (a) & quad pi^- + p -> K^- + Sigma^+ \
    (b) & quad pi^- + p -> K^0 + Lambda \
    (c) & quad pi^+ + p -> K^0 + Sigma^+ \
    (d) & quad Lambda -> Sigma^- + pi^+ \
    (e) & quad K^- + p -> K^0 + n \
    (f) & quad Xi^- -> Lambda + pi^- \
    (g) & quad Omega^- -> Xi^- + pi^0.
  $
]
