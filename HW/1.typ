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
      E_p >= ((m_p + m_pi)^2 - m_p^2) / (4 E_gamma) = 6.79 times 10^10 "GeV"
    $
  - 衰减系数
    $
      lambda = 1 / (sigma rho) = 1.67 times 10^(21) "m"
    $
    在宇宙学中
    $
      1 "Mcp" = 3.1 times 10^(21) "m"
    $
    这个衰减长度大约是宇宙学尺度的 $5.4 "Mcp"$，因此是比较小的。
]

#exercise(subname: [1.9])[
  The Bevatron was designed to have sufficient energy to produce antiprotons. What is the minimum energy of the proton beam for such a process? Take into account that, because of baryonic number conservation (see Section 2.7), the reaction is $p + p -> p + p + overline(p) + p$.
]

#solution[
  实验室系中，初态四动量为
  $
    p_(p 1) & = (E_p, vb(p)_p) \
    p_(p 2) & = (m_p, vb(0)) \
  $
  其中
  $
    E_p = sqrt(abs(vb(p)_p)^2 + m_p^2)
  $
  从而
  $
    s = (p_(p 1) + p_(p 2)) dot (p_(p 1) + p_(p 2)) = (E_p + m_p)^2 - abs(vb(p)_p)^2 = 2m_p^2 + 2 m_p E_p
  $
  而末态四动量为
  $
    p'_(p 1), p'_(p 2), p'_(overline(p)), p'_(p 3)
  $
  有
  $
    s = (p'_(p 1) + p'_(p 2) + p'_(overline(p)) + p'_(p 3)) dot (p'_(p 1) + p'_(p 2) + p'_(overline(p)) + p'_(p 3)) >= (4 m_p)^2
  $
  从而
  $
    E_p >= ((4 m_p)^2 - 2 m_p^2) / (2 m_p) = 7 m_p approx 6.57 "GeV"
  $
]

#exercise(subname: [1.11])[
  Consider a particle of mass $M$ decaying into two bodies of masses $m_1$ and $m_2$. Give the expressions of the energies and of the momenta of the decay products in the CM frame.
]

#solution[
  在质心系中，四动量为
  $
    p_M & = (M, vb(0)) \
    p_1 & = (E_1, vb(p)_1) \
    p_2 & = (E_2, vb(p)_2)
  $
  有
  $
    p_M = p_1 + p_2
  $
  从而
  $
    E_1 + E_2 = M, vb(p)_1 + vb(p)_2 = vb(0)
  $
  且
  $
    E_1^2 - abs(vb(p)_1)^2 = m_1^2, E_2^2 - abs(vb(p)_1)^2 = m_2^2
  $
  联立以上方程，解得
  $
             E_1 & = (M^2 + m_1^2 - m_2^2) / (2 M) \
             E_2 & = (M^2 + m_2^2 - m_1^2) / (2 M) \
    abs(vb(p)_1) & = abs(vb(p)_2) = sqrt(E_1^2 - m_1^2) = sqrt(E_2^2 - m_2^2) \
                 & = sqrt(((M^2 - (m_1 + m_2)^2)(M^2 - (m_1 - m_2)^2)) / (4 M^2))
  $
]

#exercise(subname: [1.12])[
  Evaluate the energies and momenta in the CM frame of the two final particles of the decays $Lambda -> p pi^-$, $Xi^- -> Lambda pi^-$.
]

#solution[
  对于 $Lambda -> p pi^-$，有
  $
    M = m_Lambda = 1.115 "GeV", m_1 = m_p = 0.938 "GeV", m_2 = m_pi = 0.135 "GeV"
  $
  从而
  $
             E_p & = (M^2 + m_1^2 - m_2^2) / (2 M) approx 0.944 "GeV" \
            E_pi & = (M^2 + m_2^2 - m_1^2) / (2 M) approx 0.172 "GeV" \
    abs(vb(p)_p) & = abs(vb(p)_pi) = sqrt(E_p^2 - m_1^2) approx 0.101 "GeV"
  $
  对于 $Xi^- -> Lambda pi^-$，有
  $
    M = m_Xi = 1.321 "GeV", m_1 = m_Lambda = 1.116 "GeV", m_2 = m_pi = 0.135 "GeV"
  $
  从而
  $
             E_Lambda & = (M^2 + m_1^2 - m_2^2) / (2 M) approx 1.124 "GeV" \
                 E_pi & = (M^2 + m_2^2 - m_1^2) / (2 M) approx 0.197 "GeV" \
    abs(vb(p)_Lambda) & = abs(vb(p)_pi) = sqrt(E_Lambda^2 - m_1^2) approx 0.140 "GeV"
  $
]


#exercise(subname: [1.13])[
  Find the expressions of the energies and momenta of the final particles of the decay $M -> m_1 + m_2$ in the CM; the mass of $m_2$ is zero.
]

#solution[
  在上面的解中，令 $m_2 = 0$，则有
  $
             E_1 & = (M^2 + m_1^2) / (2 M) \
             E_2 & = (M^2 - m_1^2) / (2 M) \
    abs(vb(p)_1) & = abs(vb(p)_2) = sqrt(E_1^2 - m_1^2) = sqrt(E_2^2) \
                 & = sqrt((M^2 - m_1^2) / (4 M^2))
  $
]

#exercise(subname: [1.14])[
  In a monochromatic $pi$ beam with momentum $p_pi$, a fraction of the pions decays in flight as $pi -> mu + nu_mu$. We observe that, in some cases, the muons move backwards. Find the maximum value of $p_pi$ for this to happen.
]

#solution[
  在质心系中，考虑$m_nu approx 0$有
  $
               E_mu^* & = (m_pi^2 + m_mu^2) / (2 m_pi) approx 0.110 "GeV" \
    abs(vb(p)_(mu)^*) & = (m_pi^2 - m_mu^2) / (2 m_pi) approx 0.030 "GeV" \
  $
  对于实验室系，$beta$为质心系相对于实验室系的速度，$gamma = 1 / sqrt(1 - beta^2)$，则有
  $
    mat(E_mu; p_(mu,x)) = mat(gamma, gamma beta; gamma beta, gamma) mat(E_mu^*; abs(vb(p)_(mu)^*) cos theta^*)
  $
  从而
  $
    p_(mu,x) = gamma beta E_mu^* + gamma abs(vb(p)_(mu)^*) cos theta^* < 0
  $
  而
  $
    p_(mu,x) >= gamma beta E_mu^* - gamma abs(vb(p)_(mu)^*)
  $
  从而
  $
    gamma beta E_mu^* - gamma abs(vb(p)_(mu)^*) < 0
  $
  即
  $
    beta < abs(vb(p)_(mu)^*) / E_mu^* = (m_pi^2 - m_mu^2) / (m_pi^2 + m_mu^2) approx 0.271
  $
  从而
  $
    p_pi = gamma beta m_pi < 0.271 / sqrt(1 - 0.271^2) m_pi approx 0.040 "GeV"
  $
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

#solution[
  - 在质心系中，四动量为
    $
      p_(Lambda)^* & = (m_(Lambda)^*, vb(0)) \
           p_(p)^* & = (E_(p)^*, vb(p)_p^*) \
          p_(pi)^* & = (E_(pi)^*, vb(p)_pi^*)
    $
    从而
    $
      E_(Lambda)^* = m_(Lambda) = 1.115 "GeV", vb(p)_Lambda^* = vb(0)
    $
    由上面的讨论可知
    $
              E_(p)^* & = (m_(Lambda)^2 + m_p^2 - m_pi^2) / (2 m_(Lambda)) approx 0.944 "GeV" \
             E_(pi)^* & = (m_(Lambda)^2 + m_pi^2 - m_p^2) / (2 m_(Lambda)) approx 0.172 "GeV" \
      abs(vb(p)_pi^*) & = abs(vb(p)_p^*) = sqrt(E_(p)^*^2 - m_p^2) = sqrt(E_(pi)^*^2 - m_pi^2) approx 0.101 "GeV" \
            vb(p)_p^* & = abs(vb(p)_p^*) (cos theta_p^*, sin theta_p^*, 0) \
           vb(p)_pi^* & = -vb(p)_p^*
    $
  - Lorentz变换参数为
    $
      beta = abs(vb(p)_Lambda) / E_(Lambda) = 2 / sqrt(2^2 + 1.115^2) approx 0.873 \
      gamma = 1 / sqrt(1 - beta^2) approx 2.05
    $
  - 实验室系中，四动量为
    $
      p_(Lambda) & = (E_(Lambda), vb(p)_Lambda) \
           p_(p) & = (E_(p), vb(p)_p) \
          p_(pi) & = (E_(pi), vb(p)_pi)
    $
    Lorentz变换为
    $
      mat(E_(pi); p_(pi,x); p_(pi,y)) = mat(gamma, gamma beta, 0; gamma beta, gamma, 0; 0, 0, 1) mat(E_(pi)^*; vb(p)_(pi,x)^*; vb(p)_(pi,y)^*)
    $
    从而
    $
        E_(pi) & = gamma E_(pi)^* + gamma beta vb(p)_(pi,x)^* = 0.197 "GeV" \
      p_(pi,x) & = gamma beta E_(pi)^* + gamma vb(p)_(pi,x)^* = 0.133 "GeV" \
      p_(pi,y) & = vb(p)_(pi,y)^* = -0.048 "GeV" \
    $
    从而
    $
      abs(vb(p)_pi) = sqrt(p_(pi,x)^2 + p_(pi,y)^2) approx 0.139 "GeV" \
    $
    以及
    $
      mat(E_(p); p_(p,x); p_(p,y)) = mat(gamma, gamma beta, 0; gamma beta, gamma, 0; 0, 0, 1) mat(E_(p)^*; vb(p)_(p,x)^*; vb(p)_(p,y)^*)
    $
    从而
    $
      p_(p,x) & = gamma beta E_(p)^* + gamma vb(p)_(p,x)^* = 1.87 "GeV" \
      p_(p,y) & = vb(p)_(p,y)^* = 0.050 "GeV" \
    $
    从而
    $
      abs(vb(p)_p) = sqrt(p_(p,x)^2 + p_(p,y)^2) approx 1.87 "GeV" \
      theta_p = arctan(p_(p,y) / p_(p,x)) approx 1.54 degree
    $
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
