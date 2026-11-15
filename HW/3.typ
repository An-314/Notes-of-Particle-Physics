#import "@preview/scripst:1.1.2": *

#show: scripst.with(
  title: [粒子物理第3次作业],
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
// Chapter 3, Problems, pp. 125–129 (PDF pp. 143–147).
// Original numbering, symbols and wording retained; line breaks are adapted.
#let ex(num, body) = block(breakable: true)[
  #exercise(subname: [#num], body)
]

#ex("3.1")[
  For each interaction type, strong (S), electromagnetic (EM) and weak (W), insert a Y or N in the cell of every quantum number, depending on whether or not it is conserved ($I$ = isospin, $I_z$ its third component, $S$ strangeness, $cal(B)$ baryon number, $cal(L)$ lepton number, $cal(T)$ time reversal, $C$ particle–antiparticle conjugation, $cal(P)$ parity, $J$ angular momentum, $J_z$ its third component).

  #table(
    columns: (1.2fr,) + (1fr,) * 10,
    align: center,
    inset: (x: 3pt, y: 7pt),
    table.header([], [$I$], [$I_z$], [$S$], [$cal(B)$], [$cal(L)$], [$cal(T)$], [$C$], [$cal(P)$], [$J$], [$J_3$]),
    [S], [], [], [], [], [], [], [], [], [], [],
    [EM], [], [], [], [], [], [], [], [], [], [],
    [W], [], [], [], [], [], [], [], [], [], [],
  )
]

#solution[
  用 ✅ 表示该相互作用具有相应守恒律，用 ❎ 表示一般不守恒。

  #table(
    columns: 11,
    inset: 5pt,
    align: center,
    table.header([相互作用], [$I$], [$I_z$], [$S$], [$B$], [$L$], [$T$], [$C$], [$P$], [$J$], [$J_3$]),
    [S], [✅], [✅], [✅], [✅], [✅], [✅], [✅], [✅], [✅], [✅],
    [EM], [❎], [✅], [✅], [✅], [✅], [✅], [✅], [✅], [✅], [✅],
    [W], [❎], [❎], [❎], [✅], [✅], [❎], [❎], [❎], [✅], [✅],
  )

  - 强相互作用在 $u,d$ 质量相等并忽略电磁效应时具有同位旋对称性，故同时守恒 $I$ 与 $I_z$。它也守恒各夸克味数，包括奇异数。
  - 电磁相互作用区分 $u,d$ 的电荷，因而不守恒总同位旋 $I$；但它不改变夸克味，故仍守恒 $I_z$ 与 $S$。
  - 带电流弱相互作用可以改变夸克味，所以 $I,I_z,S$ 一般不守恒。它破坏 $C$ 和 $P$，并存在 $T$ 破坏。
  - 三种相互作用均具有空间旋转不变性，因此孤立体系的总角动量 $J$ 及其任意固定轴上的分量 $J_3$ 都守恒。
]


#ex("3.4")[
  For each of the following reactions, (a) establish whether it is allowed or not, (b) if it is not, give the reason(s) why (there may be more than one) and (c) give the types of interaction that allow it.
  $
     (1) & quad pi^- p -> pi^0 + n \
     (2) & quad pi^+ -> mu^+ + nu_mu \
     (3) & quad pi^+ -> mu^+ overline(nu)_mu \
     (4) & quad pi^0 -> 2 gamma \
     (5) & quad pi^0 -> 3 gamma \
     (6) & quad e^+ + e^- -> gamma \
     (7) & quad p + overline(p) -> Lambda + Lambda \
     (8) & quad p + p -> Sigma^+ + pi^+ \
     (9) & quad n -> p + e^- \
    (10) & quad n -> p + pi^-
  $
]

#solution[
  #block[
    #set text(size: 10.5pt)
    #table(
      columns: (0.45fr, 2.7fr, 1.05fr, 4.4fr),
      inset: 5pt,
      table.header([项], [过程], [结论], [依据]),
      [(1)], [$pi^- + p -> pi^0+n$], [允许，S 主导], [强相互作用的电荷交换；$Q,B,S,L$ 守恒。],

      [(2)], [$pi^+ -> mu^+ + nu_mu$], [允许，W], [$L_mu=-1+1=0$；为带电流弱衰变。],
      [(3)],
      [$pi^+ -> mu^+ + overline(nu)_mu$],
      [禁戒],
      [$L_mu:0 -> -2$，违反总轻子数。将反中微子改为 $nu_mu$ 才是通常允许的衰变。],

      [(4)], [$pi^0 -> 2gamma$], [允许，EM], [$C(pi^0)=+1$，两光子 $C=(-1)^2=+1$。],
      [(5)], [$pi^0 -> 3gamma$], [S、EM 禁戒], [三光子 $C=-1$，与初态 $C=+1$ 不同。],
      [(6)],
      [$e^+ + e^- -> gamma$],
      [真空中禁戒],
      [初态总四动量为类时，单个真实光子的四动量平方为零，无法同时守恒能量与动量。],

      [(7)], [$p+overline(p) -> Lambda+Lambda$], [禁戒], [$B:0 -> 2$，$S:0 -> -2$。],

      [(8)],
      [$p+p -> Sigma^+ + pi^+$],
      [禁戒],
      [$B:2 -> 1$，$S:0 -> -1$；且初态总 $J$ 为整数、末态为半整数，不能守恒角动量。],

      [(9)], [$n -> p+e^-$], [禁戒], [$L_e:0 -> 1$；一个初态费米子变为两个末态费米子，$J$ 的整数/半整数性质不匹配。],
      [(10)], [$n -> p+pi^-$], [禁戒], [$m_n < m_p+m_(pi^-)$，自由中子没有足够静能；不能同时满足能量与动量守恒。],
    )
  ]

]

#ex("3.5")[
  For each of the following reactions, establish whether or not it is allowed; if it is not, give the reasons:
  $
     (1) & quad mu^+ -> e^+ + gamma \
     (2) & quad e^- -> nu_e + gamma \
     (3) & quad p + p -> Sigma^+ K^+ \
     (4) & quad p + p -> p + Sigma^+ + K^- \
     (5) & quad p -> e^+ + nu_e \
     (6) & quad p + p -> Lambda + Sigma^+ \
     (7) & quad p + n -> Lambda + Sigma^+ \
     (8) & quad p + n -> Xi^0 + p \
     (9) & quad p -> n + e^+ + nu_e \
    (10) & quad n -> p + e^- + nu_e .
  $
]

#solution[
  #block[
    #set text(size: 10.5pt)
    #table(
      columns: (0.45fr, 2.8fr, 1.15fr, 4.2fr),
      inset: 5pt,
      table.header([项], [过程], [结论], [主要依据]),
      [(1)], [$mu^+ -> e^+ + gamma$], [禁戒], [违反 $L_mu,L_e$，但总 $L$ 守恒。],
      [(2)], [$e^- -> nu_e + gamma$], [禁戒], [$Q:-1 -> 0$，违反电荷守恒。],
      [(3)], [$p+p -> Sigma^+ + K^+$], [禁戒], [$B:2 -> 1$，且整数 $J$ 变为半整数 $J$。],

      [(4)], [$p+p -> p+Sigma^+ + K^-$], [禁戒], [$Q:2 -> 1$；此外 $S:0 -> -2$ 也排除 S/EM。],
      [(5)], [$p -> e^+ + nu_e$], [禁戒], [$B:1 -> 0$；一个费米子衰变成两个费米子，违反角动量守恒。],

      [(6)], [$p+p -> Lambda+Sigma^+$], [禁戒], [$Q:2 -> 1$，此外 $S:0 -> -2$。],
      [(7)], [$p+n -> Lambda+Sigma^+$], [S/EM 禁戒], [$Q,B,L,J$ 可守恒，而 $Delta S=-2$。],

      [(8)], [$p+n -> Xi^0+p$], [S/EM 禁戒], [$Q,B,L,J$ 可守恒，$Delta S=-2$。],
      [(9)], [$p -> n+e^+ + nu_e$], [禁戒], [$m_p < m_n+m_e$，能量不足。],

      [(10)], [$n -> p+e^- + nu_e$], [禁戒], [ $L_e:0 -> 2$。通常的中子 $beta^-$ 衰变末态应为 $p+e^-+overline(nu)_e$。],
    )
  ]
]

#ex("3.6")[
  Give the reasons forbidding each of the following decays:
  $
    (a) & quad n -> p + e^- \
    (b) & quad n -> pi^+ + e^- \
    (c) & quad n -> p + pi^- \
    (d) & quad n -> p + gamma
  $
]

#solution[

  *（a）$n -> p+e^-$*
  - 轻子数 $L: 0 -> 1$
  - 角动量也不匹配：初态中子总 $J=1/2$；两个末态自旋 $1/2$ 粒子的总自旋只能为0或1，再加整数轨道角动量，末态总 $J$ 必为整数
  - 正确的普通 $beta^-$ 衰变还需一个 $overline(nu)_e$

  *（b）$n -> pi^+ + e^-$*
  - 重子数 $B:1 -> 0$
  - 轻子数 $L_e:0 -> 1$

  *（c）$n -> p+pi^-$*
  - $
      m_p+m_(pi^-)-m_n approx 138.28 "MeV">0.
    $
    自由中子的静能不足，故在任何参考系中都不可能发生该衰变。

  *（d）$n -> p+gamma$*
  - 电荷数 $Q: 0 -> 1$
]


#ex("3.7")[
  Which of the following processes is allowed and which is forbidden by strangeness conservation?
  $
    (a) & quad pi^- + p -> K^- + p \
    (b) & quad pi^- + p -> K^+ + Sigma^- \
    (c) & quad K^- + p -> K^+ + Xi^0 + pi^- \
    (d) & quad K^+ + p -> K^- + Xi^0 + pi^-
  $
]

#solution[

  注意到
  $
    S(pi)=S(p)=0, quad S(K^+)=+1, quad S(K^-)=-1, quad S(Sigma^-)=-1, quad S(Xi^0)=-2
  $
  强、电磁相互作用守恒 $S$，由此逐项相加：

  #table(
    columns: (0.5fr, 3.8fr, 0.7fr, 1.6fr, 1.7fr),
    inset: 6pt,
    table.header([项], [反应], [$S_i$], [$S_f$], [奇异数判据]),
    [(a)], [$pi^-+p -> K^-+p$], [0], [$-1$], [不允许],
    [(b)], [$pi^-+p -> K^++Sigma^-$], [0], [$+1-1=0$], [允许],
    [(c)], [$K^-+p -> K^++Xi^0+pi^-$], [$-1$], [$+1-2=-1$], [允许],
    [(d)], [$K^++p -> K^-+Xi^0+pi^-$], [$+1$], [$-1-2=-3$], [不允许],
  )
]

#ex("3.8")[
  For each of the following reactions, establish whether or not it is allowed; if it is not, give the reasons why.
  $
    (a) & quad p -> n + e^+ \
    (b) & quad mu^+ -> nu_mu + e^+ \
    (c) & quad e^+ + e^- -> nu_mu + overline(nu)_mu \
    (d) & quad nu_mu + p -> mu^+ + n \
    (e) & quad nu_mu + n -> mu^- + p \
    (f) & quad nu_mu + n -> e^- + p \
    (g) & quad e^+ + n -> p + nu_e \
    (h) & quad e^- + p -> n + nu_e
  $
]

#solution[

  注意到
  $
    L(e^-)=L(mu^-)=L(nu_e)=L(nu_mu)=+1
  $
  反粒子的对应轻子数为 $-1$。强子与光子的轻子数为零。

  #block[
    #set text(size: 10.5pt)
    #table(
      columns: (0.45fr, 2.8fr, 1.1fr, 4.25fr),
      inset: 5pt,
      table.header([项], [过程], [结论], [理由]),
      [(a)],
      [$p -> n+e^+$],
      [禁戒],
      [$L:0 -> -1$；一个费米子变为两个费米子，违反 $J$；且自由质子质量小于 $m_n+m_e$，运动学也不允许。],

      [(b)],
      [$mu^+ -> nu_mu+e^+$],
      [禁戒],
      [初态总 $L=-1$，末态为 $+1-1=0$；总轻子数及轻子味均不匹配，且一个费米子变为两个费米子，违反 $J$。],

      [(c)], [$e^++e^- -> nu_mu+overline(nu)_mu$], [允许，W], [$Q,B,L_e,L_mu$ 均守恒。],

      [(d)], [$nu_mu+p -> mu^++n$], [禁戒], [$L_mu:+1 -> -1$，违反总轻子数。],

      [(e)], [$nu_mu+n -> mu^-+p$], [允许，W], [$L_mu:+1 -> +1$。],
      [(f)], [$nu_mu+n -> e^-+p$], [禁戒], [$L_mu:1 -> 0$、$L_e:0 -> 1$。],

      [(g)], [$e^++n -> p+nu_e$], [禁戒], [$L_e:-1 -> +1$；将末态改为 $overline(nu)_e$ 后才守恒轻子数。],
      [(h)], [$e^-+p -> n+nu_e$], [允许，W], [守恒总轻子数及电子轻子数。],
    )
  ]
]

#ex("3.9")[
  Evaluate the ratios between the cross-sections of the following reactions at the same energy, assuming (unrealistically) that they proceed only through the $I = 3/2$ channel:
  $
    pi^- p -> K^0 Sigma^0; quad
    pi^- p -> K^+ Sigma^-; quad
    pi^+ p -> K^+ Sigma^+.
  $
]

#solution[

  注意到
  $
    I_pi=I_Sigma=1, I_N=I_K=1/2
  $
  并约定双重态为 $(p,n)$、$(K^+,K^0)$，三重态的 $I_3=+1,0,-1$ 分别对应 $pi^+,pi^0,pi^-$ 或 $Sigma^+,Sigma^0,Sigma^-$。

  在 $I_3=-1/2$ 子空间如下
  $
         ket(pi^- p) & = 1/sqrt(3) ket(3/2 "," -1/2)-sqrt(2/3) ket(1/2 "," -1/2) \
    ket(Sigma^0 K^0) & = sqrt(2/3) ket(3/2 "," -1/2)+1/sqrt(3) ket(1/2 "," -1/2) \
    ket(Sigma^- K^+) & = 1/sqrt(3) ket(3/2 "," -1/2)-sqrt(2/3) ket(1/2 "," -1/2)
  $
  最高权态
  $
    ket(pi^+ p)=ket(3/2 "," 3/2), quad ket(Sigma^+ K^+)=ket(3/2 "," 3/2)
  $
  只看 $A_(3/2)$ ，各振幅由初、末态得到
  $
    cal(M)_1 & = (1/sqrt(3) bra(3/2 "," -1/2)-sqrt(2/3) bra(1/2 "," -1/2)) cal(S) (sqrt(2/3) ket(3/2 "," -1/2)+1/sqrt(3) ket(1/2 "," -1/2) ) = sqrt(2)/3 A_(3/2) \
    cal(M)_2 & = (1/sqrt(3) bra(3/2 "," -1/2)-sqrt(2/3) bra(1/2 "," -1/2)) cal(S) (1/sqrt(3) ket(3/2 "," -1/2)+sqrt(2/3) ket(1/2 "," -1/2) ) = 1/3 A_(3/2) \
    cal(M)_3 & = bra(3/2 "," 3/2) cal(S) ket(3/2 "," 3/2) = A_(3/2)
  $
  因此
  $
    sigma(pi^- p -> K^0 Sigma^0):sigma(pi^- p -> K^+ Sigma^-):sigma(pi^+ p -> K^+ Sigma^+)=2:1:9
  $
]

#ex("3.10")[
  Evaluate the ratios between the cross-sections, at the same energy, of (1) $pi^- p -> K^0 Sigma^0$, (2) $pi^- p -> K^+ Sigma^-$ and (3) $pi^+ p -> K^+ Sigma^+$, taking into account the contributions of both isospin amplitudes $A_(1/2)$ and $A_(3/2)$.
]

#solution[
  得到
  $
    cal(M)_1 & = cal(M)(pi^- p -> K^0 Sigma^0)
               =sqrt(2)/3 (A_(3/2)-A_(1/2)) \
    cal(M)_2 & = cal(M)(pi^- p -> K^+ Sigma^-)
               =1/3 (A_(3/2)+2A_(1/2)) \
    cal(M)_3 & = cal(M)(pi^+ p -> K^+ Sigma^+)=A_(3/2)
  $
  从而
  $
    sigma_1:sigma_2:sigma_3
    =2 abs(A_(3/2)-A_(1/2))^2:
    abs(A_(3/2)+2A_(1/2))^2:9 abs(A_(3/2))^2.
  $
  // 为显示相对相位的作用，令 $A_3=A_(3/2)$、$A_1=A_(1/2)$，则
  // $
  //   9 abs(cal(M)_1)^2 & =2abs(A_3)^2+2abs(A_1)^2-4op("Re")(A_3 A_1^*), \
  //   9 abs(cal(M)_2)^2 & =abs(A_3)^2+4abs(A_1)^2+4op("Re")(A_3 A_1^*), \
  //   9 abs(cal(M)_3)^2 & =9abs(A_3)^2.
  // $
]

#ex("3.11")[
  Evaluate the ratio between the cross-sections of the reactions $pi^- p -> Lambda K^0$ and $pi^+ n -> Lambda K^+$, at the same energy.
]

#solution[
  $Lambda$ 是同位旋单态，$I_Lambda=0$，而 $K$ 是 $I_K=1/2$ 的双重态，因此末态只能有 $I=1/2$。初态 $pi N$ 中的 $I=3/2$ 分量不贡献本反应。

  两个初态为
  $
    ket(pi^- p) & =1/sqrt(3)ket(3/2 "," -1/2)-sqrt(2/3)ket(1/2 "," -1/2) \
    ket(pi^+ n) & =1/sqrt(3)ket(3/2 "," 1/2)+sqrt(2/3)ket(1/2 "," 1/2)
  $
  末态同位旋部分为
  $
    ket(Lambda K^0)=ket(1/2 "," -1/2), quad
    ket(Lambda K^+)=ket(1/2 "," 1/2)
  $
  记这一反应的 $I=1/2$ 约化振幅为 $B_(1/2)$，则
  $
    cal(M)(pi^-p -> Lambda K^0) & =-sqrt(2/3)B_(1/2) \
    cal(M)(pi^+n -> Lambda K^+) & =+sqrt(2/3)B_(1/2)
  $
  // 两振幅仅相差一个约定相关的整体相位，其模平方相等。因此在同位旋对称近似及相同质心能量下，
  从而
  $
    sigma(pi^-p -> Lambda K^0)/sigma(pi^+n -> Lambda K^+)=1
  $
  // 这既适用于对应角度的微分截面，也适用于作相同角度积分后的总截面。实际粒子质量差、电磁效应会造成修正，尤其在阈值附近。
]

#ex("3.16")[
  Express the ratio of cross-sections of the elastic $pi^- p -> pi^- p$ and the charge exchange $pi^- p -> pi^0 n$ scatterings in terms of the isospin amplitudes $A_(1/2)$ and $A_(3/2)$.
]

#solution[
  在 $I_3=-1/2$ 子空间中，
  $
    ket(pi^-p) & =1/sqrt(3)ket(3/2 "," -1/2)-sqrt(2/3)ket(1/2 "," -1/2) \
    ket(pi^0n) & =sqrt(2/3)ket(3/2 "," -1/2)+1/sqrt(3)ket(1/2 "," -1/2)
  $
  因此
  $
     cal(M)_"el" & =1/3 A_(3/2)+2/3 A_(1/2) \
    cal(M)_"cex" & =sqrt(2)/3(A_(3/2)-A_(1/2))
  $
  所以固定相同运动学的截面比为
  $
    frac(dif sigma_"el", dif Omega)/frac(dif sigma_"cex", dif Omega)
    =abs(A_(3/2)+2A_(1/2))^2/(2abs(A_(3/2)-A_(1/2))^2)
  $
]

#ex("3.17")[
  A $pi^-$ is captured by a deuteron $d$ ($J^P = 1^+$) and produces the reaction $pi^- + d -> n + n$.

  (a) If the capture is from an S wave, what is the total spin of the two neutrons and what is their orbital momentum? (b) Show that if the capture is from a P state, the neutrons are in a singlet.
]

#solution[
  设 pion 与氘核的相对轨道角动量为 $l_i$，末态两个中子的相对轨道角动量、自旋分别为 $L,S$。
  $
    P_pi=-1, P_d=P_n=+1
  $
  则宇称守恒给出
  $
    P_i=(-1)^(l_i+1)=P_f=(-1)^L
  $
  两个中子是相同费米子，且其同位旋态只能是 $I=1,I_3=-1$，在交换下对称。空间、旋量、同位旋部分的交换因子相乘必须为 $-1$：
  $
    (-1)^L (-1)^(S+1) times 1=-1,
    quad "即" quad L+S="偶数"
  $
  其中 $(-1)^(S+1)$ 是两个自旋 $1/2$ 粒子的自旋态在交换下的本征值：$S=1$ 的三重态对称，因而取 $+1$；$S=0$ 的单态反对称，因而取 $-1$。

  *（a）S 波俘获。* 此时 $l_i=0$，pion 自旋为零，初态总角动量为氘核的自旋 $J_i=1$，而 $P_i=-1$。所以末态 $L$ 必须为奇数；由 $L+S$ 为偶数可知 $S=1$。

  将 $S=1$ 与奇数 $L$ 耦合成 $J_f=1$，只有 $L=1$ 满足三角条件。因此
  $
    S=1, quad L=1, quad "末态为" quad ""^3 P_1
  $
  #newpara()
  *（b）P 波俘获。* 此时 $l_i=1$，初态 $P_i=+1$，故末态 $L$ 为偶数。再用 $L+S$ 为偶数以及 $S=0,1$，得
  $
    S=0 quad "（自旋单态）"
  $
  初态可有 $J_i=0,1,2$；末态 $S=0$ 意味着 $J_f=L$，又要求 $L$ 为偶数，所以可达的是
  $
    J_i=0 -> ""^1 S_0, quad J_i=2 -> ""^1 D_2
  $
  // 初态 $J_i=1$ 的 P 波分量不能通过这一守恒宇称的二中子末态衰变。自旋单态并不意味着轨道也一定是 S 波。
]

#ex("3.18")[
  The positronium is an atomic system made by an $e^-$ and an $e^+$ bound by the electromagnetic force.
  #enum(numbering: "(1)")[
    Determine the relationship that this condition imposes between the orbital momentum $l$, the total spin $s$ and the charge conjugation $C$.
  ][
    Determine the relationship between $l$, $s$ and $n$ which allows the reaction $e^- e^+ -> n gamma$ to occur without violating $C$.
  ][
    What is the minimum number of photons in which the ortho-positronium ($""^3 S_1$) and the para-positronium ($""^1 S_0$) can annihilate, respectively?
  ]
]

#solution[

  *（1）$l,s$ 与 $C$ 的关系。* 电荷共轭把 $e^-$ 与 $e^+$ 交换。对于具有确定相对轨道角动量 $l$ 和总自旋 $s$ 的费米子–反费米子态：相对坐标反号给出 $(-1)^l$，两个自旋 $1/2$ 的旋量交换给出 $(-1)^(s+1)$，费米产生算符重新排序另给出 $-1$。总因子为
  $
    C=(-1)^l (-1)^(s+1)(-1),
    quad C_(e^+ e^-)=(-1)^(l+s)
  $
  // 这是粒子–反粒子耦合态的电荷共轭本征值，不能直接解释成两个带电单粒子各自可测量的 $C$ 宇称之积。
  #newpara()
  *（2）光子数奇偶。* 单个光子的 $C$ 宇称为 $-1$，因此 $n$ 光子态的 $C$ 宇称是 $(-1)^n$。电磁相互作用守恒 $C$，要求
  $
    (-1)^(l+s)=(-1)^n,
    quad l+s+n="偶数"
  $
  所以 $l+s$ 为偶数时只能湮灭成偶数个光子，为奇数时只能湮灭成奇数个光子。还要同时满足四动量和角动量守恒。

  *（3）ortho 与 para。*
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr),
    inset: 6pt,
    table.header([名称与谱项], [$l,s$], [$C$], [最少光子数]),
    [ortho：$""^3 S_1$], [$0,1$], [$-1$], [$3$],
    [para：$""^1 S_0$], [$0,0$], [$+1$], [$2$],
  )
  // 对 ortho 态，$C$ 允许奇数个光子，但孤立的有质量正电子偶素不能湮灭成*一个实光子*：初态不变质量平方大于零，单实光子的四动量平方却为零。因此最少是3光子。para 态的2光子末态同时满足 $C$、角动量和四动量守恒。
  // $
  //   "ortho" -> 3gamma, quad "para" -> 2gamma
  // $
  // 上述结论针对真空中孤立的正电子偶素；若有介质或外部粒子参与，额外体系可带走能量、动量和角动量，不能直接套用同一个最少光子数结论。
]


#ex("3.19")[
  Establish from which initial states of the $overline(p) p$ system amongst
  $
    ""^1 S_0, ""^3 S_1, ""^1 P_1, ""^3 P_0, ""^3 P_1,
    ""^3 P_2, ""^1 D_2, ""^3 D_1, ""^3 D_2, ""^3 D_3
  $
  the reaction $overline(p) p -> n pi^0$ can proceed with parity conservation: (1) for any $n$; (2) for $n=2$.
]

#solution[
  对确定 $L,S,J$ 的质子–反质子态
  $
    P_i=(-1)^(L+1), quad C_i=(-1)^(L+S)
  $
  每个 $pi^0$ 的 $C$ 宇称为 $+1$，故任意 $n$ 的纯 $pi^0$ 末态都有 $C_f=+1$。

  *（1）$n$ 不固定时的通常湮灭选择。* $C$ 守恒，要求 $L+S$ 为偶数
  #table(
    columns: (1fr, 1fr, 1.35fr),
    inset: 5pt,
    table.header([初态], [$J^(P C)$], [$C_f=+1$ 是否允许]),
    [$""^1 S_0$], [$0^(-+)$], [是],
    [$""^3 S_1$], [$1^(--)$], [否],
    [$""^1 P_1$], [$1^(+-)$], [否],
    [$""^3 P_0$], [$0^(++)$], [是],
    [$""^3 P_1$], [$1^(++)$], [是],
    [$""^3 P_2$], [$2^(++)$], [是],
    [$""^1 D_2$], [$2^(-+)$], [是],
    [$""^3 D_1$], [$1^(--)$], [否],
    [$""^3 D_2$], [$2^(--)$], [否],
    [$""^3 D_3$], [$3^(--)$], [否],
  )
  因而，在尚未指定中性 pion 数目及其轨道态时，第一步候选集合为
  $
    ""^1 S_0, quad ""^3 P_0, quad ""^3 P_1, quad ""^3 P_2, quad ""^1 D_2
  $
  // 这里“$n$ 不固定”不表示上述每个态对*每一个* $n$ 都允许。指定 $n$ 后，还需对末态的总 $J^P$ 与玻色对称性逐项检查。若仅假设 $P$ 守恒而不假设 $C$，则不能从宇称公式推出 $L+S$ 为偶数，也不能据此排除表中的全部 $C=-1$ 态。
  #newpara()

  *（2）两个 $pi^0$。* 两粒子都是相同的自旋零玻色子，交换对称性要求相对轨道角动量 $l_f$ 为偶数。因此 $J_f=l_f$ 为偶数，且
  $
    P_f=(-1)^2(-1)^(l_f)=+1, quad C_f=+1.
  $
  初态必须有偶数 $J$、正宇称。在题列初态中恰有
  $
    p overline(p) -> 2pi^0 : quad ""^3 P_0 quad "或" quad ""^3 P_2
  $
  分别对应末态 $l_f=0$、$l_f=2$。
]


#ex("3.20")[
  Consider the strong processes $overline(K) K -> pi^+ pi^-$ (where $overline(K) K$ means both $K^+ K^-$ and $overline(K)^0 K^0$).
  #enum(numbering: "(1)")[
    What are the possible angular momentum values if the initial total isospin is $I=0$?
  ][
    What are they if $I=1$?
  ]
]

#solution[
  kaon 和 pion 的自旋均为零，两个 $K$ 的同位旋分别为 $1/2$，所以
  $
    1/2 ⊗ 1/2=0 ⊕ 1
  $
  在强相互作用的同位旋对称近似中，初末态总同位旋相等；因此 $pi pi$ 末态只能取 $I=0$ 或 $I=1$。

  设末态两个 pion 的相对轨道角动量为 $l$。同一同位旋多重态的两个玻色子，要求空间与同位旋波函数的乘积在交换下对称。

  两个 $I_pi=1$ 的粒子耦合到 $I$ 时，同位旋交换因子为
  $
    (-1)^(2-I)=(-1)^I
  $
  这是 Clebsch–Gordan 系数的交换对称性：交换两个相同的 $j=1$ 同位旋粒子时，耦合态 $ket(1\,1)$ 会得到因子 $(-1)^(2j-I)=(-1)^(2-I)$。
  因而
  $
    (-1)^l (-1)^I=+1,
    quad l+I="偶数"
  $
  两个末态 pion 没有自旋，所以 $J=l$。初态两 kaon 也没有自旋，故初态相对轨道角动量同样等于 $J$。

  *（1）$I=0$。* 同位旋态对称，空间态也须对称：
  $
    J=l=0, 2, 4, dots quad "（S、D、G…波）"
  $

  *（2）$I=1$。* 同位旋态反对称，空间态须反对称：
  $
    J=l=1, 3, 5, dots quad "（P、F、H…波）"
  $
  // 初态与末态均由两个负宇称自旋零介子组成，故都有 $P=(-1)^J$，上述条件亦与宇称守恒一致。这里给出的是选择定则允许的全部 $J$；高角动量在低能附近仍会受到离心势垒抑制。
]

#ex("3.21")[
  Consider the following $overline(p) p$ initial states:
  $
    ""^1 S_0, ""^3 S_1, ""^1 P_1, ""^3 P_0, ""^3 P_1,
    ""^3 P_2, ""^1 D_2, ""^3 D_1, ""^3 D_2, ""^3 D_3.
  $
  Establish from which of these the reaction $overline(p) p -> pi^+ pi^-$ can proceed if the two $pi$ s are: (1) in an S wave, (2) in a P wave and (3) in a D wave?
]

#solution[
  对初态和末态分别写出守恒量
  $
    p overline(p): quad P_i=(-1)^(L_i+1), quad C_i=(-1)^(L_i+S_i)\
    pi^+ pi^-: quad J_f=l_f, quad P_f=(-1)^(l_f), quad C_f=(-1)^(l_f)
  $
  - 这里 $L_i,S_i$ 是 $p overline(p)$ 的相对轨道角动量和总自旋。质子与反质子的内禀宇称相反，所以两体宇称为
  $
    P_i=(-1)^(L_i)(-1)=-(-1)^(L_i)=(-1)^(L_i+1)
  $
  - 对于中性粒子--反粒子对，电荷共轭还会交换 $p$ 与 $overline(p)$；交换同时给出自旋波函数因子 $(-1)^(S_i+1)$ 和空间波函数因子 $(-1)^(L_i)$，合起来得到
    $
      C_i=(-1)^(L_i+S_i)
    $
  - 末态 $pi^+ pi^-$ 的两粒子自旋均为零，故 $J_f=l_f$。电荷共轭把 $pi^+$ 与 $pi^-$ 互换，这等价于把相对坐标 $bold(r)$ 变为 $-bold(r)$，所以相对轨道波函数给出 $C_f=(-1)^(l_f)$。两个 pion 的内禀宇称都为 $-1$，其乘积为 $+1$，因而 $P_f=(+1)(-1)^(l_f)=(-1)^(l_f)$。


  强或电磁湮灭需同时满足 $J_i=J_f$、$P_i=P_f$、$C_i=C_f$。

  #table(
    columns: (1fr, 1fr, 1.5fr),
    inset: 5pt,
    table.header([初态], [$J^(P C)$], [与哪个末态匹配]),
    [$""^1 S_0$], [$0^(-+)$], [均不匹配],
    [$""^3 S_1$], [$1^(--)$], [P 波],
    [$""^1 P_1$], [$1^(+-)$], [均不匹配],
    [$""^3 P_0$], [$0^(++)$], [S 波],
    [$""^3 P_1$], [$1^(++)$], [均不匹配],
    [$""^3 P_2$], [$2^(++)$], [D 波],
    [$""^1 D_2$], [$2^(-+)$], [均不匹配],
    [$""^3 D_1$], [$1^(--)$], [P 波],
    [$""^3 D_2$], [$2^(--)$], [均不匹配],
    [$""^3 D_3$], [$3^(--)$], [均不匹配],
  )

  因此
  $
    l_f=0 quad (J^(P C)=0^(++)) & : quad ""^3 P_0 \
    l_f=1 quad (J^(P C)=1^(--)) & : quad ""^3 S_1 quad "或" quad ""^3 D_1 \
    l_f=2 quad (J^(P C)=2^(++)) & : quad ""^3 P_2
  $
  // 当进一步要求强作用下的同位旋守恒时，偶数 $l_f$ 对应 $I=0$，奇数 $l_f$ 对应 $I=1$；$p overline(p)$ 初态可以含这两种同位旋，故上述谱项列表仍成立。
]

#ex("3.27")[
  Which of the following reactions are forbidden/allowed? Justify your statements.
  $
    (a) & quad mu^- -> e^- + gamma \
    (b) & quad pi^+ -> mu^+ + nu_mu + overline(nu)_mu \
    (c) & quad Sigma^0 -> Lambda + gamma \
    (d) & quad eta -> gamma + gamma + gamma \
    (e) & quad gamma + p -> pi^0 + p \
    (f) & quad p -> pi^0 + e^+ \
    (g) & quad pi^- -> mu^- + gamma.
  $
]

#solution[
  #set text(size: 10.5pt)
  #table(
    columns: (0.45fr, 2.9fr, 1.05fr, 4.2fr),
    inset: 5pt,
    table.header([项], [过程], [结论], [依据]),
    [(a)], [$mu^- -> e^-+gamma$], [禁戒], [总 $L$ 不变，但分别破坏 $L_mu$ 和 $L_e$。],

    [(b)],
    [$pi^+ -> mu^++nu_mu+overline(nu)_mu$],
    [禁戒],
    [末态总 $L=-1+1-1=-1$，初态为0；末态为三个费米子，总 $J$ 为半整数，不能来自自旋0的 pion。],

    [(c)], [$Sigma^0 -> Lambda+gamma$], [允许，EM], [$Q=0,B=1,S=-1$ 均守恒，且 $m_(Sigma^0)>m_Lambda$；为电磁跃迁。],
    [(d)], [$eta -> gamma+gamma+gamma$], [S、EM 禁戒], [$C(eta)=+1$，$C(3gamma)=-1$，违反强、电磁作用的 $C$ 守恒。],

    [(e)], [$gamma+p -> pi^0+p$], [允许，EM], [中性 pion 光产生；守恒 $Q,B,L,S$，但必须满足光子阈能。],
    [(f)], [$p -> pi^0+e^+$], [禁戒], [$B:1 -> 0$，$L:0 -> -1$。],

    [(g)],
    [$pi^- -> mu^-+gamma$],
    [禁戒],
    [$L_mu:0 -> +1$；末态一个费米子加一个光子，总 $J$ 必为半整数，不能与初态 $J=0$ 匹配。],
  )
]

#ex("3.29")[
  Consider the $Xi^0$ hyperon produced in the reaction $pi^+ + p -> K^+ + K^+ + Xi^0$. Knowing the isospin and its third component for all the other particles, establish $I$ and $I_z$ of the $Xi^0$.
]

#solution[
  态由最高权态 $pi^+$ 与 $p$ 构成：
  $
    I_(3,"in")=1+1/2=3/2, quad I_"in"=3/2
  $
  两个 $K^+$ 的第三分量之和为 $1/2+1/2=1$；由 $I_3$ 守恒，
  $
    3/2=1+I_3(Xi^0), quad I_3(Xi^0)=1/2
  $
  #newpara()
  两个 $I=1/2$ 的 $K$ 可耦合为 $I_(K K)=0,1$，但 $I_(3,K K)=1$ 排除了单态，故这对 kaon 必为 $I_(K K)=1$。末态总同位旋需含有初态的 $3/2$ 分量，所以三角条件为
  $
    abs(I_Xi-1)<=3/2<=I_Xi+1.
  $
  同时，$I_Xi$ 必为能容纳 $I_3=1/2$ 的半整数。两者合起来只给出
  $
    I_Xi in {1/2,3/2,5/2}
  $
  // 这三个取值对应的电荷态向总同位旋 $I=3/2$ 的投影系数，其大小分别为 $1$、$sqrt(2/5)$、$1/sqrt(15)$，均非零。故它们确实都能产生该总同位旋分量。

  本反应及其他粒子的同位旋信息不足以单独证明 $I_Xi=1/2$。
]
