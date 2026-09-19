#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [粒子物理第1次作业],
  author: "Anzreww",
  time: "2026年9月",
  cb-counter-depth: 1,
  matheq-depth: 1,
  font-size: 13pt,
  par-leading: 0.6em,
  counter-depth: 1,
)

// Bettini, Introduction to Elementary Particle Physics, 3rd ed. (2024),
// Chapter 1, Problems, pp. 65–68 (PDF pp. 83–86).

#exercise(subname: [1.2])[
  Three protons have momenta equal in absolute value of $3 "GeV"$ and directions at $120^degree$ from one another. What is the mass of the system?
]

#solution[
  动量
  $
    abs(vb(p)) = 3 "GeV"
  $
  从而
  $
    p_1 & = (E, abs(vb(p)), 0, 0) \
    p_2 & = (E, -1/2 abs(vb(p)), sqrt(3)/2 abs(vb(p)), 0) \
    p_3 & = (E, -1/2 abs(vb(p)), -sqrt(3)/2 abs(vb(p)), 0)
  $
  则有质能关系
  $
    p_i dot p_i = E^2 - abs(vb(p))^2 = m_p^2
  $
  且
  $
    p = p_1 + p_2 + p_3 = (3 E, 0, 0, 0)
  $
  在质心系中，系统的质量为
  $
    M^2 = p dot p = 9E^2 = 9 (abs(vb(p))^2 + m_p^2) = 9 ((3 "GeV")^2 + (0.938 "GeV")^2) approx 88.9 "GeV"^2
  $
  从而
  $
    M approx 9.43 "GeV"
  $
]

#exercise(subname: [1.7])[
  Consider the process $gamma + p -> p + pi^0$ ($pi^0$ photoproduction) with the proton at rest.

  #enum(numbering: "(a)")[
    Find the minimum energy of the photon $E_gamma$.
  ]
  The Universe is filled by ‘background electromagnetic radiation’ at the temperature of $T = 3 "K"$, and photons with energy $E_(gamma, 3 "K") approx 1 "meV"$.
  #enum(numbering: "(a)", start: 2)[
    Find the minimum energy $E_p$ of the cosmic-ray protons needed to induce $pi^0$ photoproduction.
  ][
    If the cross-section, just above threshold, is $sigma = 0.6 "mb"$ and the background photon density is $rho approx 10^8 "m"^(-3)$, find the attenuation length. Is it small or large on the cosmological scale?
  ]
]

#solution[
  1. 实验室系中，四动量为
    $
      p_(gamma"i") & = (E_gamma, vb(p)_gamma) \
          p_(p"i") & = (m_p, vb(0)) \
          p_(p"f") & = (E_p, vb(p)_p) \
       p_(pi^0"f") & = (E_pi, vb(p)_pi)
    $
    其中
    $
      E_gamma = abs(vb(p)_gamma), E_p = sqrt(abs(vb(p)_p)^2 + m_p^2), E_pi = sqrt(abs(vb(p)_pi)^2 + m_pi^2)
    $
    有
    $
      p_(gamma"i") + p_(p"i") = p_(p"f") + p_(pi^0"f")
    $
    从而
    $
      s & = (p_(gamma"i") + p_(p"i")) dot (p_(gamma"i") + p_(p"i")) = (E_gamma + m_p)^2 - abs(vb(p)_gamma)^2 \
        & = m_p^2 + 2 m_p E_gamma
    $
    也有
    $
      s & = (p_(p"f") + p_(pi^0"f")) dot (p_(p"f") + p_(pi^0"f")) = (E_p + E_pi)^2 - abs(vb(p)_p + vb(p)_pi)^2 \
        & = m_p^2 + m_pi^2 + 2sqrt(abs(vb(p)_p)^2 + m_p^2) sqrt(abs(vb(p)_pi)^2 + m_pi^2) - 2 vb(p)_p dot vb(p)_pi \
        & >= (m_p + m_pi)^2
    $
    其中
    $
      m_p = 0.938 "GeV", m_pi = 0.135 "GeV"
    $
    从而
    $
      E_gamma >= ((m_p + m_pi)^2 - m_p^2) / (2 m_p) = 0.15 "GeV"
    $
  - 实验室系中，四动量为
    $
      p_(gamma"i") & = (E_gamma, vb(p)_gamma) \
          p_(p"i") & = (E_p, vb(p)_p) \
          p_(p"f") & = (E'_p, vb(p)'_p) \
       p_(pi^0"f") & = (E_pi, vb(p)_pi)
    $
    同上
    $
      s & = (p_(gamma"i") + p_(p"i")) dot (p_(gamma"i") + p_(p"i")) = (E_gamma + E_p)^2 - abs(vb(p)_gamma + vb(p)_p)^2 \
        & = m_p^2 + 2 E_gamma E_p - 2 vb(p)_gamma dot vb(p)_p \
        & <= m_p^2 + 2 E_gamma E_p + 2 E_gamma abs(vb(p)_p) \
        & approx m_p^2 + 4 E_gamma E_p
    $
    且
    $
      s & = (p_(p"f") + p_(pi^0"f")) dot (p_(p"f") + p_(pi^0"f")) = (E'_p + E_pi)^2 - abs(vb(p)'_p + vb(p)_pi)^2 \
        & >= (m_p + m_pi)^2
    $
    从而
    $
      E_p >= ((m_p + m_pi)^2 - m_p^2) / (4 E_gamma) = 7 times 10^10 "GeV"
    $
  - 衰减系数
    $
      lambda = 1 / (sigma rho) = 5.6 times 10^(22) "m"
    $
    在宇宙学中
    $
      1 "Mcp" = 3.1 times 10^(21) "m"
    $
    这个衰减长度大约是宇宙学尺度的 $18 "Mcp"$，因此是比较小的。
]

#exercise(subname: [1.9])[
  The Bevatron was designed to have sufficient energy to produce antiprotons. What is the minimum energy of the proton beam for such a process? Take into account that, because of baryonic number conservation (see Section 2.7), the reaction is $p + p -> p + p + overline(p) + p$.
]

#exercise(subname: [1.11])[
  Consider a particle of mass $M$ decaying into two bodies of masses $m_1$ and $m_2$. Give the expressions of the energies and of the momenta of the decay products in the CM frame.
]

#exercise(subname: [1.12])[
  Evaluate the energies and momenta in the CM frame of the two final particles of the decays $Lambda -> p pi^-$, $Xi^- -> Lambda pi^-$.
]

#exercise(subname: [1.13])[
  Find the expressions of the energies and momenta of the final particles of the decay $M -> m_1 + m_2$ in the CM; the mass of $m_2$ is zero.
]

#exercise(subname: [1.14])[
  In a monochromatic $pi$ beam with momentum $p_pi$, a fraction of the pions decays in flight as $pi -> mu + nu_mu$. We observe that, in some cases, the muons move backwards. Find the maximum value of $p_pi$ for this to happen.
]

#exercise(subname: [1.15])[
  A $Lambda$ hyperon decays as $Lambda -> p + pi^-$; its momentum in the L frame is $p_Lambda = 2 "GeV"$. Take the direction of the $Lambda$ in the L frame as the $x$-axis. In the CM frame, the angle of the proton direction with $x$ is $theta_p^* = 30 degree$. Find

  // The original explicitly gives Lambda (not p) in part (a).
  #enum(numbering: "(a)")[
    the energy and momentum of the $Lambda$ and the $pi$ in the CM frame;
  ][
    the Lorentz parameters for the L–CM transformation;
  ][
    the energy and momentum of the $pi$, and the angle and momentum of the $p$ in the L frame.
  ]
]

#exercise(subname: [1.18])[
  A ‘charmed’ meson $D^0$ decays $D^0 -> K^- pi^+$ at a distance from the production point $d = 3 "mm"$ long. Measuring the total energy of the decay products, one finds $E = 30 "GeV"$. How long did the $D$ live in proper time? How large is the $pi^+$ momentum in the $D$ rest-frame?
]

#exercise(subname: [1.19])[
  The primary beam of a synchrotron is extracted and used to produce a secondary monochromatic $pi^-$ beam. One observes that, at a distance $l = 20 "m"$ from the production target, $10%$ of the pions have decayed. Find the momentum and energy of the pions.
]

#exercise(subname: [1.20])[
  A $pi^-$ beam is brought to rest in a liquid hydrogen target. Here $pi^0$ are produced by the ‘charge exchange’ reaction $pi^- + p -> pi^0 + n$. Find the energy of the $pi^0$, the kinetic energy of the $n$, the velocity of the $pi^0$ and the distance travelled by the $pi^0$ in a lifetime.
]

#exercise(subname: [1.27])[
  A particle of mass $m$, charge $q = 1.6 times 10^(-19) "C"$ and momentum $p$ moves in a circular orbit at a constant speed (in absolute value) in the magnetic field $B$ normal to the orbit. Find the relationship between $m$, $p$ and $B$.
]

#exercise(subname: [1.28])[
  We wish to measure the total $pi^+ p$ cross-section at $20 "GeV"$ incident momentum. We build a liquid hydrogen target ($rho = 60 "kg" "m"^(-3)$) that is $l = 1 "m"$ long. We measure the flux before and after the target with two scintillation counters. Measurements are made with the target empty and with the target full. By normalizing the fluxes after the target to the same incident flux, we obtain in the two cases $N_0 = 7.5 times 10^5$ and $N_H = 6.9 times 10^5$ respectively. Find the cross-section and its statistical error (ignoring the uncertainty of the normalization).
]

#exercise(subname: [1.30])[
  Consider two particles with masses $m_1$ and $m_2$ and the same momentum $p$. Evaluate the difference $Delta t$ between the times taken to cross the distance $L$. Let us define the base with two scintillator counters and measure $Delta t$ with $300 "ps"$ resolution. How much must $L$ be if we want to distinguish $pi$ from $K$ at two standard deviations, if their momentum is $4 "GeV"$?
]

#exercise(subname: [1.33])[
  Considering the Cherenkov effect in water ($n = 1.33$), determine: (1) the minimum velocity of a charged particle for emitting radiation, (2) the minimum kinetic energy for a proton and a pion to do so and (3) the Cherenkov angle for a pion with energy $E_pi = 400 "MeV"$.
]
