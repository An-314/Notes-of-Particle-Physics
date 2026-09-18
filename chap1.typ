#import "@preview/scripst:1.1.3": *

= 概论、预备知识

== 概论：基本粒子和相互作用 (Elementary Particles and Interactions)

粒子物理是研究基本粒子和其相互作用的学科。“基本”具有“与时俱进”的意义：随着理论和实验的发展，曾经被认为是基本粒子的粒子可能会被发现是由更基本的粒子组成的。

*夸克和轻子*是目前已知的基本粒子，他们分为两类，每类有三代：
- 夸克有六种味：
  - 上($u$), 粲($c$), 顶($t$) 具有电荷 $+2/3$
  - 下($d$), 奇($s$), 底($b$) 具有电荷 $-1/3$
- 轻子也有六种味：
  - 电子($e$), $μ$子($μ$), $τ$子($τ$) 具有电荷 $-1$
  - 电子中微子($nu_e$), $μ$中微子($nu_mu$), $τ$中微子($nu_tau$) 具有电荷 $0$
当代粒子物理最重要的问题包括：为什么目前我们只发现了三代的夸克和轻子？质量的来源是什么？

我们用波函数描述*粒子*的状态
$
  ket(psi)
$
例如电子的波函数是多个算符共同的本征态
$
  hat(Q) ket(psi) = -e ket(psi)\
  hat(S) ket(psi) = s ket(psi)\
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
一种粒子对应一整个量子态空间。对于相对论粒子，最标准的严格定义来自 Wigner：
$
  "一种基本稳定粒子" <--> "Poincaré 群的一个不可约幺正表示"
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
- 第二个 Casimir 是 Pauli–Lubanski 向量
  $
    W^mu = 1/2 epsilon^(mu nu rho sigma) P_nu M_(rho sigma)
  $
  对有质量粒子
  $
    W^mu W_mu ket(psi) = -m^2 s(s+1) ket(psi)
  $
于是$m,s$就成为了定义一类基本稳定粒子的两个量子数。但是$(m,s)$仍然不能完整定义电子，还需要加入内部量子数：例如电荷、以及在标准模型中相应的弱同位旋、超荷等量子数。因此更加完整地说，一种粒子由它在 Poincaré 群的不可约表示空间和它在相应的内部对称群的不可约表示空间共同定义。

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
  没有物理意义，因为电子和质子具有不同的电荷。我们说电子态和质子态属于不同的*超选择子空间*，它们之间不能叠加。更一般地说，具有不同内部量子数的粒子态属于不同的超选择子空间，它们之间不能叠加。

  正常的量子叠加例如自旋
  $
    ket(psi) = 1/sqrt(2) (ket(arrow.t) + e^(i phi) ket(arrow.b))
  $
  这里$phi$是可观测的。因为我们可以测$S_x,S_y$
  $
    expval(S_x) & = braket(psi, hat(S)_x, psi) = cos(phi) \
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
  完全没有$phi$。这意味着$phi$在宇宙中任何允许的测量里都无法出现。事实上
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
    ket(nu_e) = U_(e 1) ket(nu_1) + U_(e 2) ket(nu_2) + U_(e 3) ket(nu_3)
  $
  所以甚至质量不同都不妨碍相干叠加。
]
#newpara()
粒子之间的*相互作用*分为四种
#figure(
  three-line-table[
    | 相互作用 | 介质 | 强度 | 发生场合 |
    | --- | --- | --- | --- |
    | 强相互作用 | 胶子 | $1$ | 原子核 |
    | 电磁相互作用 | 光子 | $10^(-3)$ | 原子、分子、凝聚态物质 |
    | 弱相互作用 | W/Z Boson | $10^(-5)$ | $β$衰变、核反应 |
    | 引力相互作用 | 引力子(?) | $10^(-38)$ | 宇宙学 |
  ],
  caption: [四种基本相互作用],
)
基本粒子运动的规律由*量子场论*描述。量子场论的基本思想是：每种基本粒子对应一个场，粒子是场的激发态。不同的相互作用对应不同的场。例如
$
  n -> p + e + overline(nu)_e
$
就意味着$n$激发态的场可以衰变为$p$激发态的场、$e$激发态的场和$overline(nu)_e$激发态的场。
- 每种粒子对应一种场，场没有不可入性，对应各种不同粒子的场在空间中相互重叠地充满全空间
- 场的能量最低状态称为基态，场的激发状态表现为出现相应的粒子，场的不同激发状态表现为粒子的数目和运动状态不同
  - 场处于基态时由于不能释放出能量，不能输出信号，从而不表现出直接的物理效应，亦即不表现为出现粒子
  - 因此场和粒子之间，场是更基本的，粒子只是场处于激发状态的表现
- 所有的场都处于基态时为物理真空
  - 由此可见，真空并不是“真”的“空”无一物
  - 真空态时，全空间充满各种场，只是由于所有场都处于能量最低状态而不可能表现出任何释放出能量从而给出信号的物理效应
  - 例如
    $
      gamma + gamma -> e^+ + e^-
    $
    就是利用能量在真空中激发出物质的例子

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

粒子数据组每逢双年更新出版一本Review of Particle Physics，里面全面收集了全世界粒子物理方面的实验数据及有关资料。同时出版一本把其中主要内容集中起来的小本的手册Particle Physics Booklet。http://pdg.lbl.gov

== 自然单位制 (Natural Units, NU)

=== 单位制

*国际单位制*(Systém International d’Uniteé, SI) 对描述粒子物理现象（微观、高速）很不方便，如：
$
    c & approx 2.998 times 10^8 "m/s" \
  m_p & approx 1.673 times 10^(-27) "kg" \
  r_p & approx 0.877 times 10^(-15) "m" \
$
公式中经常出现两个物理学常数
$
  c, hbar = h/(2 pi)
$
希望构造一个单位制，使得$c=1, hbar=1$，这样就可以把时间和长度、能量和质量、动量和速度等联系起来。于是有了*自然单位制*（Natural Units, NU）。

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
两种单位制的基本量的关系可以通过维度分析得到，两种单位制的基本量的关系可以通过维度分析得到
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
  E = 1 ["GeV"] = 1.602 ["kg"] ["m"]^2 ["s"]^(-2)
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
这里是Einstein求和约定，$g_(mu nu)$是Minkowski度规(metric)
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

设事件发生在原点，时空点
$
  x^mu = (0, 0, 0, 0)
$
与事件的时空间隔
$
  x^mu x_mu = t^2 - x^2 - y^2 - z^2
$
这是一个Lorentz不变量。根据$x^mu x_mu$的符号，时空点分为三类：
- $x^mu x_mu > 0$，称为*类时间隔*
- $x^mu x_mu = 0$，称为*类光间隔*
- $x^mu x_mu < 0$，称为*类空间隔*
具有类空间隔的事件之间不可能有因果联系。因果联系是指一个事件的发生可能影响另一个事件的发生。类光间隔的事件之间可能有因果联系，但不可能有信息传递。类时间隔的事件之间可能有因果联系，并且可以有信息传递。

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
是Lorentz不变量。相对与水平夹角为$theta$波矢为$vb(k)$的光源运动的观察者看到
$
      omega' & = gamma omega (1 - beta cos theta) \
        k'_x & = gamma k_x (1 - beta cos theta) \
        k'_y & = k_y \
  tan theta' & = k'_y / k'_x = (sin theta) / (gamma (cos theta - beta))
$
从而即使在横向（$theta = pi/2$）依然可以看到频率变化，这被称为相对论多普勒频移 (relativistic Doppler shift)，是相对论现象。

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

粒子沿某一方向的快慢也可以用*快度*$y$来描写，定义如下
$
  tanh y = beta_parallel = p_parallel / E
$
其中$p_parallel$是粒子动量在运动方向的分量，$E$是粒子能量。快度$(-oo, + oo)$是速度$[-1,+1]$在$x$方向的投影的单调函数，在速绝对值很小时
$
  y = beta_parallel + O(beta_parallel^3)
$
在纵向（$parallel$方向）洛伦兹变换下，快度的变换规律为
$
  y^* = y - y_f
$
其中$y_f$是两个参考系之间的相对快度。快度的变换规律是一个重要的相对论效应。
$
  y = 1/2 ln((E + p_parallel)/(E - p_parallel)) = 1/2 ln((1 + beta_parallel)/(1 - beta_parallel))\
  y_f = 1/2 ln((1 + beta_f)/(1 - beta_f))
$
还可以得到
$
  p_parallel = m_T sinh y\
  E = m_T cosh y
$
其中
$
  m_T = sqrt(m^2 + p_T^2)
$
为横质量，在纵向Lorentz变换下不变。

实验分析中，常用*赝快度*$eta$代替快度，定义为
$
  eta = - ln tan theta/2
$
其中$theta$为粒子运动方向与标准方向（纵向正方向）的夹角
$
  eta = - 1/2 ln ((abs(vb(p)) + p_parallel)/(abs(vb(p)) - p_parallel))
$
如果$m << p_T$，快度与赝快度相差很小。

=== 粒子的运动定律 (the law of motion of a particle)

Newton顿第二定律
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
    dd(tau, 2) & = dd(t, 2) - dd(x, 2) - dd(y, 2) - dd(z, 2) \
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
回到实验室系，两个粒子总能量为
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
通常
$
  E_1 >> m_1,m_2
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

*对撞实验*实验室系即质心系，总能量为
$
  E_"cm" = sqrt((E_1 + E_2)^2) = E_1 + E_2 approx 2 E_1
$
需要提高质心系能量来产生更重的新粒子。$E_1$较难提高，所以现代粒子物理实验大多采用对撞机(collider)。

=== $n$个粒子反应的不变量

考虑一个粒子的衰变或两个粒子碰撞所产生的反应，如果初态和末态共涉及$n$个粒子。考察由这$n$个粒子的四维动量$p_i^mu$, $i = 1, 2, dots, n$可以组成多少个 Lorentz 不变量？

- 由于能动量守恒，这$n$个四维动量中只有$n-1个$是独立的
- 它们能构成的Lorentz不变量$p_i^mu p_(j mu)$共有$n(n-1)/2$
- 但其中$n$个是$n$个粒子的质壳条件，还有$(n(n-3))/2$个不变量可以变化
不变量个数随$n$增加迅速增长。

对于$n$个粒子的反应
- 如果是衰变，末态粒子数为$n-1$
- 如果是碰撞，末态粒子数为$n-2$
- 独立的不变量个数为
  $
    n(n-3)/2
  $

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
  例如$e+e->e+e$的T-道Feymann图
  $
    (p_1 - p_3)^2 = (p_2 - p_4)^2 = t = p_gamma^2
  $
  #figure(
    include "pic/1.1.typ",
    caption: [T-道$e + e -> e + e$散射Feymann图],
  )
  $t$表示四维动量转移的平方，恰好就是虚光子的四维动量平方。$t$越大，虚光子越“虚”，即离质量壳越远。
]

粒子反应很多物理量与参考系无关，例如反应截面，这些物理量是系统Lorentz不变量的函数。

== 碰撞和衰变

== 辐射粒子与物质的相互作用

== 高能粒子来源

== 粒子探测器
