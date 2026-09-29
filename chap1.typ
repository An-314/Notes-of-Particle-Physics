#import "@preview/scripst:1.1.3": *

= 概论、预备知识

除另有说明外，本章采用自然单位制$hbar = c = 1$和度规号差$(+, -, -, -)$。涉及实际长度、时间或探测器参数时，再显式恢复$hbar$与$c$。

== 概论：基本粒子和相互作用 (Elementary Particles and Interactions)

粒子物理是研究基本粒子和其相互作用的学科。“基本”具有“与时俱进”的意义：随着理论和实验的发展，曾经被认为是基本粒子的粒子可能会被发现是由更基本的粒子组成的。

标准模型中的物质粒子分为*夸克和轻子*两类，每类有三代，均为自旋$1/2$的费米子。以下电荷数均以正的元电荷$e$为单位：
- 夸克有六种味：
  - 上($u$), 粲($c$), 顶($t$) 具有电荷 $+2/3$
  - 下($d$), 奇($s$), 底($b$) 具有电荷 $-1/3$
- 轻子也有六种味：
  - 电子($e$), $μ$子($μ$), $τ$子($τ$) 具有电荷 $-1$
  - 电子中微子($nu_e$), $μ$中微子($nu_mu$), $τ$中微子($nu_tau$) 具有电荷 $0$
每一种夸克具有三种色态；轻子不带色荷。反粒子与相应粒子的质量、自旋相同，电荷等可加性内部量子数相反，但电中性并不意味着粒子一定是自身的反粒子，例如中子和反中子不同。

规范玻色子$gamma,g,W^(plus.minus),Z^0$的自旋为$1$，Higgs玻色子的自旋为$0$。Higgs机制解释了标准模型中$W,Z$及带电费米子获得质量的方式，但费米子质量的数值由Yukawa耦合决定，并未因此得到预测。质子和中子的大部分质量来自强相互作用动力学，而不是简单等于组成夸克的静质量之和。三代结构、费米子质量层次和中微子质量的完整起源仍是重要问题。

#block(breakable: false)[
  #note(subname: [基本粒子与可观测末态])[
    “基本”指在所考察尺度上没有显现内部结构，不等于“稳定”，也不等于能以自由粒子形式被探测。由于夸克禁闭，夸克和胶子在实验中通常通过强子及喷注显现；短寿命粒子则通过衰变产物重建。
  ]
]
#newpara()

我们用波函数描述*粒子*的状态
$
  ket(psi)
$
例如一个确定动量和自旋投影的自由电子态，可取为电荷、总自旋平方、自旋投影、动量和能量的共同本征态
$
  hat(Q) ket(psi) = -e ket(psi)\
  hat(vb(S))^2 ket(psi) = s(s+1) ket(psi), quad hat(S)_z ket(psi) = s_z ket(psi)\
$
$
  hat(vb(p)) ket(psi) = vb(p) ket(psi)\
  hat(H) ket(psi) = E ket(psi)\
  ==> E^2 - p^2 = m^2
$
我们说量子数为$-e,s=1/2,m=0.511"MeV"$的量子态定义为电子。更严格地说：具有电子的质量、自旋及内部量子数，并属于相应一粒子表示空间的量子态，称为电子的一粒子态。

找一组彼此相容的物理量，用它们的本征值给量子态贴标签。例如一个自由电子平面波态可以写成
$
  ket(e^-\;vb(p)\, s_z)
$
一种粒子对应一整个一粒子态空间，而不是某一个固定动量的态。在理想的稳定渐近粒子描述中，Wigner分类给出
$
  "一种稳定粒子的一粒子态空间" <--> "Poincaré 群的不可约幺正表示"
$
相对论告诉我们，物理规律应该在：
- 时间平移
- 空间平移
- 空间旋转
- Lorentz boost
下保持相应的对称性。这些变换组成 Poincaré 群。

Poincaré 群有两个 Casimir 算符：
- 第一个是
  $
    P^mu P_mu
  $
  其中
  $
    P^mu = (H, vb(P))
  $
  是四动量算符。对于一个有质量的一粒子态
  $
    P^mu P_mu ket(psi) = m^2 ket(psi)
  $
- 第二个Casimir算符是$W^mu W_mu$，其中Pauli–Lubanski向量为
  $
    W^mu = 1/2 epsilon^(mu nu rho sigma) P_nu M_(rho sigma)
  $
  对有质量粒子
  $
    W^mu W_mu ket(psi) = -m^2 s(s+1) ket(psi)
  $
于是$m,s$标记有质量粒子的一粒子表示，内部量子数还用于区分具有相同$m,s$的不同种类。这种分类也适用于稳定复合粒子，不能单凭Poincaré表示判断是否具有内部结构。

对无质量粒子没有静止系，通常用*螺旋度*（helicity）$h = vb(S) dot vb(p)/abs(vb(p))$标记其自旋自由度。例如自由光子有$h = plus.minus 1$两种物理偏振，而不是有质量自旋$1$粒子的三个偏振态。

在标准模型中，还需说明场在内部对称性下的变换方式。电子的左、右手分量具有不同的弱同位旋和超荷，因此不能把它们都视为同一个电弱不可约表示。

于是电子的一粒子空间可以粗略写成
$
  cal(H)_e = "span"{ ket(e^-\;vb(p)\, s_z)}
$

#note(subname: [超选择规则])[
  普通量子力学告诉我们，Hilbert 空间是线性的。如果
  $
    ket(psi_1), ket(psi_2) in cal(H)
  $
  是合法态，那么
  $
    ket(psi) = alpha ket(psi_1) + beta ket(psi_2)
  $
  在数学上当然仍然是 Hilbert 空间中的态，但是在物理上却不一定是合法态。例如
  $
    1/sqrt(2) (ket(e^-) + ket(p))
  $
  没有物理意义，因为电子和质子具有不同的电荷。我们说电子态和质子态属于不同的*超选择子空间*，相对相位不能由电荷守恒的物理可观测量测出。这里关键是*总电荷的超选择规则*，并非所有不同的内部量子数都会导致超选择。

  正常的量子叠加例如自旋
  $
    ket(psi) = 1/sqrt(2) (ket(arrow.t) + e^(i phi) ket(arrow.b))
  $
  对归一化的自旋$1/2$态，$phi$影响可观测量$S_x,S_y$。在$hbar=1$时
  $
    expval(S_x) = braket(psi, hat(S)_x, psi) = 1/2 cos(phi), quad expval(S_y) = 1/2 sin(phi) \
  $
  所以
  $
    ket(arrow.t) + ket(arrow.b), ket(arrow.t) - ket(arrow.b)
  $
  是真正不同的物理状态，这叫相干叠加。

  超选择假设 Hilbert 空间分成
  $
    cal(H) = plus.o.big_alpha cal(H)_alpha
  $
  每个$cal(H)_alpha$是一个 superselection sector超选择扇区。如果任何物理可观测量$hat(A)$都不能把一个 sector 连到另一个 sector，那么
  $
    braket(psi_a, hat(A), psi_b) = 0, forall ket(psi_a) in cal(H)_a, forall ket(psi_b) in cal(H)_b
  $
  从而
  $
    ket(Psi) = 1/sqrt(2) (ket(psi_a) + e^(i phi) ket(psi_b))
  $
  对于可观测量$hat(A)$的测量
  $
    expval(A) = braket(Psi, hat(A), Psi) = 1/2 (braket(psi_a, hat(A), psi_a) + braket(psi_b, hat(A), psi_b))
  $
  完全没有$phi$。相对于上述物理可观测量代数$cal(A)$，跨扇区的相位无法被测出。事实上
  $
    (ket(psi_a) + e^(i phi) ket(psi_b)) / sqrt(2)
  $
  和混合态
  $
    rho = 1/2 (ket(psi_a) bra(psi_a) + ket(psi_b) bra(psi_b))
  $
  完全不可区分。

  超选择算符$hat(Q)$满足
  $
    [hat(Q), hat(A)] = 0, forall hat(A) in cal(A)
  $
  而在QED中，电荷$Q$是一个超选择算符。于是不存在真正意义上的
  $
    e^- <-> p
  $
  相干。但其实很多不同“粒子态”完全可以叠加
  $
    ket(nu_e) = U_(e 1)^* ket(nu_1) + U_(e 2)^* ket(nu_2) + U_(e 3)^* ket(nu_3)
  $
  这里采用味场$nu_alpha = sum_i U_(alpha i) nu_i$的惯例，因此对应产生态的系数带复共轭。相干产生且传播中保持波包重叠时，不同质量分量可以干涉，形成中微子振荡；质量不同本身不构成这里的超选择禁令。
]
#newpara()
粒子之间的*相互作用*分为四种
#figure(
  three-line-table[
    | 相互作用 | 传递粒子 | 低能强弱示意 | 典型现象 |
    | --- | --- | --- | --- |
    | 强相互作用 | 胶子 | $1$ | 原子核 |
    | 电磁相互作用 | 光子 | $10^(-2)$ | 原子、分子、凝聚态物质 |
    | 弱相互作用 | W/Z Boson | $10^(-5)$ | $β$衰变、核反应 |
    | 引力相互作用 | 引力子(?) | $10^(-38)$ | 宇宙学 |
  ],
  caption: [四种基本相互作用],
)
这些量级不是四种相互作用在任意过程中的固定比例。电磁相互作用的低能耦合为$alpha = e^2/(4 pi) approx 1/137$，强耦合随能标变化；在远低于$W$质量的能区，弱过程的有效强度含有$G_F Q^2$，其中$G_F approx 1.166 times 10^(-5) "GeV"^(-2)$。必须给定能标$Q$、粒子种类及比较的物理量后，强弱比较才有明确含义。

基本粒子运动的规律由*量子场论*描述。量子场论的基本思想是：每种基本粒子对应一个场，粒子是场的激发态。不同的相互作用对应不同的场。例如
$
  n -> p + e^- + overline(nu)_e
$
可以在低能有效理论中用中子、质子和轻子场描述。在夸克层次，过程为$d -> u + W^-$，随后虚$W^-$产生$e^- overline(nu)_e$。质子和中子是复合粒子，其有效场不意味着它们是基本场。
- 每种粒子对应一种场，场没有不可入性，对应各种不同粒子的场在空间中相互重叠地充满全空间
- 场的能量最低状态称为基态，场的激发状态表现为出现相应的粒子，场的不同激发状态表现为粒子的数目和运动状态不同
  - 真空中没有相应的实粒子激发，但场的真空关联函数一般不为零；不能由“没有实粒子”推断“没有任何物理效应”
  - 因此场和粒子之间，场是更基本的，粒子只是场处于激发状态的表现
- 所有的场都处于基态时为物理真空
  - 由此可见，真空并不是“真”的“空”无一物
  - 真空是理论的最低能量态，不能无条件释放能量；外来能量可以激发粒子，同时必须满足能动量和其他守恒律
  - 例如
    $
      gamma + gamma -> e^+ + e^-
    $
    中电子对的能量来自入射光子，并非从真空无代价地产生能量

当代粒子物理所研究的“粒子”主要由：
- 夸克和轻子
- 传递相互作用的gauge bosons
  - $g, gamma, W^+, W^-, Z^0$
- Higgs 粒子
- 其它基本粒子（？）
  - 例如引力子（graviton）是引力相互作用的传递粒子，但目前还没有被发现
- 关于复合粒子的研究也是非常重要的内容
  - $p,n,pi,K,eta,rho,phi.alt, omega, J\/psi$等
  - 它们本身的性质提供了基本粒子间相互作用的信息，由于“夸克禁闭”，实验上经常通过研究
    $
      e + p, p + p, "ion" + p, "ion" + "ion", ...
    $
    等反应过程来研究强相互作用的性质

粒子数据组（Particle Data Group, PDG）在Review of Particle Physics及Particle Physics Booklet中汇集粒子性质、实验数据和综述。数值计算应注明采用的数据版本，可通过 #link("https://pdg.lbl.gov/")[PDG网站]查阅。

== 自然单位制 (Natural Units, NU)

=== 单位制

*国际单位制*(Système international d’unités, SI) 对描述粒子物理现象（微观、高速）很不方便，如：
$
    c & approx 2.998 times 10^8 "m/s" \
  m_p & approx 1.673 times 10^(-27) "kg" \
  r_p & tilde 10^(-15) "m" \
$
公式中经常出现两个物理学常数
$
  c, hbar = h/(2 pi)
$
希望构造一个单位制，使得$c=1, hbar=1$，这样就可以统一时间与长度的量纲，并统一能量、质量与动量的量纲。于是有了*自然单位制*（Natural Units, NU）。

国际单位制
- 基本量：质量$[M]$、长度$[L]$、时间$[T]$
- 基本单位：kg, m, s
自然单位制
- 基本量：能量$[E]$、作用量$[A]$、速度$[v]$
- 基本单位：GeV, $hbar$, $c$
在自然单位制下
$ c=1, hbar=1, h=2 pi $有常用关系
$
  hbar c approx 0.197 "GeV fm" \
$
在自然单位制下物理公式简洁，比如
$
  E^2 = p^2 + m^2
$

=== 单位制的转换
#newpara()
两种单位制的基本量之间的关系可以通过量纲分析得到。设两组基本单位分别记为
$
  [P_i], [Q_j]
$
满足
$
  [Q_j] = q_j product_(i=1)^n [P_i]^(a_(i j))
$
则物理量的表达为
$
  P & = p product_(i=1)^n [P_i]^(alpha_i) \
    & = q product_(j=1)^m [Q_j]^(beta_j) \
    & = q product_(j=1)^m (q_j product_(i=1)^n [P_i]^(a_(i j)))^(beta_j) \
$
就有
$
  p = q product_(j=1)^m q_j^(beta_j) \
  alpha_i = sum_(j=1)^m beta_j a_(i j)
$
例如
$
  E = 1 ["GeV"] approx 1.602 times 10^(-10) ["kg"] ["m"]^2 ["s"]^(-2)
$
#newpara()
特别地，SI和NU的转换如下表
#figure(
  three-line-table[
    | SI\\NU | [GeV] | [$hbar$] | [$c$] |
    | --- | --- | --- | --- |
    | [$M$] | $1$ | $1$ | $0$ |
    | [$L$] | $2$ | $2$ | $1$ |
    | [$T$] | $-2$ | $-1$ | $-1$ |
  ],
  caption: [SI和NU的量纲转换表],
)
也就是说
$
  a = (a_(i j)) = mat(1, 1, 0; 2, 2, 1; -2, -1, -1)
$
例如物理量
$
  alpha_E = mat(1; 2; -2), beta_E = mat(1; 0; 0)\
  alpha_p = mat(1; 1; -1), beta_p = mat(1; 0; -1)\
  alpha_m = mat(1; 0; 0), beta_m = mat(1; 0; -2)\
$
有
$
  alpha_i = a beta_i
$
以上是量纲的转换，数值的转换可以通过
$
      c & = 2.998 times 10^8 "m/s" \
   hbar & = 1.055 times 10^(-34) "J s" \
  "GeV" & = 1.602 times 10^(-10) "J" \
$
进行。

=== 常用换算与量纲检查

在$hbar=c=1$时，常用物理量的能量量纲为
#figure(
  three-line-table[
    | 物理量 | 自然单位中的量纲 |
    | --- | --- |
    | 能量、质量、动量、衰变宽度 | $[E]$ |
    | 长度、时间、寿命 | $[E]^(-1)$ |
    | 截面、面积 | $[E]^(-2)$ |
    | 速度、作用量 | $[E]^0$ |
    | 数密度 | $[E]^3$ |
  ],
  caption: [自然单位制下的常用量纲],
)
恢复实验单位时，利用
$
  hbar c approx 0.197327 "GeV fm", quad
  hbar approx 6.58212 times 10^(-25) "GeV s",
$
得到
$
  1 "GeV"^(-1) & = 0.197327 "fm" quad "（长度）" \
  1 "GeV"^(-1) & = 6.58212 times 10^(-25) "s" quad "（时间）" \
  1 "GeV"^(-2) & = 0.389379 "mb" quad "（截面）".
$
这里等号表示恢复相应的$hbar,c$后的数值换算，不是说SI中的时间与长度具有相同量纲。$1 "b" = 10^(-28) "m"^2$，$1 "mb" = 10^(-31) "m"^2$。

#example(subname: [寿命与探测尺度的单位换算])[
  若粒子宽度$Gamma = 1 "MeV"$，则
  $
    tau = hbar/Gamma approx 6.58 times 10^(-22) "s", quad
    c tau = (hbar c)/Gamma approx 197 "fm".
  $
  若动量转移量级为$Q = 1 "GeV"$，对应的空间分辨尺度约为$hbar c/Q approx 0.20 "fm"$。这个估算使用约化波长$hbar/p$；de Broglie波长$h/p$还多一个$2 pi$因子。
]

== 相对论运动学 (Relativistic Kinematics)

=== 记号和度规

一个事件由四维时空(Minkowski 空间)的*逆变矢量*描述
$
  x^mu = (t, x, y, z)
$
定义相应的*协变矢量*为
$
  x_mu = g_(mu nu) x^nu = (t, -x, -y, -z)
$
这里采用Einstein求和约定，即重复的上下指标求和；$g_(mu nu)$是Minkowski度规（metric），也记作$eta_(mu nu)$
$
  g_(mu nu) = g^(mu nu) = diag(1, -1, -1, -1)
$
有
$
  x^mu x_mu = t^2 - x^2 - y^2 - z^2
$

=== Lorentz变换 (Lorentz boosts)

在一个以速度$v_f$沿$x$轴运动参考系中，事件$x^mu$变换为
$
  x^(* mu) = (t^*, x^*, y^*, z^*)
$
变换关系称为 Lorentz 变换
$
  mat(t^*; x^*; y^*; z^*) = mat(gamma_f, -gamma_f v_f, 0, 0; -gamma_f v_f, gamma_f, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) mat(t; x; y; z)
$
其中
$
  beta_f = v_f, gamma_f = 1/sqrt(1 - beta_f^2)
$
垂直于运动方向的坐标不变，沿运动方向的坐标和时间变换为
$
  t^* = gamma_f (t - beta_f x) \
  x^* = gamma_f (x - beta_f t) \
$
#newpara()
一般的Lorentz变换，即四维时空转动可以写成
$
  x^(*mu) = Lambda^(mu)_("  "nu) x^nu\
  x^*_mu = Lambda_(mu)^("  "nu) x_nu
$
Lorentz 变换的定义就是要求
$
  x^(*mu) x^*_(mu) = x^mu x_mu
$
从而有
$
  Lambda^TT eta Lambda = eta
$
或者指标形式
$
  eta_(mu nu) Lambda^(mu)_("  "rho) Lambda^(nu)_("  "sigma) = eta_(rho sigma)
$
就是Lorentz空间的正交变换，也有
$
  Lambda_(mu)^("  "nu) = eta_(mu rho) Lambda^(rho)_("  "sigma) eta^("  "sigma nu)
$

=== 光锥和因果律 (light cone & causality)

取一个事件为坐标原点，另一个事件与它的坐标差为
$
  x^mu = (t, x, y, z)
$
两个事件的时空间隔为
$
  x^mu x_mu = t^2 - x^2 - y^2 - z^2
$
这是一个Lorentz不变量。根据$x^mu x_mu$的符号，时空点分为三类：
- $x^mu x_mu > 0$，称为*类时间隔*
- $x^mu x_mu = 0$，称为*类光间隔*
- $x^mu x_mu < 0$，称为*类空间隔*
因果联系是指一个事件的发生可能影响另一个事件的发生。类时间隔的事件可由低于光速的信号联系；类光间隔的事件可由光速信号联系，也可以传递信息。类空间隔的事件若要相互影响，则需要超光速信号，因此不能有因果联系。

#note(subname: [时间先后与参考系])[
  对两个不同的类时或类光事件，保持时间方向的Lorentz变换不会颠倒它们的先后顺序。类空间隔的两个事件则存在使其同时发生的参考系，也可以在不同参考系中具有相反的先后顺序；这并不违反因果律，因为它们不能相互传递信号。
]

=== 矢量 (vectors)

有4个分量的物理量，如果具有与时空坐标同样 Lorentz 变换性质，称为4-矢量，或矢量。

能量和动量组成矢量
$
  p^mu = (E, vb(p))
$
在运动参考系中的变换关系
$
  mat(E^*; p_parallel^*) = mat(gamma_f, -gamma_f beta_f; -gamma_f beta_f, gamma_f) mat(E; p_parallel)\
  vb(p)^*_T = vb(p)_T
$
其中
$
  beta_f = abs(vb(beta)_f), p_parallel = vb(p) dot vb(beta)_f / abs(vb(beta)_f), vb(p)_T = vb(p) - p_parallel vb(beta)_f / abs(vb(beta)_f)
$
#newpara()
角频率和波矢组成矢量
$
  k^mu = (omega, vb(k))
$
因为波的相位
$
  phi = k^mu x_mu = omega t - vb(k) dot vb(x)
$
是Lorentz不变量。考虑真空中的光波，令$theta$为原参考系中波矢与$x$轴的夹角。沿$x$轴以速度$beta$运动的观察者测得
$
      omega' & = gamma omega (1 - beta cos theta) \
        k'_x & = gamma (k_x - beta omega) = gamma omega (cos theta - beta) \
        k'_y & = k_y \
  tan theta' & = k'_y / k'_x = (sin theta) / (gamma (cos theta - beta))
$
这给出*相对论多普勒频移*（relativistic Doppler shift），同时也给出光行差
$
  cos theta' = (cos theta - beta)/(1 - beta cos theta)
$
“横向”必须注明参考系：若$theta=pi/2$，则$omega'=gamma omega$；若$theta'=pi/2$，则$omega'=omega/gamma$。两者对应不同的观测方向。

速度$vb(v)$的Lorentz变换可以从动量的变换关系得到
$
  vb(beta) = vb(p)/E
$
Lorentz变换有动量能量关系
$
  E^* = gamma_f (E - vb(beta)_f dot vb(p)) \
  vb(p)^*_parallel = gamma_f (vb(p)_parallel - vb(beta)_f E) \
  vb(p)^*_T = vb(p)_T
$
从而
$
  beta^*_parallel = (beta_parallel - beta_f) / (1 - beta_parallel beta_f) \
  vb(beta)^*_T = vb(beta)_T / (gamma_f (1 - beta_parallel beta_f))
$
横向速度在变换前后并不相同，这是相对论效应的一个重要特征。

=== 快度和赝快度 (rapidity and pseudo-rapidity)

注意到
$
  mat(E'; p'_z) = mat(gamma_f, -gamma_f beta_f; -gamma_f beta_f, gamma_f) mat(E; p_z)
$
其中
$
  beta_f = v_f, gamma_f = 1/sqrt(1 - beta_f^2)
$
从而有
$
  gamma_f^2 - (gamma_f beta_f)^2 = 1
$
而双曲函数恰好满足
$
  cosh^2 y - sinh^2 y = 1
$
自然令
$
  gamma_f = cosh y_f, gamma_f beta_f = sinh y_f
$
则有
$
  mat(E'; p'_z) = mat(cosh y_f, -sinh y_f; -sinh y_f, cosh y_f) mat(E; p_z)
$
Lorentz boost 保持
$
  E^2 - p_z^2 = m_T^2
$
$y$就是Minkowski空间中的双曲角。

于是粒子沿某一方向的快慢也可以用*快度*$y$来描写，定义如下
$
  tanh y = beta_parallel = p_parallel / E
$
其中$p_parallel$是粒子动量在所选纵轴上的分量，$E$是粒子能量。对$m_T>0$，$beta_parallel in (-1,1)$与$y in (-oo,+oo)$一一对应。在纵向速度绝对值很小时
$
  y = beta_parallel + O(beta_parallel^3)
$
其中
$
  tanh x = (sinh x) / (cosh x) = (e^x - e^(-x)) / (e^x + e^(-x))
$
#newpara()

对于横质量为$m_T$的粒子
$
  m_T = sqrt(m^2 + p_T^2)
$
为横质量，在纵向Lorentz变换下不变；还可以得到
$
  p_parallel = m_T sinh y\
  E = m_T cosh y
$

#newpara()
现在做一个快度为$y_f$的 Lorentz boost
$
           E' & = m_T cosh y cosh y_f - m_T sinh y sinh y_f = m_T cosh(y - y_f) \
  p'_parallel & = m_T sinh y cosh y_f - m_T cosh y sinh y_f = m_T sinh(y - y_f) \
         p'_T & = p_T
$
从而在纵向（$parallel$方向）洛伦兹变换下，快度的变换规律为
$
  y^* = y - y_f
$
其中$y_f$是两个参考系之间的相对快度。因此同一事例中两个粒子的快度差$Delta y=y_1-y_2$在共同的纵向boost下不变。当$p_T != 0$时，粒子的总Lorentz因子为$E/m$，不能直接写成$cosh y$。

#newpara()
而
$
  tanh y = (e^(2y) - 1) / (e^(2y) + 1)
$
从而
$
  beta_parallel = (e^(2y) - 1) / (e^(2y) + 1)
$
即
$
  e^(2 y) = (1 + beta_parallel) / (1 - beta_parallel)
$
从而在
$
  y^* = y - y_f
$
中
$
  y = 1/2 ln((E + p_parallel)/(E - p_parallel)) = 1/2 ln((1 + beta_parallel)/(1 - beta_parallel))\
  y_f = 1/2 ln((1 + beta_f)/(1 - beta_f))
$
#newpara()

实验分析中，常用*赝快度*$eta$代替快度，定义为
$
  eta = - ln tan(theta/2)
$
其中$theta$为粒子运动方向与标准方向（纵向正方向）的夹角
$
  eta = 1/2 ln ((abs(vb(p)) + p_parallel)/(abs(vb(p)) - p_parallel))
$
如果$m << p_T$，快度与赝快度相差很小
$
  y approx eta
$

赝快度只依赖方向；快度还依赖能量，即需要知道粒子质量。对$p_T>0$，有
$
  p_parallel = p_T sinh eta, quad abs(vb(p)) = p_T cosh eta, quad
  sinh y = p_T/m_T sinh eta
$
无质量粒子满足$y=eta$；有质量粒子的赝快度一般不服从简单的加法变换。沿束流方向严格共线的无质量粒子对应$y,eta$的无穷极限，不能代入$m_T=0$的参数式计算。

#note(subname: [从快度分布到赝快度分布])[
  固定$p_T$及粒子种类时，由$dd(p_parallel)=E dd(y)=abs(vb(p)) dd(eta)$得到
  $
    dv(y, eta) = abs(vb(p))/E, quad
    dv(N, eta) = abs(vb(p))/E dv(N, y)
  $
  对包含不同$p_T$和不同粒子种类的样本，需要逐项变换后再积分，不能直接乘上单一的常数。
]

对于两个近似无质量的粒子，不变质量还可以写为
$
  m_12^2 = 2 p_(T 1) p_(T 2) [cosh(y_1-y_2)-cos(phi_1-phi_2)]
$
此时也可以用$eta$代替$y$。这个表达式把可测的横动量、方向与不变质量重建联系起来。

=== 粒子的运动定律 (the law of motion of a particle)

对静质量不变的粒子，Newton第二定律
$
  vb(F) = dv(vb(p), t)
$
在相对论情形仍然适用，其中
$
  vb(p) = m gamma vb(beta)
$
则有
$
  vb(F) & = m gamma vb(a) + m dv(gamma, t) vb(beta) \
        & = m gamma vb(a) + m gamma^3 (vb(a) dot vb(beta)) vb(beta)
$
其中
$
  vb(a) = dv(vb(beta), t)
$
这里力分为两项：第一项平行于加速度，第二项平行于速度。从上式可求出加速度
$
  vb(F) - (vb(F) dot vb(beta)) vb(beta) = m gamma vb(a)
$
仅在两种情况下力与加速度方向相同：
- 力与速度方向相同
  $
    vb(F) = m gamma^3 vb(a)
  $
- 力与速度方向垂直
  $
    vb(F) = m gamma vb(a)
  $

四速度和四力则写成
$
  u^mu = dv(x^mu, tau) = gamma (1,vb(beta)), quad u^mu u_mu=1 \
  K^mu = dv(p^mu, tau) = gamma (vb(F) dot vb(beta),vb(F)), quad K^mu u_mu=0
$
其中使用了功率关系$dv(E, t)=vb(F) dot vb(beta)$。四力与四速度正交，反映$p^2=m^2$在运动中保持不变。

=== 不变量或标量 (invariants or scalars)

在Lorentz变换下不变的量（与参考系无关）称为不变量或标量。

- 矢量的“缩并”构成不变量
  $
    a dot b = a^mu b_mu
  $
- 粒子的不变质量/静质量 (invariant mass)
  $
    m^2 = p dot p = E^2 - vb(p)^2
  $
- 质点运动的原时 (proper time)
  $
    dd(tau)^2 & = dd(t)^2 - dd(x)^2 - dd(y)^2 - dd(z)^2 \
      dd(tau) & = dd(t) sqrt(1 - vb(beta)^2) = dd(t)/gamma
  $

=== 实验室系和质心系 (lab frame and center-of-mass frame)

两个粒子组成的系统（碰撞或者衰变末态），在*实验室系*(lab frame)中，总的能动量矢量
$
  p^mu = p_1^mu + p_2^mu = (E_1 + E_2, vb(p)_1 + vb(p)_2)
$
Lorentz不变量为
$
  p^mu p_mu = (E_1 + E_2)^2 - (vb(p)_1 + vb(p)_2)^2
$
在*质心系(Center-of-mass frame, CM)*中，两个粒子总动量为零
$
  vb(p)'_1 + vb(p)'_2 & = 0 \
          E'_1 + E'_2 & = E_"cm"
$
从而
$
  p^mu p_mu = E_"cm"^2
$
用实验室系测量的量表示，系统的不变质量（质心系总能量）为
$
  E_"cm" & = sqrt((E_1 + E_2)^2 - (vb(p)_1 + vb(p)_2)^2) \
         & = sqrt((m_1^2 + m_2^2 + 2 E_1 E_2(1 - beta_1 beta_2 cos theta)))
$
从而对多个粒子组成的系统
$
  E_"cm" = sqrt((sum_i E_i)^2 - (sum_i vb(p)_i)^2)
$
#newpara()
*打靶实验*有第二个粒子静止
$
  p_1^mu = (E_1, vb(p)_1), p_2^mu = (m_2, 0)
$
质心系能量为
$
  E_"cm" = sqrt(m_1^2 + m_2^2 + 2 m_2 E_1)
$
当满足
$
  2 m_2 E_1 >> m_1^2+m_2^2
$
所以
$
  E_"cm" approx sqrt(2 m_2 E_1)
$
质心系能量被称为资用能量，$E_"cm"$越大，产生新粒子的可能性越大。实验室中观测质心运动速度
$
  beta_c = p_1/(E_1 + m_2)
$
相应的质心运动因子
$
  gamma_c = 1/sqrt(1 - beta_c^2) = (E_1 + m_2)/E_"cm"
$
#newpara()

*对撞实验*若两束流动量等大反向，实验室系就是质心系。此时
$
  E_"cm" = sqrt((E_1 + E_2)^2) = E_1 + E_2 approx 2 E_1
$
最后一步还要求两束流能量近似相等。在相同束流能量下，对撞可以比固定靶获得更高的质心系能量。非对称对撞机中实验室系一般不是质心系。

对任意多粒子系统，质心系相对实验室系的速度为
$
  vb(beta)_c = (sum_i vb(p)_i)/(sum_i E_i)
$
质心系存在的条件是系统总四动量为类时。单个光子或一组严格同向传播的光子满足$P^2=0$，没有静止系；光的世界线上固有时为零，也不能定义“光子自己的时钟”。

=== 反应阈能

对于运动学上允许的反应$a+b -> 1+...+N$，在所有末态均有质量的情况下，阈值处末态粒子在质心系中都静止，因此
$
  sqrt(s_"thr") = sum_(j=1)^N m_j
$
在固定靶实验中，$b$静止，$s=m_a^2+m_b^2+2m_b E_a$。若反应有正的动能阈值，则入射粒子的总能量和动能阈值分别为
$
  E_(a,"thr") = (s_"thr"-m_a^2-m_b^2)/(2m_b), quad
  T_(a,"thr") = E_(a,"thr")-m_a
$
若算得$E_(a,"thr")<m_a$，运动学上不需要正的入射动能阈值。能量充足只是必要条件，还必须满足电荷、角动量等守恒律；含无质量末态时，阈值可对应其能量趋于零的极限。

#example(subname: [固定靶产生中性介子])[
  对$p+p -> p+p+pi^0$，有
  $
    T_(p,"thr") = ((2m_p+m_(pi^0))^2-4m_p^2)/(2m_p)
    = 2m_(pi^0)+m_(pi^0)^2/(2m_p) approx 280 "MeV"
  $
  该值大于$m_(pi^0) approx 135 "MeV"$，因为实验室系中还必须保留系统整体运动所需的能量。
]

=== $n$个粒子反应的不变量

考虑一个粒子的衰变或两个粒子碰撞所产生的反应，如果初态和末态共涉及$n$个粒子。考察由这$n$个粒子的四维动量$p_i^mu$, $i = 1, 2, dots, n$可以组成多少个 Lorentz 不变量？

- 将所有外线动量统一按流入取号后，动量守恒给出$sum_i p_i=0$，可消去一个四动量。
- 其余$n-1$个四动量的对称内积矩阵有$n(n-1)/2$个元素，固定全部$n$个外线质量后，形式上剩下$n(n-3)/2$个运动学不变量。
- 在四维时空中，超过四个四矢量必线性相关。$n >= 6$时还需加入Gram行列式约束，不能继续把上述形式计数当作独立变量数。

对一般的非退化构型，$n=3,4,5$时独立不变量数分别为$0,2,5$；$n >= 5$时可由自由度计数得到
$
  N_"inv" = 4n-n-4-6 = 3n-10
$
右侧依次扣除质壳条件、四动量守恒和整体Lorentz变换。例如六条外线只有八个独立不变量，而不是九个。这里$n$包括初态和末态；固定碰撞能量$s$后还要再少一个可变参数。特殊共线构型可能进一步退化。

对二体到二体的反应，用$i = 1,2$标记初态的两个粒子，$3,4$标记两个末态粒子，可以构成三个Lorentz 不变量：
$
  s & = (p_1 + p_2)^2 = (p_3 + p_4)^2 = m_1^2 + m_2^2 + 2 E_1 E_2 - 2 vb(p)_1 dot vb(p)_2 \
  t & = (p_1 - p_3)^2 = (p_2 - p_4)^2 = m_1^2 + m_3^2 - 2 E_1 E_3 + 2 vb(p)_1 dot vb(p)_3 \
  u & = (p_1 - p_4)^2 = (p_2 - p_3)^2 = m_1^2 + m_4^2 - 2 E_1 E_4 + 2 vb(p)_1 dot vb(p)_4 \
$
它们中只有两个是独立的，实际上它们满足关系
$
  s + t + u = m_1^2 + m_2^2 + m_3^2 + m_4^2
$
$s$为质心系总能量的平方
$
  sqrt(s) = E_"cm"
$
$t$和$u$称为四维动量转移的平方。这三个变量称为Mandelstam变量。

#note[
  例如$e^-+e^- -> e^-+e^-$的$t$道Feynman图
  $
    (p_1 - p_3)^2 = (p_2 - p_4)^2 = t = p_gamma^2
  $
  #figure(
    include "pic/1.1.typ",
    caption: [$e^- + e^- -> e^- + e^-$散射的$t$道Feynman图],
  )
  $t$是虚光子的四维动量平方。对质心系中的弹性散射，
  $
    t=-2 abs(vb(p))^2(1-cos theta) <= 0, quad Q^2 equiv -t >= 0
  $
  因而描述空间样动量转移的大小时常用$Q^2$；$Q^2$越大，交换光子的四动量离$p_gamma^2=0$的质量壳越远。
]

粒子反应很多物理量与参考系无关，例如反应截面，这些物理量是系统Lorentz不变量的函数。

== 碰撞和衰变 (Collisions and decays)

粒子物理中常研究两类过程：
- *碰撞*：两个入射粒子发生相互作用，产生给定末态
  $
    a+b -> c+d+...
  $
  用*散射截面*（cross section）$sigma$描述单位入射通量所对应的反应率。
- *衰变*：一个不稳定粒子转变为多个粒子
  $
    a -> b+c+...
  $
  用*衰变宽度*（decay width）$Gamma$描述单位固有时间的衰变率。

标准模型给出相互作用的动力学，从而可用Feynman规则计算跃迁振幅。将振幅与末态相空间及初态归一化因子结合，便得到可测的截面或宽度。

=== 散射过程的一般描述

初态$Phi_i$和末态$Phi_f$是无限远过去和未来的渐近自由粒子态。散射算符$hat(S)$把入射态映射为出射态的叠加，指定末态的概率振幅为
$
  S_(f i)=braket(Phi_f, hat(S), Phi_i)
$
在相互作用绘景中，时间演化为
$
  hat(U)_I(t,t_0)=cal(T) exp[-i integral_(t_0)^t dd(t') hat(H)_I(t')]
$
其中$cal(T)$表示时间排序；$hat(S)$由$t_0 -> -oo,t -> +oo$的极限定义。计算中引入有限时间区间$[-T/2,T/2]$与有限体积$V$作为归一化手段，最后取适当极限。

#note(subname: [Fock空间])[
  量子场论允许粒子数改变，故需要把不同粒子数扇区放在同一个Fock空间中
  $
    cal(F)=plus.o.big_(n=0)^oo cal(H)_n
  $
  它本身仍是Hilbert空间；$cal(H)_0$包含真空，$cal(H)_n$为$n$粒子态空间。对全同玻色子或费米子，还分别需要对称化或反对称化。
]

设一组完备的正交归一态满足
$
  braket(i, j)=delta_(i j), quad sum_j ketbra(j)=1
$
对归一化初态，概率守恒要求
$
  1 & = sum_j abs(S_(j i))^2 \
    & = sum_j braket(i, hat(S)^dagger, j) braket(j, hat(S), i) \
    & = braket(i, hat(S)^dagger hat(S), i)
$
因而$hat(S)^dagger hat(S)=1$，即$S$矩阵*幺正*。连续态求和时应包含相应的动量积分。

提取不发生散射的部分，写成
$
  hat(S)=1+i hat(T)
$
幺正性给出
$
  hat(T)-hat(T)^dagger=i hat(T)^dagger hat(T)
$
于是
$
  braket(a, hat(T), b)-braket(b, hat(T), a)^*
  =i sum_j braket(j, hat(T), a)^* braket(j, hat(T), b)
$
特别地，
$
  2 Im braket(a, hat(T), a)=sum_j abs(braket(j, hat(T), a))^2
$
这就是*光学定理*的算符形式：前向振幅的虚部与所有允许末态的跃迁概率之和相联系。换成连续动量态并处理通量后，可将它写成前向弹性振幅与总截面的关系。

Lorentz协变的理论满足
$
  hat(U)(Lambda)^dagger hat(S) hat(U)(Lambda)=hat(S)
$
因而对同时变换的初、末态$ket(a')=hat(U)(Lambda)ket(a)$，有
$
  braket(a', hat(S), b')=braket(a, hat(S), b)
$
这里需要理论本身的协变性，不能仅由概率模平方不变推出振幅相等。有自旋时，态的偏振标签还随Lorentz变换发生相应的变换。

=== 平面波归一化与末态相空间

平面波不是可归一到$1$的局域态。采用*相对论归一化*（relativistic normalization）
$
  braket(vb(p)', vb(p))=(2 pi)^3 2E_vb(p) delta^3(vb(p)'-vb(p)), quad
  E_vb(p)=sqrt(vb(p)^2+m^2)
$
同一粒子种类的一粒子空间中，完备性为
$
  integral dd(vb(p), 3)/((2 pi)^3 2E_vb(p)) ketbra(vb(p))=1
$
这里暂略自旋指标；有自旋时还需对完整的自旋态求和。

#note(subname: [$delta$函数])[
  $delta$分布由
  $
    integral dd(x) delta(x-x_0) f(x)=f(x_0)
  $
  定义，并满足
  $
      delta(-x) & =delta(x), quad delta(a x)=delta(x)/abs(a) \
    delta(f(x)) & =sum_i delta(x-x_i)/abs(f'(x_i)) \
       delta(x) & =1/(2 pi) integral dd(k) e^(i k x)
  $
  第二式要求$a != 0$，第三式中的$x_i$为$f$的单根。出现$delta$函数的平方时，需通过有限时间、体积或波包的极限处理，不能把它当作普通函数平方。
]

将平面波限制在体积$V=L^3$的箱内，取周期性边界条件，则
$
  vb(p)=(2 pi)/L (n_x,n_y,n_z), quad n_i in ZZ
$
每个动量态占据体积$(2 pi/L)^3$，故给定自旋态的末态数为
$
  dd(n)=V/(2 pi)^3 dd(vb(p), 3)
$
在允许的离散动量上，连续归一化与箱归一化之间有
$
  delta^3(vb(p)'-vb(p)) -> V/(2 pi)^3 delta_(vb(p)',vb(p)) \
  ket(vb(p))^"box"=1/sqrt(2E_vb(p) V) ket(vb(p))
$
于是箱内单粒子态的内积为Kronecker符号。多粒子态的每条外线都应带有各自的$1/sqrt(2E_k V)$，不能把不同粒子的能量视为同一个归一化常数。

由时空平移对称性，将跃迁矩阵元定义为
$
  braket(Phi_f, hat(S)-1, Phi_i)
  =i(2 pi)^4 delta^4(P_f-P_i) M_(f i)
$
其中$P_i,P_f$分别是初、末态总四动量，
$
  delta^4(P_f-P_i)=delta(E_f-E_i) delta^3(vb(P)_f-vb(P)_i)
$
$M_(f i)$是去除整体能动量守恒因子后的*不变振幅*，不应与完整的$S_(f i)$混同。

有限时空体积使形式上的$delta$函数平方产生
$
  (2 pi)^4 delta^4(0) -> V T, quad
  [delta^4(q)]^2 -> (V T)/(2 pi)^4 delta^4(q)
$
这些表达式用于取极限时的积分中。对发生跃迁的末态，箱归一化概率乘以末态数后得到
$
  dd(P(i -> f)) = V T (product_(a=1)^(n_i) 1/(2E_a V)) abs(M_(f i))^2 dd(Phi_(n_f))
$
这里定义*$N$体末态相空间*
$
  dd(Phi_N)=(2 pi)^4 delta^4(P_i-sum_(j=1)^N p_j)
  product_(j=1)^N dd(vb(p)_j, 3)/((2 pi)^3 2E_j)
$
因而反应的描述自然分成：振幅给出的动力学、相空间给出的运动学，以及初态归一化与通量。

#note(subname: [Lorentz不变的相空间测度])[
  正能量质壳上的测度可由四维积分得到。令$E_vb(p)=sqrt(vb(p)^2+m^2)$，则
  $
    delta(p^2-m^2) & =delta((p^0)^2-E_vb(p)^2) \
                   & = [delta(p^0-E_vb(p))+delta(p^0+E_vb(p))]/(2E_vb(p))
  $
  因而
  $
    integral dd(p^0) delta(p^2-m^2) theta(p^0)=1/(2E_vb(p))
  $
  在四维积分中积掉$p^0$，便得到$dd(vb(p), 3)/(2E_vb(p))$。四维测度、质壳条件和正能量条件在保持时间方向的Lorentz变换下不变，所以$dd(Phi_N)$不变。单独的$E$、$V$及实验室时间$T$并非各自不变，必须结合所定义的物理量讨论。
]

对固定总四动量，$N$个末态动量共有$3N$个分量，四动量守恒消去四个，故一般相空间维数为$3N-4$。例如三体相空间有五维，其中三维描述整体空间取向；若过程不依赖取向，剩下两个内部运动学变量。

=== 无质量末态的相空间

当所有末态质量为零，且对完整的有标签相空间积分时，令$s=P_i^2>0$，有
$
  Phi_2=1/(8 pi), quad Phi_3=s/(256 pi^3)
$
相空间可以按一个中间四动量$q$递推分解为
$
  dd(Phi_N(P;p_1,...,p_N))
  =dd(q^2)/(2 pi) dd(Phi_2(P;q,p_N)) dd(Phi_(N-1)(q;p_1,...,p_(N-1)))
$
其中$q=sum_(j=1)^(N-1) p_j$，积分区间由各子系统的质量阈值决定。这是运动学恒等式，不要求$q$对应真实的中间共振。

对无质量末态积分后得到
$
  Phi_(N+1)/Phi_N=s/(16 pi^2 N(N-1)), quad N >= 2
$
因此
$
  Phi_N=1/(8 pi (N-1)! (N-2)!) (s/(16 pi^2))^(N-2)
$
它的能量量纲为$[E]^(2N-4)$。定义$Phi'_N=Phi_N/s^(N-2)$，则$Phi'_3/Phi'_2=1/(32 pi^2) approx 1/315.8$。

较多粒子的相空间含有更多积分与归一化因子，但不能只比较$Phi'_N$就判定不同反应的大小：不同末态数的振幅具有不同量纲，还可能具有不同耦合常数、共振增强或对称性抑制。必须比较完整的宽度或截面。

=== 衰变宽度、寿命与分支比

设母粒子质量为$M$，实验室能量为$E$。单粒子初态$n_i=1$给出单位实验室时间的跃迁率
$
  dd(W_"lab")=dd(P(i -> f))/T=1/(2E) abs(M_(f i))^2 dd(Phi_N)
$
*衰变宽度*定义为母粒子静止系中的衰变率，因此
$
  dd(Gamma)=1/(2M) abs(M_(f i))^2 dd(Phi_N), quad
  dd(W_"lab")=M/E dd(Gamma)=dd(Gamma)/gamma
$
在自然单位制中，宽度既可用能量表示，也对应固有时间的倒数。恢复单位后，平均固有寿命为$tau=hbar/Gamma$；$Gamma$越大，寿命越短。

对于互斥且完备的衰变道$a$，定义分宽度和*分支比*（branching fraction）
$
  Gamma_"tot"=sum_a Gamma_a, quad cal(B)_a=Gamma_a/Gamma_"tot", quad sum_a cal(B)_a=1
$
在通常的指数衰变近似中，以$t_*$表示经历的固有时间，
$
  N(t_*)=N(0)e^(-t_* /tau)
$
母粒子在实验室以恒定速度运动时，$t_*=t/gamma$，平均飞行距离为
$
  ell=beta gamma c tau=abs(vb(p))/M c tau
$
沿径迹在距离$L_1$至$L_2$之间衰变的概率为
$
  P(L_1<L<L_2)=e^(-L_1/ell)-e^(-L_2/ell)
$
若还要求衰变进入指定道，需再乘该道分支比；实际观测数还取决于探测器接受度和效率。

=== 二体衰变

对$M -> m_1+m_2$，在母粒子静止系中动量等大反向。由能动量守恒，
$
  E_1^*=(M^2+m_1^2-m_2^2)/(2M), quad E_2^*=(M^2+m_2^2-m_1^2)/(2M)
$
定义*Källén函数*
$
  lambda(x, y, z)=x^2+y^2+z^2-2x y-2x z-2y z
$
则共同动量大小为
$
  p^*=sqrt(lambda(M^2, m_1^2, m_2^2))/(2M)
  =sqrt((M^2-(m_1+m_2)^2)(M^2-(m_1-m_2)^2))/(2M)
$
运动学允许的阈值为$M >= m_1+m_2$。二体相空间及微分宽度为
$
  dd(Phi_2)=p^* /(16 pi^2 M) dd(Omega), quad
  dv(Gamma, Omega)=p^* /(32 pi^2 M^2) abs(M_(f i))^2
$
若处理自旋后的振幅模平方与方向无关，对立体角积分得到
$
  Gamma=p^* /(8 pi M^2) abs(M_(f i))^2
$
全同末态还应计入后述对称因子。对于两个无质量末态，$p^*=M/2$，且$Phi_2=1/(8 pi)$，可与上一节交叉检验。

#note(subname: [单能衰变产物与实验室能谱])[
  母粒子静止系中$E_1^*$固定，但实验室中
  $
    E_1=gamma(E_1^*+beta p^* cos theta^*)
  $
  其中$theta^*$是产物相对母粒子实验室运动方向的夹角，故
  $
    E_(1,"min/max")=gamma(E_1^* minus.plus beta p^*)
  $
  对固定母粒子boost及各向同性的衰变，$cos theta^*$均匀分布，所以实验室能谱在两个端点之间为平坦分布。偏振、角分布及母粒子动量分布都会改变这个结论。
]

=== 散射截面

考虑薄靶过程$A+B -> 1+...+N$，靶粒子$B$在实验室静止。若入射束流数密度为$rho_A$、速度为$v_A$，靶数密度为$rho_B$、厚度为$l_B$、面积为$S$，在时间$T$内的反应数为
$
  N_"int"=sigma (rho_A v_A)(rho_B l_B S) T
$
括号内分别为入射通量和靶粒子数，因而截面具有面积量纲，可理解为反应的有效面积。这里忽略束流衰减、重复散射及靶的空间不均匀性。

在箱归一化中，每种初态粒子在$V$中各有一个，故$rho_A=rho_B=1/V$。两粒子初态的概率为
$
  dd(P)=T/(4E_A E_B V) abs(M_(f i))^2 dd(Phi_N)
$
除以相应入射通量，可将截面写成协变形式
$
  dd(sigma)=1/F abs(M_(f i))^2 dd(Phi_N), quad
  F=4sqrt((p_A dot p_B)^2-m_A^2 m_B^2)
$
在固定靶系中，$F=4m_B abs(vb(p)_A)$；在质心系中，$F=4p_"cm" sqrt(s)$。

#note(subname: [通量中的速度因子])[
  写成$F=4E_A E_B v_"M"$时，
  $
    v_"M"=sqrt((vb(v)_A-vb(v)_B)^2-(vb(v)_A times vb(v)_B)^2)
  $
  这是Møller通量速度。只有共线时它才等于$abs(vb(v)_A-vb(v)_B)$；它可以大于$1$，因为它并非在某一粒子静止系中测量到的物理相对速度。两者不能混淆。
]

以下约定对截面和宽度都适用：
- 对互不可区分的末态，若在全部有标签动量空间上积分，每一类$n_a$个全同粒子应乘以$1/n_a!$，总因子为$product_a 1/n_a!$。若已限制积分区域使每个物理末态只计一次，就不再重复乘因子。
- 非极化初态对允许的自旋态*求平均*，未测量的末态自旋*求和*，记作$overline(abs(M_(f i))^2)$。两个有质量入射粒子的自旋平均因子为$1/[(2s_A+1)(2s_B+1)]$；光子等无质量粒子应使用实际物理偏振数。
- 指定了初态偏振时，不再对该偏振平均。全同粒子振幅本身的对称化或反对称化，与相空间避免重复计数的因子是两件事。

下文将振幅记号统一简写为$abs(M_(f i))^2$，按过程需要包含上述自旋求和与平均；全同粒子的相空间因子另行计入。

#block(breakable: false)[
  === 二体散射

  #example(subname: [碰撞微分截面])[
    $
      A + B-> C + D
    $
    的微分截面为
    $
      dv(sigma, Omega) = 1/(64 pi^2 s) abs(vb(p)')/abs(vb(p)) abs(M_(f i))^2
    $
  ]
]

对于$A + B -> C + D$, 在质心系中有
$
  p_A = (E_A, vb(p)), p_B = (E_B, -vb(p)), p_C = (E_C, vb(p)'), p_D = (E_D, -vb(p)')
$
其中
$
  s = (E_A + E_B)^2 = (E_C + E_D)^2 = E_"cm"^2
$
且有
$
  m_A^2 = E_A^2 - vb(p)^2, m_B^2 = E_B^2 - vb(p)^2, m_C^2 = E_C^2 - vb(p)'^2, m_D^2 = E_D^2 - vb(p)'^2
$
从而
$
  E_A + E_B & = sqrt(s) \
  E_A - E_B & = (m_A^2 - m_B^2)/sqrt(s) \
$
有
$
  E_A = (s + m_A^2 - m_B^2)/(2 sqrt(s)), E_B = (s + m_B^2 - m_A^2)/(2 sqrt(s))
$
从而初动量
$
  vb(p)^2 & = E_A^2 - m_A^2 = (s + m_A^2 - m_B^2)^2/(4 s) - m_A^2 \
          & = ((s - (m_A + m_B)^2)(s - (m_A - m_B)^2))/(4 s)
$
从而末动量
$
  vb(p)'^2 = ((s - (m_C + m_D)^2)(s - (m_C - m_D)^2))/(4 s)
$
#newpara()
而微分散射截面是
$
  dd(sigma) = 1/(2E_A 2E_B abs(vb(p)_A/E_A - vb(p)_B/E_B)) abs(M_(f i))^2 dd(Phi_2)
$
其中
$
  dd(Phi_2) = (2pi)^4 delta^4(p_i - p_f) dd(vb(p)_C, 3)/((2pi)^3 2 E_C) dd(vb(p)_D, 3)/((2pi)^3 2 E_D)
$
就有
$
  dd(sigma) =& 1/(2E_A 2E_B abs(vb(p)) (1/E_A + 1/E_B)) abs(M_(f i))^2 \ &(2pi)^4 delta(sqrt(s) - E_C - E_D) delta^3(vb(p)_C + vb(p)_D) dd(vb(p)_C, 3)/((2pi)^3 2 E_C) dd(vb(p)_D, 3)/((2pi)^3 2 E_D)\
  =& 1/(4 abs(vb(p)) sqrt(s)) abs(M_(f i))^2 \ & (2pi)^4 delta(sqrt(s) - E_C - E_D) dd(vb(p)_C, 3)/((2pi)^3 2 E_C) 1/((2pi)^3 2 E_D)\
  =& 1/(4 abs(vb(p)) sqrt(s)) abs(M_(f i))^2 1/(2pi)^2 delta(sqrt(s) - E_C - E_D) dd(vb(p)_C, 3)/(4 E_C E_D)
$
其中
$
  dd(vb(p), 3) = vb(p)^2 dd(abs(vb(p))) dd(Omega)
$
则
$
  dd(sigma) = 1/(4 abs(vb(p)) sqrt(s)) abs(M_(f i))^2 1/(2pi)^2 delta(sqrt(s) - E_C - E_D) vb(p)_C^2 (dd(abs(vb(p)_C)) dd(Omega))/(4 E_C E_D)
$
注意到
$
  delta(f(p)) = delta(p - p_0)/abs(f'(p_0)), f(p) = sqrt(s) - sqrt(m_C^2 + p^2) - sqrt(m_D^2 + p^2)
$
从而
$
  f'(p) = - p/sqrt(m_C^2 + p^2) - p/sqrt(m_D^2 + p^2) = - p (1/E_C + 1/E_D) = - (p sqrt(s))/(E_C E_D)
$
故
$
  delta(sqrt(s) - E_C - E_D) = delta(abs(vb(p)') - abs(vb(p)_C)) (E_C E_D)/(abs(vb(p)') sqrt(s))
$
从而
$
  dd(sigma) &= 1/(4 abs(vb(p)) sqrt(s)) abs(M_(f i))^2 1/(2pi)^2 vb(p)'^2 dd(Omega)/(4 E_C E_D) (E_C E_D)/(abs(vb(p)') sqrt(s)) \
  &= 1/(64 pi^2 s) abs(M_(f i))^2 abs(vb(p)')/abs(vb(p)) dd(Omega)
$
得到微分截面
$
  dv(sigma, Omega) = 1/(64 pi^2 s) abs(vb(p)')/abs(vb(p)) abs(M_(f i))^2
$

其中初、末动量大小也可统一写为
$
  p_"in"=sqrt(lambda(s, m_A^2, m_B^2))/(2sqrt(s)), quad
  p_"out"=sqrt(lambda(s, m_C^2, m_D^2))/(2sqrt(s))
$
当过程绕束轴具有方位角对称性时，由$dd(t)=2p_"in" p_"out" dd(cos theta)$得到
$
  dv(sigma, t)=abs(M_(f i))^2/(16 pi lambda(s, m_A^2, m_B^2))
$
这也是实验中常用的动量转移分布。若入射粒子均可视为无质量，则分母化为$16 pi s^2$。

#newpara()
=== 三体衰变与Dalitz图

#example(subname: [三体衰变宽度])[
  $
    M -> m_1 + m_2 + m_3
  $
  假设衰变振幅与衰变平面的取向无关，衰变宽度为
  $
    dd(Gamma) = 1/(2pi)^3 1/(8 M) abs(M_(f i))^2 dd(E_1) dd(E_2)
  $
]
三体衰变，在质心系
$
  p = (M, 0), p_1 = (E_1, vb(p)_1), p_2 = (E_2, vb(p)_2), p_3 = (E_3, vb(p)_3)
$
则衰变宽度是
$
  dd(Gamma) = 1/(2 M) abs(M_(f i))^2 dd(Phi_3)
$
由$vb(p)_1+vb(p)_2+vb(p)_3=0$，三个末态动量必在同一平面。对无自旋母粒子，或对母粒子自旋平均且不分析末态自旋时，振幅模平方与整个衰变平面的空间取向无关。此时可以积掉描述整体取向的三个角。

先写出相空间
$
  dd(Phi_3) &= (2pi)^4 delta^4(p-p_1-p_2-p_3) dd(vb(p)_1, 3)/((2pi)^3 2 E_1) dd(vb(p)_2, 3)/((2pi)^3 2 E_2) dd(vb(p)_3, 3)/((2pi)^3 2 E_3)\
  &= 1/((2pi)^5) delta(M - E_1 - E_2 - E_3) delta^3(vb(p)_1 + vb(p)_2 + vb(p)_3) (dd(vb(p)_1, 3) dd(vb(p)_2, 3) dd(vb(p)_3, 3))/(8 E_1 E_2 E_3)\
  & = 1/(8(2pi)^5) delta(M - E_1 - E_2 - sqrt(m_3^2 + (vb(p)_1 + vb(p)_2)^2)) (vb(p)_1^2 vb(p)_2^2 dd(abs(vb(p)_1), Omega_1) dd(abs(vb(p)_2), Omega_2))/(E_1 E_2 E_3)
$
其中不妨，考虑$vb(p)_2$的立体角以$vb(p)_1$方向为$z$方向定义
$
  dd(Omega_2) = dd(Omega_12) = dd(cos theta_12) dd(phi_12)
$
积掉$Omega_1$及绕$vb(p)_1$的方位角$phi_12$，给出$4 pi times 2 pi$，得到
$
  dd(Phi_3) & = 1/(4(2pi)^3) delta(M-E_1-E_2-E_3) \
            & quad times (vb(p)_1^2 vb(p)_2^2 dd(abs(vb(p)_1)) dd(abs(vb(p)_2), cos theta_12))/(E_1 E_2 E_3)
$
令$c=cos theta_12$，$p_j=abs(vb(p)_j)$，并定义
$
  f(c)=M-E_1-E_2-sqrt(m_3^2+p_1^2+p_2^2+2p_1 p_2 c)
$
其导数以及能量守恒给出的根分别为
$
  f'(c)=-p_1 p_2/E_3, quad
  c_0=((M-E_1-E_2)^2-m_3^2-p_1^2-p_2^2)/(2p_1 p_2)
$
在$E_3=M-E_1-E_2>0$及$p_1 p_2>0$的内部区域，有
$
  integral_(-1)^1 dd(c) delta(f(c))=E_3/(p_1 p_2) theta(1-abs(c_0))
$
因此物理区域还要求$abs(c_0)<=1$。以下公式均限制在这个区域内；区外相空间为零。积掉夹角后
$
  dd(Phi_3) = 1/(4(2pi)^3) (abs(vb(p)_1) abs(vb(p)_2) dd(abs(vb(p)_1)) dd(abs(vb(p)_2)))/(E_1 E_2)
$
而
$
  (abs(vb(p)) dd(abs(vb(p))))/E = dd(E)
$
就有
$
  dd(Phi_3) = 1/(4(2pi)^3) dd(E_1) dd(E_2)
$
从而
$
  dd(Gamma) = 1/(8(2pi)^3 M) abs(M_(f i))^2 dd(E_1) dd(E_2)
$
或者
$
  dd(Gamma) = 1/(32(2pi)^3 M^3) abs(M_(f i))^2 dd(m_12^2) dd(m_23^2)
$
其中
$
                    m_12^2 & = (p_1 + p_2)^2 = M^2 + m_3^2 - 2 M E_3 \
                    m_23^2 & = (p_2 + p_3)^2 = M^2 + m_1^2 - 2 M E_1 \
                    m_13^2 & = (p_1 + p_3)^2 = M^2 + m_2^2 - 2 M E_2 \
  m_12^2 + m_23^2 + m_13^2 & = M^2 + m_1^2 + m_2^2 + m_3^2
$

==== Dalitz图的物理边界

以$s_12=m_12^2$与$s_23=m_23^2$为坐标绘制衰变事例，得到*Dalitz图*。由上式，第三个两体不变质量平方随前两个确定。首先
$
  (m_1+m_2)^2 <= s_12 <= (M-m_3)^2
$
固定$s_12$，转到粒子$1,2$子系统的静止系。在该系中
$
  E_2^*=(s_12-m_1^2+m_2^2)/(2sqrt(s_12)), quad
  E_3^*=(M^2-s_12-m_3^2)/(2sqrt(s_12)) \
  q_2^*=sqrt((E_2^*)^2-m_2^2), quad q_3^*=sqrt((E_3^*)^2-m_3^2)
$
由两个动量的夹角余弦在$[-1,1]$之间，得到
$
  s_(23,"min")=m_2^2+m_3^2+2(E_2^* E_3^*-q_2^* q_3^*) \
  s_(23,"max")=m_2^2+m_3^2+2(E_2^* E_3^*+q_2^* q_3^*)
$
边界对应两个动量平行或反平行，故允许区域通常不是矩形。若三个末态都无质量，边界化为$s_12>=0,s_23>=0,s_12+s_23<=M^2$的三角形。

#figure(
  image("pic/ch1/dalitz-region.svg", width: 75%),
  caption: [三体衰变的Dalitz允许区域。示例取$m_1=m_2=0.14M$、$m_3=0.30M$；阴影表示运动学允许范围，不表示事件密度],
)

#note(subname: [从Dalitz图读出动力学])[
  在允许区域内，相空间测度对$dd(s_12) dd(s_23)$为常数。因此若振幅模平方也为常数，且已校正接受度和效率，事件在Dalitz图中均匀分布。

  若$1,2$通过中间共振$R$产生，振幅可能含有近似因子
  $
    1/(s_12-m_R^2+i m_R Gamma_R)
  $
  使$s_12 approx m_R^2$附近出现条带。条带内的角分布还反映中间态的自旋，不同衰变路径会发生干涉。因此事件密度既受运动学边界限制，也携带动力学信息。
]

这里把$(2 pi)^4$包含在$dd(Phi_N)$中。查阅其他教材或 #link("https://pdg.lbl.gov/2024/reviews/rpp2024-rev-kinematics.pdf")[PDG的Kinematics综述]时，应先核对相空间定义及振幅归一化，再比较公式中的系数。

== 辐射粒子与物质的相互作用 (The passage of radiation through matter)

人类不能直接看到高能粒子，必须借助粒子探测器来观测。高能粒子穿过介质时会与介质内部的原子、分子发生各种相互作用，在介质中留下“痕迹”。人们利用粒子探测器，通过探测这些“痕迹”推断粒子的运动性质。

对辐射粒子与物质相互作用的研究是设计和理解探测器的基础。

=== 辐射粒子分类

这里的“稳定”是相对于探测器尺度而言的：粒子在穿过探测器之前通常尚未衰变。除了严格稳定的粒子，也包括固有衰变长度$c tau$达到米量级的长寿命粒子；在实验室系中，平均飞行距离为$beta gamma c tau$。

#figure(
  three-line-table[
    | 电荷 | 典型的长寿命粒子 |
    | --- | --- |
    | 带电 | $e^(plus.minus), p, overline(p), mu^(plus.minus), pi^(plus.minus), K^(plus.minus)$及氘核、氚核、$alpha$粒子和离子 |
    | 中性 | $n, overline(n), gamma, K_L, nu$ |
  ],
  caption: [按电荷分类的典型辐射粒子],
)

辐射粒子的探测内容包括：是否存在、电荷、能量和动量，以及粒子类型。短寿命粒子通常通过衰变产物的径迹、次级顶点及不变质量重建来辨认。

*带电粒子*穿过介质时，主要的电磁能量损失机制包括
- 电离和激发（ionization and excitation）；
- 轫致辐射（bremsstrahlung）；
- 切伦科夫辐射（Cherenkov radiation）：粒子速度满足$v > c/n$，其中$n$为介质的折射率；
- 渡越辐射（transition radiation，也称穿越辐射）：带电粒子穿过介电性质不同的两种介质的边界时产生。
这些机制不一定都主导总能损，但各自可以提供不同的探测信号。

=== 重带电粒子的电离能损

对于质量$m >> m_e$的带电粒子，在辐射损失尚不显著的能区，电离和激发是主要能量损失机制。定义*质量厚度*（mass thickness）
$
  x = rho l,
$
其中$rho$为介质质量密度，$l$为实际路程。$x$通常以$"g/cm"^2$为单位，因此$-dv(E, x)$是质量阻止本领，与单位长度的能损满足
$
  -dv(E, l) = rho (-dv(E, x)).
$

平均电离能损由*Bethe–Bloch公式*给出
$
  -expval(dv(E, x)) = K z^2 Z/A 1/beta^2
  [1/2 ln((2 m_e c^2 beta^2 gamma^2 W_max)/I^2) - beta^2 - delta(beta gamma)/2],
$
$
  K = 4 pi N_A r_e^2 m_e c^2 approx 0.307 "MeV cm"^2 "/mol".
$
其中$z e$为入射粒子的电荷，$Z$和$A$分别为介质原子的原子序数和摩尔质量，$I$为平均激发能，$delta$为密度效应修正，$r_e$为经典电子半径，$N_A$为Avogadro常数。一次碰撞中可传给自由静止电子的最大能量为
$
  W_max = (2 m_e c^2 beta^2 gamma^2)/(1 + 2 gamma m_e/m + (m_e/m)^2).
$
在给定介质和电荷数下，忽略$W_max$中的小质量修正时，平均能损主要取决于粒子速度。因此，能损测量与动量测量结合，可以用来区分质量不同的粒子。这里的公式不直接适用于电子和正电子，也不包括极低速时的壳层修正等效应。#footnote[公式和适用范围参见 #link("https://pdg.lbl.gov/2024/reviews/rpp2024-rev-passage-particles-matter.pdf")[PDG, Passage of Particles Through Matter]。]

#note(subname: [最小电离粒子])[
  在$beta gamma$较小时，$-dv(E, x)$大致随$1/beta^2$下降；在较大的$beta gamma$处，相对论效应使其缓慢上升，密度效应又抑制这一上升。因此在$beta gamma approx 3$附近出现最小值，相应粒子称为*最小电离粒子*（minimum ionizing particle, MIP）。

  最小电离能损的典型量级为$1$至$2 "MeV cm"^2 "/g"$。铅的密度约$11 "g/cm"^3$，穿过$1 "cm"$的能损为十几$"MeV"$；常温常压空气密度约低四个数量级，同样路程的能损为几$"keV"$。这是量级估算，精确结果取决于材料和粒子速度。
]

=== 能损涨落与粒子鉴别

Bethe–Bloch公式给出的是平均能损。粒子每次穿过一薄介质层时，实际能损$Delta E$是随机变量。少数碰撞会把较大能量传给电子，产生$delta$射线，因此能损分布具有向大能损方向延伸的长尾，平均值与最可几值不同。

薄层能损涨落常用*Landau分布*描述。一个便于计算的近似是*Moyal分布*
$
  f(lambda) = 1/sqrt(2 pi) exp[-1/2 (lambda + e^(-lambda))],
  quad lambda = (Delta E - Delta E_p)/xi,
$
$
  xi = K/2 Z/A z^2/beta^2 Delta x,
  quad Delta x = rho Delta l.
$
其中$Delta E_p$是最可几能损，$xi$是能损涨落的特征尺度。$f$是无量纲变量$lambda$的密度，能损本身的概率密度为
$
  f_(Delta E)(Delta E) = 1/xi f((Delta E - Delta E_p)/xi).
$
上述初等函数表达式是Moyal近似，并非Landau分布的精确表达式。#footnote[参见 #link("https://docs.scipy.org/doc/scipy-1.13.0/reference/generated/scipy.stats.moyal.html")[Moyal分布的定义及其与Landau分布的关系]。]

实验上沿粒子路径进行多次采样，常舍去若干较大的能损值后取*截断平均*，减小长尾对粒子鉴别的影响。结合
$
  p = beta gamma m c,
$
同一动量处不同质量粒子的$beta gamma$不同，从而在$dv(E, x)$与$p$的二维分布上形成不同的带。

=== 电子的能损、辐射长度和临界能量

电子质量很小，在相同动量下，$beta gamma$远大于缪子和强子。电子的碰撞能损还受到入射粒子与靶电子质量相同、全同粒子交换等因素的影响，不能直接套用重粒子的Bethe–Bloch公式。

电子和正电子在原子核电场中偏转时，可以发生*轫致辐射*
$
  e^- + N -> e^- + N + gamma, quad
  e^+ + N -> e^+ + N + gamma.
$
介质原子序数越大，辐射损失通常越显著；对于电荷相同的相对论粒子，轫致辐射具有近似$1/m^2$的质量抑制。

#note(subname: [电子与缪子的轫致辐射])[
  在相同材料、相同能量且二者均可采用相对论近似的条件下，忽略对数修正，电子与缪子的轫致辐射能损之比约为
  $
    (m_mu/m_e)^2 = (105.7/0.511)^2 approx 4.28 times 10^4.
  $
  因而*电子*的轫致辐射远强于缪子；缪子更容易穿透较厚的物质。但在足够高的能量下，缪子的辐射损失也不能忽略。
]
#newpara()
*辐射长度*$X_0$是高能电子通过轫致辐射使平均能量降为原来的$1/e$所经过的质量厚度
$
  -dv(E, x) approx E/X_0
  quad ==> quad E(x) = E_0 e^(-x/X_0).
$
也常用几何长度$ell_0 = X_0/rho$表示辐射长度，此时$E(l) = E_0 e^(-l/ell_0)$。两种定义必须与路程变量的单位一致。典型几何辐射长度：空气约$300 "m"$，水约$36 "cm"$，铁约$1.8 "cm"$，铅约$0.56 "cm"$。材料密度及原子序数均影响几何辐射长度。

*临界能量*$E_c$定义为电子的碰撞能损与轫致辐射能损相当时的能量
$
  (-dv(E, x))_"ion" = (-dv(E, x))_"brem", quad E = E_c.
$
可作粗略估算$E_c approx (600 "MeV")/Z$，例如铅中为$7 "MeV"$量级。$E >> E_c$时辐射损失占主导，$E << E_c$时碰撞能损占主导。更精确的$E_c$依材料和采用的定义而定。

=== 光子的相互作用与电磁簇射

光子不带电，主要通过产生或加速带电次级粒子留下信号。主要过程为
- *光电效应*：光子被原子吸收并释放电子，通常在较低能量区重要；
- *Compton散射*：$gamma + e^- -> gamma + e^-$，把部分能量传给电子，在中等能量区重要；
- *电子对产生*：$gamma + N -> e^+ + e^- + N$，光子消失。重原子核反冲可忽略时，阈能近似为$2 m_e c^2 approx 1.022 "MeV"$，在高能区占主导。
三种机制的交界能量随材料的$Z$变化，不能用统一的$"keV"$或$"MeV"$分界代替截面的比较。

窄束光子通过厚度$l$的介质后，未发生相互作用的光子数为
$
  N(l) = N_0 e^(-mu_gamma l) = N_0 e^(-l/ell_gamma),
  quad ell_gamma = 1/mu_gamma.
$
$mu_gamma$为线性衰减系数，$ell_gamma$为衰减长度。高能区以电子对产生为主时
$
  ell_gamma approx 9/7 ell_0.
$
此关系不是任意光子能量下的总衰减长度公式。

高能电子辐射出的光子又可产生电子对，新产生的电子和正电子继续辐射，形成*电磁簇射*（electromagnetic shower）。当次级粒子能量降到$E_c$附近，增殖减弱，能量逐渐通过电离和激发沉积。这是电磁量能器的工作基础。

=== 强子的相互作用

*强子*是参与强相互作用的复合粒子，包括重子和介子，如$p,n,pi,K$。带电强子除了电离等电磁能损，还可与原子核发生非弹性强相互作用，产生次级强子，形成*强子簇射*。中性强子也可通过这种机制被探测。

在高能区，强子与核子的截面通常为几十$"mb"$。例如在$100 "GeV"$量级，$pi N$总截面约为$25 "mb"$，核子与核子的总截面约为$40 "mb"$；这些仅用于说明量级。

若靶核数密度为$n_A$，非弹性截面为$sigma_"inel"$，则*核相互作用长度*为
$
  ell_I = 1/(n_A sigma_"inel"), quad N(l) = N_0 e^(-l/ell_I).
$
选用总截面定义的碰撞长度与选用非弹性截面定义的相互作用长度不同。描述强子簇射时主要使用后者；常用符号还有$lambda_I$或$lambda_0$。典型值为水约$0.85 "m"$，铁、铅约$0.17 "m"$。在高$Z$材料中$ell_I$远大于$ell_0$，所以强子量能器通常比电磁量能器厚得多。

#block(breakable: false)[
  == 高能粒子来源 (Sources of high-energy particles)

  === 从放射性到宇宙线

  “高能”是相对的、随实验技术发展而变化的概念。
]
- 19世纪末，阴极射线管提供$"keV"$量级能量，促成X射线和电子的发现；
- 20世纪初，放射性衰变提供$"MeV"$量级粒子，是研究原子核的重要手段；
- 宇宙线提供$"GeV"$乃至$"EeV"$以上的粒子，其中$1 "EeV" = 10^9 "GeV"$，正电子、缪子、$pi$介子及奇异粒子的发现与宇宙线研究密切相关；
- 20世纪中叶以来，加速器成为可控高能束流的主要来源。以LHC设计参数为例，单束质子能量为$7 "TeV"$。

提高能量有两个直接目的：由$lambda = h/p$可知，更高动量对应更短的探测波长；由质心能量与产生阈值的关系可知，更高能量允许产生质量更大的粒子。

1912年，V. Hess通过气球实验发现高空电离辐射增强，确立了宇宙线的存在；他因此获得1936年Nobel物理学奖。初级宇宙线以质子和原子核为主，成分随能量变化；在一种常用的近GeV量级概述中，质子约占$85%$、氦核约$12%$、更重原子核约$1%$、电子约$2%$。近GeV区的积分通量可达每平方米每秒数千个粒子的量级，而超高能宇宙线极其稀少。

初级宇宙线与大气原子核碰撞，产生以$pi$介子等为主的强子簇射。
- $pi^0 -> gamma gamma$迅速产生电磁簇射；
- $pi^+ -> mu^+ + nu_mu$及$pi^- -> mu^- + overline(nu)_mu$产生缪子和中微子；
- 缪子继续衰变，产生电子或正电子及中微子。
缪子和中微子有较强的穿透能力，可以到达地面；大气中微子振荡是中微子具有非零质量的重要证据。

=== 同步加速器与次级束流

*同步加速器*（synchrotron）可以加速质子、电子和离子。粒子分成束团，在高真空的环形束流管内运行。偶极磁铁使束流沿环形轨道运动，聚焦磁铁约束束流横向尺寸，射频腔向粒子提供能量；磁场与加速过程同步变化，使轨道半径近似不变。

磁场本身不做功。对电荷$q = z e$、垂直于磁场运动的粒子，实用单位下有
$
  p["GeV/c"] = 0.2998 abs(z) B["T"] R["m"].
$
因此，环形加速器可达到的动量受磁场强度和弯转半径约束。

典型的质子同步加速器沿革包括：1950年代BNL的Cosmotron（约$3 "GeV"$）及Berkeley的Bevatron（约$6$至$7 "GeV"$）；随后CERN PS和BNL AGS进入几十$"GeV"$，CERN SPS和Fermilab Main Ring进入数百$"GeV"$量级。

加速器不但提供原初束流，还可通过打靶产生并筛选$pi$、$K$、中子、反质子、缪子等*次级束流*。中微子束通常来自次级介子的衰变，例如$pi^+ -> mu^+ nu_mu$。

=== 储存环与对撞机

在高能固定靶实验中，入射总能量为$E_b$、靶质量为$m_t$时
$
  sqrt(s) approx sqrt(2 m_t E_b).
$
若用两束等能、反向且总动量为零的束流对撞，单束能量为$E^*$，则$sqrt(s) = 2 E^*$。达到与固定靶实验相同的质心能量，只需
$
  E^* approx sqrt(m_t E_b/2).
$
因此将质心能量提高一个数量级，固定靶束流能量约需提高两个数量级，而对称对撞束流只需提高一个数量级。

储存环把束流长时间储存起来，使两个方向的束团反复交叉。CERN ISR于1971年成为首个质子对撞机，最高质心能量约$62 "GeV"$。粒子与反粒子电荷相反、运行方向相反时，可以在同一磁场中沿共同轨道反向运行；质子与质子对撞则需要两条束流轨道。

一些重要的对撞机实例为
- CERN的SPS质子反质子对撞机于1981年产生碰撞，早期$sqrt(s) = 540 "GeV"$，UA1和UA2在1983年发现$W$和$Z$玻色子；
- Fermilab Tevatron采用$p overline(p)$对撞，最高质心能量接近$2 "TeV"$；
- CERN LEP采用$e^+ e^-$对撞，运行至2000年，最高质心能量约$209 "GeV"$；
- CERN LHC采用$p p$对撞，原始设计质心能量为$14 "TeV"$。
这些是历史或设计参数，不等同于各时期的实际运行参数。CEPC、FCC-ee和ILC代表环形或直线型高能正负电子对撞机的研究方案。#footnote[历史参数参见 #link("https://home.cern/science/experiments/ua1/")[CERN UA1]与 #link("https://home.web.cern.ch/science/accelerators/large-electron-positron-collider/")[CERN LEP]。]

=== 亮度与事例数 (Luminosity)

除质心能量外，*亮度*$cal(L)$是衡量对撞机性能的另一个重要参数。截面为$sigma$的过程，其产生事例率为
$
  dv(N, t) = cal(L) sigma.
$
对于每次交叉含有$N_1$、$N_2$个粒子的两个束团，若交叉频率为$f$、有效横向重叠面积为$Sigma$，则
$
  cal(L) approx f (N_1 N_2)/Sigma.
$
这里$f$已包含参与碰撞的束团数。若两束均为相同尺寸的横向高斯分布，正面对撞并忽略交叉角等几何修正，则
$
  cal(L) = (n_b f_"rev" N_1 N_2)/(4 pi sigma_x sigma_y),
$
其中$n_b$为碰撞束团对数，$f_"rev"$为回旋频率，$sigma_x,sigma_y$为单束横向分布的标准差。

提高亮度可以增加束团粒子数、增加碰撞频率，或压缩碰撞点处的束斑面积。随机冷却（stochastic cooling）通过测量束流偏差并反馈校正来减小束流的随机运动，在反质子束制备中尤其重要；实际亮度还受束流相互作用及机器保护等约束。

*积分亮度*为
$
  cal(L)_"int" = integral cal(L)(t) dd(t),
  quad N_"prod" = sigma cal(L)_"int".
$
瞬时亮度常用$"cm"^(-2) "s"^(-1)$，积分亮度常用$"pb"^(-1)$或$"fb"^(-1)$。考虑接受度$A_"acc"$及重建、选择效率$epsilon$后，预期探测到的信号事例数为
$
  N_"sig" = sigma cal(L)_"int" A_"acc" epsilon.
$
对指定衰变道还应乘相应分支比。

#example(subname: [由亮度估算事例数])[
  若$cal(L) = 10^34 "cm"^(-2) "s"^(-1)$，某过程截面为$1 "pb" = 10^(-36) "cm"^2$，则其产生速率为
  $
    dv(N, t) = 10^(-2) "s"^(-1)
  $
  若累计积分亮度为$100 "fb"^(-1)$，则产生约$10^5$个事例，再乘接受度和效率得到可用于分析的事例数。这也说明为什么稀有过程需要高亮度。
]

== 粒子探测器 (Particle detectors)

对于稳定粒子$(c tau > O(1)"m")$
$
  pi^plus.minus, K^plus.minus, p, overline(p),d ,"ions", e^plus.minus, mu^plus.minus, gamma, nu, n, ...
$<->
粒子探测器把粒子与物质的相互作用转化为可读出的信号，进而测量粒子的*动量、能量、电荷、产生位置及类型*。不同物理量通常由不同子探测器测得，再由事例重建把这些信息匹配到同一个粒子。

#figure(
  three-line-table[
    | 探测器类型 | 主要测量量 | 典型装置 |
    | --- | --- | --- |
    | 径迹探测器 | 空间位置、曲率、顶点、电离能损 | 云室、气泡室、核乳胶、正比室、漂移室、TPC、硅条与硅像素 |
    | 时间与速度探测器 | 飞行时间、速度 | 闪烁体飞行时间探测器、Cherenkov探测器 |
    | 量能器 | 沉积能量、簇射形状 | 电磁量能器、强子量能器 |
    | 缪子探测器 | 穿透后的径迹、动量 | 吸收体外的气体径迹探测器等 |
  ],
  caption: [粒子探测器的基本分工],
)

大型对撞机实验通常围绕相互作用点设置多层子探测器。以ATLAS等通用探测器为例，由内向外依次安排顶点和径迹测量、电磁量能、强子量能及缪子探测。飞行时间或专门的粒子鉴别系统是否设置、位于何处，取决于具体实验。

#figure(
  image("pic/ch1/detector-layout.png", width: 95%),
  caption: [典型粒子在各层探测器中的响应，从里到外是：径迹探测器、TOF（飞行时间探测器）、电磁量能器、强子量能器、缪子探测器],
)

不同粒子的典型信号组合如下。
- *光子*：不直接产生带电径迹，在电磁量能器中形成簇射；若提前转换为$e^+ e^-$，则可留下转换顶点和成对径迹。
- *电子、正电子*：内层有带电径迹，随后在电磁量能器中形成电磁簇射；高能时$E approx p c$，因此匹配后的$E/(p c)$接近$1$。
- *缪子*：在内层留迹，在量能器中通常只沉积较少能量，穿透到外层缪子系统后继续留迹。
- *带电强子*：在径迹探测器中留迹，通常在量能器内产生强子簇射。
- *中性强子*：内层通常无带电径迹，通过核相互作用产生次级粒子并沉积能量。
- *中微子*：绝大多数穿过装置而不发生可观测相互作用，通常由可见末态的动量不平衡间接推断。

=== 径迹与电离信号

*径迹*（track）是粒子在空间中留下的一系列测量点。测量*电离发生的位置*，可以*重建*运动方向、曲率和产生顶点；测量电离电荷量，则可估计$expval(dv(E, x))$并辅助粒子鉴别。

带电粒子首先产生初级电离，能量较高的电离电子还会引起次级电离。若沉积能量为$Delta E$，平均产生一个电子与离子对所需的能量为$W_i$，则总电荷对数近似为
$
  n_"total" = (Delta E)/W_i, quad
  expval(n_"total") approx expval(-dv(E, x)) (Delta x)/W_i
$
$W_i$包含激发等不能最终转化为自由电荷的能量损失，因此通常大于一次电离的阈能。常用气体中$W_i$为几十$"eV"$，总电离对数可为初级电离对数的$3$至$4$倍，具体数值取决于气体和入射粒子。

若一次采样仅产生约$100$个电子，而前端电子学的等效噪声电荷为约$1000 e$，直接读出就很困难。因此探测器不仅要*定位电离*，还常需在介质内部*放大*电荷，或提高单位路程的初始信号量。

==== 早期径迹探测器

*云室*（cloud chamber）利用过饱和蒸气：在云室中充以纯净水蒸气，快速绝热膨胀使蒸气过饱和，*带电粒子*产生的离子成为凝结中心，沿径迹形成可拍摄的液滴。Wilson云室使微观粒子运动得以直接显现。

Anderson用云室观察宇宙线，在已知方向的磁场中发现带正电、质量很小的粒子径迹。穿过铅板后的粒子损失能量，曲率半径变小，因此能够判定运动方向，再结合弯曲方向确定电荷符号。

#figure(
  image("pic/ch1/positron-cloud-chamber.png", width: 70%),
  caption: [*正电子*的云室径迹：铅板厚约$6 "mm"$，上下两段动量约为$23$和$63 "MeV/c"$，磁场约$1.5 "T"$, Carl D. Anderson, Phys. Rev. 43 (1933) 491],
)

云室缺点恢复初始状态慢，气体稀薄，反应率低，位置分辨率差，后面由气泡室克服了这些问题。

*气泡室*（bubble chamber）利用过热液体。快速降压后，粒子径迹附近的局部能量沉积形成气泡，再用照相机记录。

与气体云室相比，液体密度高，粒子反应率较大，径迹也更清晰；但膨胀、压缩和拍照需要循环时间，不适合连续处理极高事例率。

Glaser发明了气泡室，Alvarez等推动了大型液氢气泡室在粒子物理中的应用，CERN的BEBC是大型气泡室的代表。

*核乳胶*（nuclear emulsion）通过电离在乳胶中留下潜影，显影后沿粒子径迹形成微小银粒。相较普通照相乳胶，它更适合记录粒子电离，空间分辨可达微米甚至更小的尺度。1947年Powell等利用核乳胶在宇宙线中发现了$pi$介子。核乳胶适合研究很短的衰变径迹和顶点，但显影、扫描复杂，且本身缺少逐事例时间信息。

这些装置记录的是*带电粒子*。中性粒子可通过其反应或衰变产生的带电粒子间接显现，例如$gamma -> e^+ e^-$转换顶点，或中性粒子衰变产生的V形双径迹。

=== 磁偏转与动量测量

在均匀磁场中，Lorentz力改变粒子的运动方向而不改变其能量。设磁场为$vb(B)$，动量垂直于磁场的分量为$p_(perp B)$，曲率半径为$R$，则
$
  p_(perp B) = abs(q) B R
$
在实用单位下
$
  p_(perp B)["GeV/c"] = 0.2998 abs(z) B["T"] R["m"]
$
只有当磁场沿束流轴时，这里的$p_(perp B)$才正好等于通常定义的束流横动量$p_T$。平行于磁场的动量不变，因此一般径迹为螺旋线，结合螺距可恢复总动量。

对磁场内弦长为$L$的小角度圆弧，偏转角$theta$和*弓高*（sagitta）$h$满足
$
  L = 2 R sin(theta/2), quad
  h = R (1 - cos(theta/2)) approx L^2/(8 R)
$
因此
$
  theta approx L/R, quad
  p_(perp B)["GeV/c"] approx (0.2998 abs(z) B["T"] L^2["m"^2])/(8 h["m"])
$
在磁场和几何尺寸的误差可忽略时，测量误差导致
$
  sigma_p/p approx sigma_h/h
$
固定磁场和探测长度下，高动量粒子的曲率更小，因此相对动量分辨率通常随动量增大而变差。增大磁场、延长测量臂或改善位置分辨率，都能改善高动量测量。

#note(subname: [多重散射与材料预算])[
  粒子通过探测材料时还会发生多次Coulomb散射。这种随机偏折不能当成磁场引起的曲率，否则会恶化动量和顶点分辨。低动量处多重散射常较重要，高动量处通常更受位置测量精度限制。因此内层径迹探测器应尽量减少不必要的材料。
]

对于粒子近似垂直穿过偶极磁场、偏转角较小的磁谱仪，也可以直接使用磁场积分
$
  theta["rad"] approx
  (0.2998 abs(z) integral B dd(l)["T m"])/(p["GeV/c"])
$
磁铁前后各布置若干径迹测量层，就可由进入、离开磁场的方向差确定动量，并由偏转方向确定电荷符号。

#example(subname: [偶极磁谱仪的偏转量])[
  单位电荷粒子的动量为$30 "GeV/c"$，磁场积分为$1 "T m"$，则
  $
    theta approx 0.3/30 = 0.010 "rad" = 10 "mrad".
  $
  在磁铁之后约$5 "m"$处，相对未偏转方向的位移约为
  $
    Delta x approx 5 "m" times 0.010 = 50 "mm".
  $
  这一偏移可由具有$100 "μm"$量级空间分辨的径迹探测器测出。
]

==== 电离探测器

*电离探测器*（ionization detector）在气体或液体两侧设置电极。带电粒子产生电子与离子对，电荷在电场作用下漂移，在电极上感应出信号并被收集，信号可直接由电子学记录。

气体探测器随工作电压升高，会经历不同工作区。
- 在漂移区：当场强较小时，电子电流强度与主电离成正比
- 在正比区：电子在强电场中获得足够能量产生次级电离，形成雪崩；在合适条件下，输出电荷仍与初始电荷成正比
- 放电区：电压过高时，放大不再保持比例关系，甚至形成自持放电，不再适用于正比能损测量

  若平均放大倍数为$G$，则
  $
    Q_"out" = G e n_"total"
  $
电信号可以直接由电子学器件记录，便于计算机处理。

==== 多丝正比室

*多丝正比室*（multi-wire proportional chamber, MWPC）在两个阴极平面之间布置大量平行的细阳极丝。细丝附近电场强，电离电子漂移到丝附近后发生雪崩，典型气体放大因子可达$10^4$至$10^5$。

阳极丝尺寸为几十微米量级，丝间距的典型示例约为$2 "mm"$。每根丝有独立读出，触发信号的丝位置给出一个空间坐标；另一个坐标可由不同方向的丝平面或阴极读出获得。若只记录最近的一根丝、丝间距为$d$，且击中位置在一根丝对应区域内均匀分布，则
$
  sigma_x approx d/sqrt(12)
$
利用邻近通道的电荷分配还可进一步提高分辨率。Charpak发展的多丝正比室使径迹记录从逐张照片转向电子学读出，是探测技术的重要进步。

==== 漂移室

*漂移室*(Drift chamber)利用*漂移时间*推断电离位置。它可采用比MWPC更大的信号丝间距，例如几厘米，并用场丝控制漂移区电场。若漂移速度近似为常数$v_d$，初始时刻为$t_0$，则电离点到读出丝的漂移距离为
$
  d = v_d (t - t_0)
$
当$v_d$随位置变化时，需要用标定得到的时间与距离关系代替这一线性近似。

典型气体漂移速度为$5 "cm/μs"$量级，位置分辨可达$200 "μm"$量级。在上述速度下，$200 "μm"$对应约$4 "ns"$的时间间隔。扩散、初级电离涨落、场不均匀及$t_0$误差都会影响位置分辨。

起始时刻通常由快探测器提供。多个交错布置的测量层还用于消除粒子位于信号丝哪一侧的左右歧义。固定靶磁谱仪常把快探测器、MWPC或漂移室与偶极磁铁组合：前后径迹层测方向，快信号提供触发和时间基准。

==== 时间投影室 (Time projection chamber, TPC)

TPC把二维位置读出与电子漂移时间结合，重建三维径迹。典型气体TPC中，电场和磁场近似平行，电离电子逆电场方向漂移到阳极端盖；磁场使入射带电粒子轨迹弯曲，并抑制电子的横向扩散。

端盖上的分段电极或丝室给出投影坐标$(x,y)$，漂移时间给出沿电场方向的距离
$
  d_z = v_d (t - t_0)
$
结合端盖位置即可求出电离点的$z$坐标。许多这样的三维点组成一条径迹；其曲率给出动量，各点电荷量还可用于$dv(E, x)$测量。

#figure(
  image("pic/ch1/tpc-principle.svg", width: 80%),
  caption: [TPC用端盖的二维位置读出和漂移时间恢复三维径迹],
)

气体TPC可以做到数立方米甚至更大。典型示例的横向分辨约$150 "μm"$，漂移方向分辨约$700 "μm"$；具体性能取决于漂移距离、扩散、气体、磁场及读出结构，不能把这些数字视为所有TPC的共同指标。

LEP的ALEPH和RHIC的STAR都使用了大型TPC。ALEPH的多喷注事例展示了大量径迹如何组合成喷注；例如
$
  e^+ + e^- -> q + overline(q) + g -> "hadrons"
$
可以形成三喷注结构。STAR在$sqrt(s_(N N)) = 200 "GeV"$的金核与金核碰撞中记录了高粒子多重数的三维径迹。

#figure(
  image("pic/ch1/aleph-three-jets.png", width: 75%),
  caption: [ALEPH的三喷注事例显示内层径迹与外层能量沉积相互补充],
)

==== 硅微条与硅像素探测器

*硅微条探测器*（silicon microstrip detector）利用半导体的耗尽层收集电离电荷。以$n$型硅基片上的$p$型条带为例，对结施加反向偏压，形成耗尽区；粒子穿过时产生电子与空穴对，二者在电场下向相反方向漂移，并在分段电极上产生信号。

硅中产生一个电子与空穴对所需的平均能量约为$3.6 "eV"$，低于常用气体的$W_i$，因此薄硅片也能产生较大的初始信号。微条给出一个精确坐标，多层交叉布置可恢复三维径迹；*像素探测器*则直接提供二维击中位置，在高粒子密度环境中减少组合歧义。

硅径迹探测器的典型空间分辨可达$10 "μm"$量级。它们适合靠近相互作用点布置，用于重建主顶点、次级顶点和径迹的冲击参数，对粲、底强子研究尤其重要。例如LHCb的VELO就是顶点探测器。

#note(subname: [用位移顶点识别短寿命粒子])[
  一个固有寿命为$tau$的粒子，其平均飞行距离为
  $
    ell = beta gamma c tau
  $
  即使$c tau$只有亚毫米量级，运动带来的Lorentz伸长也可能使衰变顶点与主顶点分开。顶点探测器通过测量衰变产物径迹的交点和冲击参数，提供比单纯不变质量更丰富的鉴别信息。
]

=== 闪烁体与飞行时间测量

*闪烁体探测器*（scintillation detector）把能量沉积转化为紫外或可见光。带电粒子激发或电离介质，介质随后退激发光；光子通常先产生带电次级粒子，再形成闪烁信号。闪烁体可分为有机、无机材料，并可呈固态、液态或气态，常见例子有塑料闪烁体及CsI:Tl晶体。

闪烁光经光导或光纤传到光电倍增管（photomultiplier tube, PMT）等光传感器，转化并放大为电信号。典型光产额可达每$"MeV"$约$10^4$个光子，但实际探测到的光电子数还要乘光收集效率和光电转换效率。

快塑料闪烁体与合适的读出系统可达到$100 "ps"$或更好的时间分辨，适合触发和*飞行时间*（time of flight, TOF）测量。高光产额与快时间响应并不是同一个指标，不同材料的衰减时间可相差很大。

若粒子沿径迹飞行的实际长度为$L$、飞行时间为$t$，则
$
  beta = L/(c t)
$
结合磁谱仪测得的动量，可求得质量
$
  m^2 c^4 = (p c)^2 [1/beta^2 - 1]
  = (p c)^2 [(c t/L)^2 - 1].
$
对相同动量、质量分别为$m_1,m_2$的粒子，飞行时间差为
$
  Delta t = L/c [sqrt(1 + (m_1 c/p)^2) - sqrt(1 + (m_2 c/p)^2)].
$
在$p >> m_i c$时
$
  abs(Delta t) approx L/(2 c) (abs(m_1^2 - m_2^2) c^2)/p^2.
$
因此高动量处TOF鉴别能力变差；增加飞行距离或改善时间分辨可以扩大可分辨的动量范围。若要求$k$个标准差的分离，需满足$abs(Delta t) >= k sigma_t$，其中$sigma_t$应包括起始、终止计时及路径长度不确定度折算的总误差。

#block(breakable: false)[
  === 切伦科夫探测器 (Cherenkov detectors)

  带电粒子在透明介质中运动，当其速度超过该介质中光的相速度，即
  $
    v > c/n, quad beta n > 1,
  $
  会产生切伦科夫辐射。这个条件不要求、也不允许粒子超过真空光速$c$。
]

在时间$t$内，粒子前进$v t$，光波前扩展$c t/n$。由相干叠加的几何关系，光子传播方向与粒子运动方向的夹角满足
$
  cos theta_C = 1/(n beta).
$
因此测量切伦科夫角即可测速度。介质存在色散时，$n$依波长变化，也会引起角度展宽。

对于质量$m$的粒子，辐射阈值为
$
  beta_"th" = 1/n, quad
  gamma_"th" = n/sqrt(n^2 - 1), quad
  p_"th" = (m c)/sqrt(n^2 - 1).
$
在相同动量下，不同质量粒子的速度不同，因此可以采用两种鉴别方式。
- *阈值式探测器*：选定折射率，使一种粒子高于阈值、另一种低于阈值，用有无信号区分；
- *环成像切伦科夫探测器*（ring-imaging Cherenkov detector, RICH）：用光学系统将光锥投影为环，测量环半径，从而求$theta_C$、$beta$及质量。
对简单的焦平面几何，环半径约为$r = f tan theta_C$，其中$f$为光学焦距。速度接近$c$时，角度趋近$theta_(C,max) = arccos(1/n)$，不同粒子的角度差逐渐减小。

#example(subname: [水中的切伦科夫阈值])[
  取水的折射率$n = 1.33$，则
  $
    beta_"th" approx 0.752, quad theta_(C,max) approx 41.2 degree.
  $
  对应阈动量约为$p_"th" approx 1.14 m c$。因此对动量相同的粒子，较轻的粒子更容易超过阈值。
]

*超级神冈*（Super-Kamiokande）是大型水切伦科夫探测器，以约$50000$吨水作为靶及发光介质，水箱内壁布置大量光电倍增管。中微子本身不直接发出切伦科夫光，而是通过弱相互作用产生带电粒子，再由这些次级粒子成环。

缪子较少发生电磁簇射，环边缘通常较清晰；电子会发生多重散射和电磁簇射，环边缘通常更模糊。利用环形、光量、时间和方向信息，可以判断粒子类型并重建事例。

// 课件第 116 页，左为缪子环，右为电子环。
#figure(
  image("pic/ch1/cherenkov-rings.png", width: 95%),
  caption: [水切伦科夫探测器中的缪子环（左）和电子环（右）],
)

=== 量能器与能量分辨率 (Calorimeters)

*量能器*通过吸收入射粒子引发的簇射，测量与入射能量相关的电离或闪烁信号。它对被吸收粒子是一种破坏性测量，因此通常位于精密径迹与速度测量系统之外；缪子等高穿透粒子还可在量能器之后被继续测量。

量能器按结构可分为
- *均匀型*（homogeneous calorimeter）：吸收介质本身也是敏感介质，例如闪烁晶体，能够测量大部分可见沉积能量；
- *取样型*（sampling calorimeter）：吸收层与敏感层交替，例如铅与塑料闪烁体的三明治结构，只测量沉积能量的一部分，需要标定取样比例。
两者都需要足够的纵向深度与横向尺寸以限制簇射泄漏。“全吸收”是理想的包容要求，不表示每一种入射粒子的全部能量都必然转化为可测信号。

如果有效信号量子数$N$正比于能量$E$，统计涨落近似为$sqrt(N)$，则相对能量分辨率具有$1/sqrt(E)$行为。更一般地可写为
$
  (sigma_E/E)^2 = a^2/(E/"GeV") + b^2 + (c_"noise"/E)^2.
$
其中$a$为随机项系数，$b$为常数项，$c_"noise"$具有能量量纲。三个项分别概括簇射及取样统计涨落、标定和响应不均匀等效应，以及电子学噪声。不同装置的系数不同，不能只用一个随机项描述所有能量区间。#footnote[量能器结构、分辨率和强子响应参见 #link("https://pdg.lbl.gov/2024/reviews/rpp2024-rev-particle-detectors-accel.pdf")[PDG, Particle Detectors at Accelerators]。]

#block(breakable: false)[
  === 电磁量能器 (Electromagnetic calorimeter, ECAL)

  电磁量能器主要测量电子、正电子和光子的能量。簇射由轫致辐射与电子对产生交替发展
  $
    e^(plus.minus) + N -> e^(plus.minus) + N + gamma, quad
    gamma + N -> e^+ + e^- + N.
  $
]
其纵向发展尺度由辐射长度决定。以下用$ell_0$表示几何辐射长度，避免与质量厚度单位混淆。

用一个简单的分裂模型理解簇射：每经过一个特征长度，每个粒子分裂为两个、平均能量减半。经过$k$代后
$
  N_k approx 2^k, quad E_k approx E_0/2^k.
$
当$E_k approx E_c$时，粒子数达到最大，故
$
  k_max approx (ln(E_0/E_c))/(ln 2), quad N_max approx E_0/E_c.
$
这个模型忽略了实际能量分配和相互作用距离的涨落，但说明了两个关键趋势：*簇射最大处的深度随入射能量近似对数增长，而最大粒子数及总带电径迹长度近似正比于入射能量*。并非簇射的纵向长度本身正比于$E_0$。

// 课件第 119 页右侧的电磁簇射照片。
#figure(
  image("pic/ch1/em-shower.png", width: 38%),
  caption: [吸收体中的电磁簇射。可见次级粒子先增殖，再逐渐被吸收],
)

为限制泄漏，电磁量能器通常需要约$15$至$25$个辐射长度或更深，具体要求取决于能量范围和允许的泄漏。以铅为例，$ell_0 approx 5.6 "mm"$，因此可以用较紧凑的结构容纳电磁簇射。

取样结构可由约毫米厚的铅板和闪烁层交替组成，其典型随机项示例为
$
  sigma_E/E approx (15% "至" 18%)/sqrt(E/"GeV").
$
例如$E = 100 "GeV"$时，仅计此随机项，相对分辨约为$1.5%$至$1.8%$；实际还需叠加常数项、噪声及泄漏效应。

=== 强子量能器 (Hadronic calorimeter, HCAL)

强子量能器通过强子与原子核的非弹性反应产生簇射。其特征尺度为*核相互作用长度*$ell_I$，显著大于高$Z$材料的辐射长度。

强子量能器多采用取样结构，例如铁板与塑料闪烁体交替。铁的$ell_I$约为$17 "cm"$；若要求较高能强子簇射充分包容，可需要约$10$至$15$个相互作用长度。实际装置常由前方电磁量能器、强子量能器及后方泄漏探测共同承担测量，深度也随设计目标变化。

强子簇射包含多种成分：次级强子的电离、核反冲和核碎裂、慢中子，以及$pi^0 -> gamma gamma$引起的电磁子簇射。其响应涨落比电磁簇射更大，主要原因包括
- 每个事例中电磁成分所占比例不同；
- 核破裂消耗的能量及部分中微子等构成不能有效读出的“不可见能量”；
- 探测器对电磁成分与非电磁成分的响应不同，即通常$e/h != 1$；
- 取样、慢中子响应及纵向、横向泄漏还会带来额外涨落。
因此，强子量能器分辨率较差不能简单归因于电磁簇射没有进入闪烁层。

典型取样型强子量能器的随机项示例为
$
  sigma_E/E approx (40% "至" 60%)/sqrt(E/"GeV").
$
在$100 "GeV"$时，这一项约为$4%$至$6%$。强子量能器不仅能测带电强子，也能测中子和$K_L$等中性强子的能量，这是磁谱仪无法独立完成的。

=== 多子探测器信息的联合使用

完整事例重建通常从径迹、顶点、时间信号和量能器簇团出发，进行空间与时间匹配，最后给每个候选粒子赋予类型和四动量。

#figure(
  three-line-table[
    | 物理问题 | 主要观测组合 |
    | --- | --- |
    | 粒子带何种电荷、动量多大？ | 已知磁场中的径迹方向和曲率 |
    | 带电粒子质量是什么？ | 动量与$dv(E, x)$、TOF或切伦科夫角联合 |
    | 是电子还是光子？ | 电磁簇射与带电径迹、转换顶点的匹配 |
    | 是缪子还是强子？ | 内层径迹、量能器沉积、外层穿透径迹 |
    | 是否存在短寿命母粒子？ | 次级顶点、冲击参数和衰变产物不变质量 |
    | 是否存在未被直接探测的动量？ | 全部可见末态的横向动量平衡 |
  ],
  caption: [从探测器信号到粒子性质的重建],
)

在强子对撞中，参与硬散射的部分子的纵向动量逐事例未知，但初态横动量通常较小，因此常定义*缺失横动量*
$
  vb(p)_T^"miss" = -sum_(i in "visible") vb(p)_(T,i).
$
较大的缺失横动量可以提示中微子等不可见粒子，也可能来自能量测量误差、探测盲区或未被正确重建的粒子，需要结合整个探测器的响应判断。
