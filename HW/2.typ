#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [粒子物理第2次作业],
  author: "Anzreww",
  time: "2026年10月",
  cb-counter-depth: 1,
  matheq-depth: 1,
  font-size: 13pt,
  par-leading: 0.6em,
  counter-depth: 1,
)
#set math.equation(numbering: none)

// Bettini, Introduction to Elementary Particle Physics, 3rd ed. (2024),
// Chapter 2, Problems, pp. 100–101 (PDF pp. 118–119).
// Keep the original problem numbers and each complete statement together.
#let ex(num, body) = block[
  #exercise(subname: [#num], body)
]

#ex("2.3")[
  A $pi^0$ decays emitting one gamma of energy $E_1 = 150 "MeV"$ in the forward direction. What is the direction of the second gamma? What is its energy $E_2$? What is the speed of the $pi^0$?
]

#solution[
  $
    pi^0 -> gamma + gamma
  $
  $pi^0$运动方向为$+x$，第一个光子沿$+x$方向运动，第二个光子沿$-x$方向运动。两个光子四动量为
  $
    p_1 = (E_1, E_1, 0, 0), quad p_2 = (E_2, -E_2, 0, 0)
  $
  $pi^0$的四动量为
  $
    p_(pi^0) = p_1 + p_2 = (E_1 + E_2, E_1 - E_2, 0, 0)
  $
  从而
  $
    m_(pi^0)^2 = (E_1 + E_2)^2 - (E_1 - E_2)^2 = 4 E_1 E_2
  $
  从而
  $
    E_2 = m_(pi^0)^2 / (4 E_1) = 30.36 "MeV"
  $
  以及$beta_(pi^0)$
  $
    beta_(pi^0) = (E_1 - E_2) / (E_1 + E_2) = 0.66
  $
]

#ex("2.5")[
  A $pi^+$ is produced at an altitude of $30 "km"$ by a cosmic ray collision with energy $E_pi = 5 "GeV"$. What is the distance at which the pion sees the surface of the Earth in its rest reference frame? What is the distance travelled in the Earth reference frame in a lifetime?
]

#solution[
  $
    gamma = E_(pi^+) / m_(pi^+) = 35.82\
    beta = sqrt(1 - 1/gamma^2) = 0.9996
  $
  静止系地面距离为
  $
    h^* = h / gamma = (30 "km") / 35.82 = 0.837 "km"
  $
  在地球参考系中，pion在寿命期间行驶的距离为
  $
    tau_L = gamma tau_(pi) = 9.326 times 10^(-7) "s"
  $
  从而
  $
    l = beta c tau_L = beta gamma c tau_pi = 279.48 "m"
  $
]

#ex("2.7")[
  Consider the following particles and their lifetimes.
  $
    rho^0 & : 5 times 10^(-24) "s", quad K^+ : 1.2 times 10^(-8) "s", \
    eta^0 & : 5 times 10^(-19) "s", quad mu^- : 2 times 10^(-6) "s", \
     pi^0 & : 8 times 10^(-17) "s".
  $
  Guess which interaction leads to the following decays:
  $
    rho^0 & -> pi^+ + pi^-; \
      K^+ & -> pi^0 + pi^+; \
    eta^0 & -> pi^+ + pi^- + pi^0; \
     mu^- & -> e^- + overline(nu)_e + nu_mu; \
     pi^0 & -> gamma + gamma.
  $
]

#solution[
  一般地，宽度与平均寿命满足 $Gamma=hbar/tau$。未受到特殊抑制的强衰变通常很快；弱衰变往往慢得多；电磁衰变常介于两者之间。
  #table(
    columns: (2fr, 1.05fr, 1.5fr),
    inset: 6pt,
    // align: (left, center, left),
    table.header([衰变道], [寿命/s], [主要机制]),
    [$rho^0 -> pi^+ + pi^-$], [$5 times 10^(-24)$], [强相互作用],
    [$K^+ -> pi^0 + pi^+$], [$1.2 times 10^(-8)$], [弱相互作用],
    [$eta^0 -> pi^+ + pi^- + pi^0$], [$5 times 10^(-19)$], [强相互作用],
    [$mu^- -> e^- + overline(nu)_e + nu_mu$], [$2 times 10^(-6)$], [弱相互作用],
    [$pi^0 -> gamma + gamma$], [$8 times 10^(-17)$], [电磁相互作用],
  )
  - $rho^0$ 的寿命为强衰变尺度，到两个 pion 强相互作用允许
  - $K^+$ 的奇异数为 $+1$，两个 pion 的总奇异数为零；该过程改变奇异数，由弱相互作用产生
  - $eta^0$ 的衰变是由强相互作用同位旋破缺效应引起的，但其寿命比 $rho^0$ 更长，这表明它受到某种抑制
  - $mu^-$ 是轻子，末态的电子及两个中微子对应带电流弱衰变
  - $pi^0$ 的双光子衰变由电磁相互作用产生
]

#ex("2.9")[
  Chamberlain and co-workers used scintillators to measure the pion lifetime. Why did they not use Geiger counters?
]

#solution[
  带电 pion 的平均寿命只有约 $26 "ns"$。实验需分辨 pion 停下所产生的脉冲，以及随后 $pi^+ -> mu^+ + nu_mu$ 衰变所产生的第二个脉冲，因而要求足够快的响应与相邻脉冲分辨能力。Geiger 计数器的气体雪崩及放电发展具有较大的时间涨落，时间分辨率约为微秒，明显大于 pion 寿命。放电之后还存在恢复灵敏度所需的死时间，难以在同一个探测器中紧接着记录第二次信号。
]

#ex("2.10")[
  Calculate the ratio between the magnetic moments of the electron and the $mu$ and between the electron and the $tau$.
]

#solution[
  自旋为 $1/2$ 的粒子，其磁矩与自旋成正比
  $
    vb(mu) = g_l (q_l)/(2 m_l) vb(S)
  $
  其中 $g_l$ 是洛伦兹因子，$q_l$ 是电荷，$m_l$ 是质量，$vb(S)$ 是自旋
  $
    abs(mu_e)/abs(mu_mu) = m_mu / m_e = 206.768\
    abs(mu_e)/abs(mu_tau) = m_tau / m_e = 3477.23
  $
  即
  $
    abs(mu_e) : abs(mu_mu) : abs(mu_tau) = 1 : 0.0048 : 0.0003
  $
]

#ex("2.11")[
  We calculated the energy threshold for the reaction $p + p -> p + p + overline(p) + p$ on free protons as targets in Problem 1.9. Repeat the calculation for protons that are bound in a nucleus and have a Fermi momentum of $p_f = 150 "MeV"$. For the incident proton use the approximation $p_p approx E_p$.
]

#solution[
  实验室系中，初态四动量为
  $
    p_(p 1) & = (p_p, vb(p)_p) \
    p_(p 2) & = (E_f, vb(p)_f)
  $
  其中
  $
    E_f = sqrt(abs(vb(p)_f)^2 + m_p^2)
  $
  从而
  $
    s & = (p_(p 1) + p_(p 2)) dot (p_(p 1) + p_(p 2)) = (p_p + E_f)^2 - (vb(p)_p + vb(p)_f)^2 \
      & = 2 m_p^2 + 2(E_p E_f - p_p p_f cos theta) \
      & <= 2 m_p^2 + 2 p_p E_f + 2 p_p p_f
  $
  末态四动量为
  $
    s >= (4 m_p)^2
  $
  从而
  $
    E_f >= (14 m_p^2)/(p_f + E_f) = 5.601 "GeV"\
    T_f = E_f - m_p >= 4.663 "GeV"
  $
]

#ex("2.14")[
  Calculate the energy thresholds ($E_nu$) for the processes
  $
    (1) & quad nu_e + n -> e^- + p, \
    (2) & quad nu_mu + n -> mu^- + p, \
    (3) & quad nu_tau + n -> tau^- + p.
  $
]

#solution[
  初始四动量
  $
    p_(nu_l) = (abs(vb(p)_(nu_l)), vb(p)_(nu_l))\
    p_n = (m_n, vb(0))
  $
  则
  $
    s & = (p_(nu_l) + p_n) dot (p_(nu_l) + p_n) = (abs(vb(p)_(nu_l)) + m_n)^2 - (vb(p)_(nu_l))^2 \
      & = m_n^2 + 2 abs(vb(p)_(nu_l)) m_n
  $
  末态
  $
    s >= (m_l + m_p)^2
  $
  从而
  $
    abs(vb(p)_(nu_l)) >= ((m_l + m_p)^2 - m_n^2)/(2 m_n)
  $
  - $l = e$
    $
      E_(nu_e) >= ((m_e + m_p)^2 - m_n^2)/(2 m_n) = -0.782 "MeV"
    $
    从而
    $
      E_(nu_e, "th") = 0
    $
  - $l = mu$
    $
      E_(nu_mu) >= ((m_mu + m_p)^2 - m_n^2)/(2 m_n) = 110.161 "MeV"
    $
    从而
    $
      E_(nu_mu, "th") = 110.161 "MeV"
    $
  - $l = tau$
    $
      E_(nu_tau) >= ((m_tau + m_p)^2 - m_n^2)/(2 m_n) = 3.453 "GeV"
    $
    从而
    $
      E_(nu_tau, "th") = 3.453 "GeV"
    $
]

#ex("2.17")[
  In the event discovered by Anderson, a positive track emerged from the lead plate with measured momentum $p = 23 "MeV"$. Calculate its kinetic energy assuming it to be: (a) a proton; and (b) a positron.
]

#solution[
  $
    E = sqrt(p^2 + m^2), T = sqrt(p^2 + m^2) - m
  $
  从而
  - 为质子
    $
      T_p = sqrt(p^2 + m_p^2) - m_p = 0.282 "MeV"
    $
  - 为正电子
    $
      T_e = sqrt(p^2 + m_e^2) - m_e = 22.495 "MeV"
    $
]

#ex("2.19")[
  Consider a $pi^+$ beam of momentum $p = 200 "GeV"$ at a proton accelerator facility. We can build a muon beam by letting the pion decay in a vacuum pipe. Calculate the energy range of the muons.
]

#solution[
  $
    pi^+ -> mu^+ + nu_mu
  $
  在$pi^+$静止系，二体衰变
  $
    E^*_mu & = (m_pi^2 + m_mu^2)/(2 m_pi) = 109.778 "MeV" \
    p^*_mu & = (m_pi^2 - m_mu^2)/(2 m_pi) = 29.792 "MeV"
  $
  pion有
  $
    E_pi = sqrt(p^2 + m_pi^2) = 200.0 "GeV"\
    gamma = E_pi/m_pi, beta = p_pi/E_pi
  $
  在pion静止系中，muon的发射角为$theta^*$，Lorentz变换后得到muon的能量
  $
    E_mu = gamma(E^*_mu + beta p^*_mu cos theta^*)
  $
  从而
  $
    E_mu in & [gamma(E^*_mu - beta p^*_mu), gamma(E^*_mu + beta p^*_mu)] \
    = & [(E_pi (m_pi^2 + m_mu^2) - p_pi (m_pi^2 - m_mu^2))/(2 m_pi), (E_pi (m_pi^2 + m_mu^2) + p_pi (m_pi^2 - m_mu^2))/(2 m_pi)]\
    = & [114.6 ,200] "GeV"
  $
]
