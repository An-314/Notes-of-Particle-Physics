#import "@preview/scripst:1.1.3": *
#let dif = math.upright("d")
#show figure: set block(breakable: true)

#pagebreak(weak: true)

= 强子 (Hadrons) <chap4-hadrons>

本章从强相互作用共振态的实验证据出发，讨论如何利用散射、衰变角分布、不变质量与Dalitz图确定强子的自旋、宇称和同位旋。随后将同位旋推广为近似的味$"SU"(3)$对称性，用八正法和夸克模型组织强子，推导基态波函数、磁矩、质量分裂与混合，再介绍粲、底、顶夸克的发现和标准模型的粒子图像。

继续采用$hbar=c=1$。$I$表示同位旋，$J$表示总角动量；$Y=B+S$ 在轻味三夸克分类中表示超荷。味$"SU"(3)$和色$"SU"(3)_C$作用于不同的内部自由度，分别说明。

// 来源：files/第四章(2026)秋 - 课前.pdf，全147页；重复目录保留为本章结构。

== 共振态

#show figure: set block(breakable: false)

// 源讲义第1–4页。重复的章节目录仅用本章各级标题保留。
=== 强子与强衰变

*强子*（hadrons）包括重子和介子，是参与强相互作用的粒子。此前讨论的重子和介子为稳定或亚稳态粒子，仅发生*弱衰变*（寿命约$10^(-8) "s"$）或*电磁衰变*（寿命约$10^(-17) "s"$）。

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    image("pic/ch4/baryon-half-multiplets.png", width: 100%), image("pic/ch4/pseudoscalar-multiplets.png", width: 100%),
  ),
  caption: [$J^P=(1/2)^+$重子及$J^P=0^-$赝标介子的同位旋多重态；括号中为质量，单位为MeV],
)

如果强子的质量足够大，可以在不破坏强相互作用选择条件的前提下，*强衰变*到稳定或亚稳定强子。发生强衰变的强子寿命极短，约$10^(-24) "s"$，在产生位置即衰变。即使Lorentz因子$gamma=300$，在$10^(-24) "s"$内也仅能飞行约$100 "fm"$。

这些发生强衰变的不稳定强子称为*共振态*（resonances）。有两种观测方式：
- 两强子反应截面在某一特定能量出现极大值。
- 粒子反应末态中几个粒子的不变质量分布出现极大值。

// 源讲义第5–6页。
=== 经典阻尼谐振子与Breit–Wigner函数

阻尼谐振子坐标的时间演化为
$
  Psi(t)=Psi_0 exp(-(Gamma t)/2)cos omega_0 t
  =Psi_0 exp(-t/(2 tau))cos omega_0 t, quad tau equiv 1/Gamma
$
在阻尼谐振子上加频率为$omega$的周期外力，响应函数为
$
  R(omega)=(Gamma^2 omega^2)/((omega_0^2-omega^2)^2+Gamma^2 omega^2)
$
受迫振动响应函数的宽度$Gamma$是自由振动时寿命$tau$的倒数。

#figure(image("pic/ch4/damped-oscillator.png", width: 32%), caption: [阻尼自由振动及其指数包络])

如果$Gamma << omega_0$，在峰值附近，响应函数分母近似为
$
  (omega_0^2-omega^2)^2+Gamma^2 omega^2 & =(omega_0-omega)^2(omega_0+omega)^2+omega^2 Gamma^2 \
                                        & approx 4 omega_0^2[(omega_0-omega)^2+(Gamma/2)^2]
$
因此
$
  R(omega) approx L(omega)
  =((Gamma/2)^2)/((omega_0-omega)^2+(Gamma/2)^2)
$
这就是Breit–Wigner函数。

#figure(
  image("pic/ch4/breit-wigner-schematic.png", width: 44%),
  caption: [共振峰中心位于$M$，半高处位于$M-Gamma/2$与$M+Gamma/2$，全宽为$Gamma$],
)

// 源讲义第7–10页。
=== 量子力学中的不稳定粒子

自由粒子的波函数$psi$满足Schrödinger方程
$
  i pdv(psi(x, t), t)=H psi(x, t)
$
在相对粒子静止的系统，$H$的意义即为粒子的质量。若$m'$是$H$的本征值、$psi(x)$是相应本征函数，则
$
  psi(x, t)=e^(-i m' t)psi(x)
$
粒子在全空间存在的总概率为
$
  integral abs(psi(x, t))^2 upright(d)^3 x
$
如果$m'$为实数，
$
  abs(psi(x, t))^2=abs(psi(x))^2, quad
  integral abs(psi(x))^2 upright(d)^3 x=1
$
粒子存在的概率不随时间变化，归一化为1。

#block(breakable: false)[
  #note(subname: [复质量的有效描述])[
    以下复本征值是对不稳定态存活子空间的有效描述，适用于近共振、近指数衰减的近似。包含全部衰变产物的封闭量子体系仍由Hermitian的Hamiltonian演化。
  ]
]
#newpara()
如果$m'$为复数，取
$
  m'=m-i Gamma/2
$
Schrödinger方程的解写为
$
  psi(x, t)=e^(-i(m-i Gamma/2)t)theta(t)psi(x), quad
  theta(t)=cases(1 & t>=0, 0 & t<0)
$
粒子在全空间存在的总概率为
$
  integral abs(psi(x, t))^2 upright(d)^3 x
  =e^(-Gamma t)theta(t)integral abs(psi(x))^2 upright(d)^3 x
  =e^(-Gamma t)theta(t)
$
这描述了在$t=0$产生的不稳定粒子，其存活概率在$t>0$指数衰减。寿命与本征值虚部的关系为
$
  Gamma tau=1
$
#newpara()
对含时波函数作时间Fourier变换
$
  psi(x, M) & =integral psi(x, t)e^(i M t) dd(t) \
            & =psi(x)integral_0^infinity e^(i(M-m+i Gamma/2)t) dd(t) \
            & =sqrt(Gamma/(2 pi)) i/(M-m+i Gamma/2)psi(x)
$
// #block(breakable: false)[
//   #note(subname: [Fourier变换的归一化])[
//     上式保留讲义原有三行形式。按第一行未附归一化因子的定义，直接积分得到$i psi(x)/(M-m+i Gamma/2)$。最后一行的$sqrt(Gamma/(2 pi))$是为下一步质量分布归一化而补入的因子。
//   ]
// ]
对全空间积分并归一化，粒子质量分布函数为
$
  rho(M)=Gamma/(2 pi[(M-m)^2+Gamma^2/4])
$
其中$m$是粒子质量，$Gamma$是粒子宽度。这也是Breit–Wigner函数。

#figure(
  image("pic/ch4/breit-wigner-mass.png", width: 66%),
  caption: [归一化质量分布，峰高为$2/(pi Gamma)$，半高全宽为$Gamma$],
)

// 源讲义第11–12页。
=== 部分宽度、分支比与寿命

若粒子有多个衰变道，第$i$道的部分宽度$Gamma_i$、分支比$R_i$和总宽度$Gamma$满足
$
  Gamma_i=Gamma R_i, quad sum_i Gamma_i=Gamma
$
可能出现某一衰变道末态粒子静质量之和大于共振态中心质量的情况，这类情形称为*近阈共振态*。

以$f_0(975)$与$K^+K^-$、$K^0 overline(K)^0$阈值为例。

#figure(
  image("pic/ch4/f0-threshold.png", width: 64%),
  caption: [$f_0(975)$质量分布与两个$K overline(K)$阈值，横轴为$M$（MeV）],
)

粒子寿命长短可以由自振动周期$T=(2 pi)/m$衡量。质子的周期为$T=4.4 times 10^(-24) "s"$，并且
$
  tau/T=m/(2 pi Gamma)
$
只要质量远大于宽度，粒子就是稳定的。
#block(breakable: false)[
  #note(subname: [稳定的时间尺度])[
    $m >> Gamma$表示寿命远长于内禀振动时间尺度，即窄宽度、准稳定的粒子描述成立。严格稳定要求$Gamma=0$。恢复单位后，$Gamma tau=hbar$，$T=(2 pi hbar)/(m c^2)$。
  ]
]
共振态寿命较短，但宽度较大，可以通过测量宽度来测量寿命。

// 源讲义第13–14页。
=== 共振态的探测方法

==== 形成反应中的截面峰

两强子反应可经过共振中间态
$
  a+b -> R -> c+d+dots+f
$
其截面在特定质心能量处出现极大值。
$
  sigma(sqrt(s))=
  (2J+1)/((2s_a+1)(2s_b+1)) (4 pi)/s
  (Gamma_i Gamma_j)/((sqrt(s)-M_R)^2+(Gamma/2)^2)
$
其中$J$为共振态自旋，$s_a,s_b$为入射粒子自旋，$Gamma_i,Gamma_j$分别对应形成道与所观测衰变道。


#note(subname: [形成截面的入射动量因子])[
  一般两体入射的对应运动学因子为$pi/k^2$，其中$k$为质心系入射三动量，只有在入射粒子质量可忽略、$k^2 approx s/4$时才化为$(4 pi)/s$。
]


#figure(image("pic/ch4/resonance-formation.png", width: 88%), caption: [两强子形成共振态及反应截面随质心能量的峰结构])

==== 产生反应中的不变质量峰

也可以在反应末态若干粒子的不变质量分布中寻找极大值，例如
$
  a+b -> R+e -> c+d+e
$
$c,d$两粒子的不变质量为
$
  M_(c d)=sqrt((E_c+E_d)^2-(vb(p)_c+vb(p)_d)^2)
$

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    image("pic/ch4/production-diagram.png", width: 100%), image("pic/ch4/invariant-mass-schematic.png", width: 100%),
  ),
  caption: [伴随粒子$e$的共振产生过程及$M_(c d)$分布],
)

#figure(
  image("pic/ch4/atlas-higgs.png", width: 47%),
  caption: [ATLAS双光子不变质量分布实例，ATLAS，Phys. Lett. B716 (2012) 1–29],
)

== $(3/2)^+$的重子

// 源讲义第15–19页。
=== 介子–核子散射与$Delta$共振态

此前学习的重子都是亚稳态，其$J^P=(1/2)^+$同位旋多重态已见本章开头。为了形成重子共振态，需要用介子束流轰击重子靶，例如液氢或氘：
- $pi$介子束流实验能否产生奇异数为0的重子共振态。
- $K^-$介子束流实验能否产生奇异数为$-1$的重子共振态。
- $K^+$介子束流实验能否产生奇异数为$+1$的重子共振态。

1960年代，$pi$和$K^-$介子束流实验发现了多个共振态，并测量其同位旋、自旋和宇称。

$pi$介子是$I=1$同位旋三重态，核子是$I=1/2$同位旋双重态，所以
$
  1 ⊗ 1/2=1/2 ⊕ 3/2
$
$pi N$共振态的同位旋为$1/2$或$3/2$，分别为双重态和四重态。通常将$I=1/2$的$pi N$共振态记作$N("xxxx")$，将$I=3/2$的记作$Delta("xxxx")$，其中xxxx为质量的MeV数值。

#figure(
  image("pic/ch4/pion-proton-cross-section.png", width: 90%),
  caption: [$pi^+p$总截面与弹性散射截面随实验室系动量的变化],
)

第一个共振态由Fermi实验组在1952年利用带电$pi$介子束流发现。它是$I=3/2$的$Delta(1236)$四重态，四个电荷态为
$
  Delta^-, quad Delta^0, quad Delta^+, quad Delta^(++)
$
方位角微分散射分析显示，$pi$与核子的轨道角动量为$l=1$，总角动量为$J=3/2$。宇称是$(-1)^l$与$pi$、核子的内禀宇称之积，故
$
  P=(-1)^1(-1)(+1)=+1, quad J^P=(3/2)^+
$

#figure(
  image("pic/ch4/delta1236-cross-section-marked.png", width: 54%),
  caption: [在低能$pi^+p$截面中圈出的第一个$Delta$共振峰],
)

$pi N$共振态很多，可以通过散射振幅随能量的变化寻找。继续提高散射能量，明显共振结构消失，$sigma_(pi p) approx 25 "mb"$，并随能量提高而缓慢上升。

// 源讲义第20–21页。
=== $S=-1$的共振态

$K$介子和核子都是$I=1/2$同位旋双重态，所以相应$overline(K)N$共振态的同位旋为0或1，构成单重态或三重态。通常将$I=0$的共振态记作$Lambda("xxxx")$，将$I=1$的记作$Sigma("xxxx")$，xxxx仍表示质量的MeV数值。

$K N$散射不能直接形成质量低于其总质量$1432 "MeV"$的共振态。但最低质量的$S=-1$重子系统是$Lambda pi$，阈值为$1255 "MeV"$，可以在$K$–核子反应末态中用不变质量法寻找。Alvarez于1963年在Bevatron研究
$
  K^-+p -> Lambda+pi^++pi^-
$
$Lambda pi$的总同位旋为1，所以中间态为$Sigma$共振态，有两种可能过程
$
  K^-+p & -> Sigma^(ast +)+pi^- -> (Lambda+pi^+)+pi^- \
  K^-+p & -> Sigma^(ast -)+pi^+ -> (Lambda+pi^-)+pi^+
$
对每一事例分别求出$Lambda pi^+$和$Lambda pi^-$的不变质量平方，绘成Dalitz图。

#figure(
  image("pic/ch4/sigma1385-dalitz-marked.png", width: 62%),
  caption: [$Lambda pi^+pi^-$末态的Dalitz图。两条清晰条带对应两个$Lambda pi$组合的共振峰],
)

两个条带对应质量峰$1385 "MeV"$、宽度$35 "MeV"$，确定
$
  Sigma(1385), quad I=1, quad J^P=(3/2)^+
$
另外，不存在$I=0$、$S=-1$、$J^P=(3/2)^+$的相应共振态，这将在夸克模型中得到解释。

// 源讲义第22–25页。
=== $S=-2$的共振态与$Xi^ast$的同位旋

最低质量的$S=-2$重子系统为$Xi pi$，可以在$K$–核子反应末态中以不变质量法寻找。Pjerrou于1962年在Bevatron发现最低的$Xi pi$共振态$Xi(1530)$，记作$Xi^ast$。它有$Xi^(ast 0)$和$Xi^(ast -)$两个电荷态。考虑$Xi^(ast 0)$，产生与衰变过程为
$
  K^-+p & -> Xi^(ast 0)+K^0 -> (Xi^-+pi^+)+K^0 \
  K^-+p & -> Xi^(ast 0)+K^0 -> (Xi^0+pi^0)+K^0
$
实验在$Xi^-pi^+$和$Xi^0pi^0$不变质量分布中都看到$Xi^(ast 0)$的Breit–Wigner峰，
$
  m=1530 "MeV", quad Gamma=(7 plus.minus 2) "MeV"
$

#figure(
  image("pic/ch4/xi1530-mass.png", width: 69%),
  caption: [$Xi pi$不变质量分布中的$Xi(1530)$，图中给出拟合曲线及背景],
)

$Xi^0pi^0$中的$Xi^(ast 0)$计数是$Xi^-pi^+$中的一半，这决定$Xi^ast$的同位旋。$Xi^ast -> Xi pi$允许$I=1/2$或$3/2$。由形成反应中的$I_3$守恒，$Xi^(ast 0)$有$I_3=+1/2$。

若$I=3/2$，则
$
  ket(Xi^(ast 0)) & =ket(3/2","+1/2) \
                  & =sqrt(1/3)ket(1/2","-1/2)ket(1","+1)
                    +sqrt(2/3)ket(1/2","+1/2)ket(1","0) \
                  & =sqrt(1/3)ket(Xi^- pi^+)+sqrt(2/3)ket(Xi^0 pi^0)
$
从而
$
  Gamma(Xi^(ast 0)->Xi^0 pi^0)/Gamma(Xi^(ast 0)->Xi^- pi^+)=2
$
若$I=1/2$，则
$
  ket(Xi^(ast 0)) & =ket(1/2","+1/2) \
                  & =sqrt(2/3)ket(1/2","-1/2)ket(1","+1)
                    -sqrt(1/3)ket(1/2","+1/2)ket(1","0) \
                  & =sqrt(2/3)ket(Xi^- pi^+)-sqrt(1/3)ket(Xi^0 pi^0)
$
因此
$
  Gamma(Xi^(ast 0)->Xi^0 pi^0)/Gamma(Xi^(ast 0)->Xi^- pi^+)=1/2
$
与实验结果符合，故$Xi^ast$的同位旋为$1/2$。末态角分布显示其$J^P=(3/2)^+$。

#figure(
  image("pic/ch4/baryon-threehalf-multiplets.png", width: 90%),
  caption: [发生强衰变的$J^P=(3/2)^+$重子。此处采用$Delta(1236)$、$Sigma(1385)$和$Xi(1530)$的历史质量记法],
)

== Dalitz图

// 源讲义第26–28页。
=== 三体末态的独立变量

考虑碰撞或衰变中的三粒子末态相空间。三个末态粒子的质量分别为$m_1,m_2,m_3$，在三粒子质心系，质心能量为$M$，对衰变过程即母粒子质量。动量和能量守恒给出
$
  vb(p)_1+vb(p)_2+vb(p)_3=0, quad E_1+E_2+E_3=M
$
末态仅剩五个独立变量。三个动量矢量共面，可用两个变量描述平面的法向，用一个变量描述动量三角形在平面内的转角，用两个变量描述动量三角形的大小和形状。对自旋0母粒子的衰变，或对母粒子自旋作非极化平均并积分整体取向后，只需*最后两个变量描述内部运动学*。散射过程还有入射方向这一外部结构，不能仅由“无初态极化”忽略所有取向变量。

这两个变量可以选作两个粒子的能量、动能，或两对粒子的不变质量平方。各组变量由线性关系联系，例如
$
  m_(23)^2 & =(E_2+E_3)^2-(vb(p)_2+vb(p)_3)^2 \
           & =(M-E_1)^2-vb(p)_1^2=M^2+m_1^2-2M E_1
$
三粒子系统的状态因此可以表示在$m_(13)^2,m_(12)^2$等两个状态量张成的平面上，这就是*Dalitz图*。

#figure(
  image("pic/ch4/dalitz-invariants.png", width: 55%),
  caption: [以$m_(12)^2,m_(13)^2$为坐标的Dalitz图，第三个不变质量平方为常数的轨迹是直线],
)

三个两体不变质量平方满足
$
  m_(12)^2+m_(23)^2+m_(13)^2=M^2+m_1^2+m_2^2+m_3^2
$
所以三者只有两个独立。

// 源讲义第29–30页，保留相空间推导的各中间步骤。
=== 面积元与三体相空间

*Dalitz图上的面积元正比于相空间体积*。忽略常数因子，三体相空间体积为
$
  R_3 prop integral (upright(d)^3 p_1)/E_1 (upright(d)^3 p_2)/E_2 (upright(d)^3 p_3)/E_3
  delta(E_1+E_2+E_3-M)delta^3(vb(p)_1+vb(p)_2+vb(p)_3)
$
先对$vb(p)_3$积分，得到
$
  R_3 prop integral (upright(d)^3 p_1 upright(d)^3 p_2)/(E_1 E_2 E_3)
  delta(E_1+E_2+E_3-M)
$
再将$vb(p)_1$的方向积分为$4 pi$，将$vb(p)_2$绕$vb(p)_1$的方位角积分为$2 pi$，有
$
  R_3 prop integral (4 pi p_1^2 dd(p_1) 2 pi p_2^2 dd(p_2) dd(cos theta_(12)))/(E_1 E_2 E_3)
  delta(E_1+E_2+E_3-M)
$
动量守恒给出
$
       vb(p)_3 & =-vb(p)_1-vb(p)_2 \
         p_3^2 & =p_1^2+p_2^2+2p_1p_2 cos theta_(12) \
  2p_3 dd(p_3) & =2p_1p_2 dd(cos theta_(12))
$
故
$
  R_3 prop integral (p_1 dd(p_1) p_2 dd(p_2) p_3 dd(p_3))/(E_1 E_2 E_3)
  delta(E_1+E_2+E_3-M)
$
利用$p_i dd(p_i)=E_i dd(E_i)$，得到
$
  R_3 & prop integral dd(E_1) dd(E_2) dd(E_3) delta(E_1+E_2+E_3-M) \
      & prop integral dd(E_1) dd(E_2)
        prop integral dd(m_(23)^2) dd(m_(13)^2)
        prop integral dd(T_1) dd(T_2)
$
这说明纯相空间因子在所选Dalitz平面上为常数。

// 源讲义第31页。
=== 运动学允许区域与事例密度

#figure(
  image("pic/ch4/dalitz-pdg2006.png", width: 83%),
  caption: [PDG 2006的三体Dalitz图实例，末态为总能量$3 "GeV"$的$pi^+ overline(K)^0p$。W.-M. Yao et al., J. Phys. G33 (2006) 1],
)

图中四动量守恒将事例限制在阴影区域。坐标的总范围为
$
  (m_1+m_2)^2 <= m_(12)^2 <= (M-m_3)^2, quad
  (m_2+m_3)^2 <= m_(23)^2 <= (M-m_1)^2
$
但两个坐标不能在上述矩形内任意独立取值。对每个固定的$m_(12)^2$，允许区由$(m_(23)^2)_(min)$和$(m_(23)^2)_(max)$两条边界限制。

#note(subname: [图示边界的显式运动学公式])[
  为将图中的边界条件写出，令$s_(12)=m_(12)^2$，在粒子1、2的两体静止系中定义
  $
    E_2^ast=(s_(12)-m_1^2+m_2^2)/(2sqrt(s_(12))), quad
    E_3^ast=(M^2-s_(12)-m_3^2)/(2sqrt(s_(12)))
  $
  以及$p_2^ast=sqrt((E_2^ast)^2-m_2^2)$、$p_3^ast=sqrt((E_3^ast)^2-m_3^2)$。由$-1<=cos theta_(23)^ast<=1$，
  $
    (m_(23)^2)_(min) & =(E_2^ast+E_3^ast)^2-(p_2^ast+p_3^ast)^2 \
    (m_(23)^2)_(max) & =(E_2^ast+E_3^ast)^2-(p_2^ast-p_3^ast)^2
  $
  定义$lambda(a, b, c)=a^2+b^2+c^2-2a b-2a c-2b c$，也可写成
  $
               A(s_(12)) & =(s_(12)-m_1^2+m_2^2)(M^2-s_(12)-m_3^2) \
               B(s_(12)) & =sqrt(lambda(s_(12), m_1^2, m_2^2))sqrt(lambda(M^2, s_(12), m_3^2)) \
    (m_(23)^2)_(min,max) & =m_2^2+m_3^2+(A(s_(12)) minus.plus B(s_(12)))/(2s_(12))
  $
  上、下两符号依次对应最小值、最大值。
]

实验中每个事例对应Dalitz图上的一个点。图上点的密度分布直接反映衰变或到三体末态的反应机制，因为运动学允许区内的相空间面积密度为常数，剩余结构来自跃迁矩阵元的模平方。

// 源讲义第32页。
=== 三$pi$末态的三角形表示

对$K -> 3pi$，在三个$pi$质量均取$m$时，反应$Q$值为
$
  Q=M-3m=T_1+T_2+T_3
$
构造高为$Q$的等边三角形，三角形内任意一点到三条边的距离分别为$T_1,T_2,T_3$。动量守恒进一步将物理末态限制在图中的弧圈内。

#figure(
  image("pic/ch4/dalitz-three-pion-triangle.png", width: 35%),
  caption: [三$pi$Dalitz图的等边三角形表示，三个动能为到相应边的距离],
)

建立图示直角坐标系，该点的坐标为
$
  x=(T_3-T_2)/sqrt(3)=(Q-T_1-2T_2)/sqrt(3), quad y=T_1
$
于是$dd(x) dd(y) prop dd(T_1) dd(T_2)$。

// 讲义标注R. H. Dalitz（1953），并列出图示资料地址#link("http://jpac.nucleares.unam.mx/Resources/LonderganDalitzPlot.pdf")[Londergan，Dalitz Plot]。

== 三$pi$系统的自旋、宇称和同位旋

=== 从振幅到Dalitz图 <three-pion-dalitz-guide>

每次衰变在Dalitz图上留下一个点：两个坐标指定两个独立能量，第三个由能量守恒确定。*点的位置表示能量如何分配，点的密度表示这种分配有多常见。* 对整体取向积分、母粒子自旋取非极化平均后，理想分布满足
$
  rho(E_1, E_2) equiv (upright(d)^2 N)/(dd(E_1)dd(E_2))
  prop overline(abs(cal(M))^2)
$
相空间在这两个坐标中均匀，边界由运动学决定，区内的疏密则反映振幅。实际数据还须校正探测效率。#footnote[PDG，#link("https://pdg.lbl.gov/2025/reviews/rpp2025-rev-kinematics.pdf")[Kinematics，三体衰变的Dalitz分布]。]

*振幅$A$不是事例数。* $J=0$时，所列$A$可以直接作为标量振幅；$J=1$各式中的矢量形式$A$简记约化空间结构$vb(a)$，完整振幅还须同自旋极化矢量收缩。在母粒子静止系，
$
  cal(M)_lambda=vb(epsilon)_lambda dot vb(a), quad
  overline(abs(cal(M))^2)=1/3 sum_(lambda=1)^3 abs(cal(M)_lambda)^2
  =abs(vb(a))^2/3
$
因此看图时应看标量振幅的模平方，或约化矢量的模平方，而不是矢量某个分量的正负。$vb(q)=vb(p)_1 times vb(p)_2$虽为宇称偶的轴矢量，三个$pi$的内禀宇称之积为$-1$，故其对应三$pi$态仍为$J^P=1^-$。#footnote[JPAC，#link("https://www.jpac-physics.org/projects/omega-3pi")[$omega,phi -> 3pi$的振幅与非极化分布]。]

*最快的读图方法是先找振幅的零因子。* 按下面列出的低阶结构、在等质量$pi$近似下：
#figure(
  three-line-table[
    | 组态 | 振幅中的因子 | Dalitz图上的零密度位置 |
    | --- | --- | --- |
    | $I=0,J^P=0^-$ | $(E_1-E_2)(E_2-E_3)(E_3-E_1)$ | 三条$E_i=E_j$直线，分出六个区域 |
    | $I=0,J^P=1^-$ | $vb(q)$ | 动量共线的物理边界 |
    | $I=1,J^P=1^-$ | $vb(q)(E_1-E_2)$ | 物理边界及$E_1=E_2$直线 |
  ],
  caption: [由振幅节点判断Dalitz分布],
)

后面六图中的粗线和黑点表示振幅节点，在理想分布中对应零密度位置。

六幅图展示的是符合对称性的低阶代表。更高阶能量因子、中间共振和末态相互作用还会改变疏密；*对称性规定允许的结构与节点，具体动力学决定完整图形*。

// 源讲义第33–35页。
=== 三体末态量子数与跃迁矩阵元

$K,eta,omega$都可以衰变到三个$pi$介子。末态的三$pi$系统具有确定的自旋、宇称和同位旋。衰变矩阵元的对称性条件导致Dalitz图上的特定分布模式，可以据此确定末态量子数。*总角动量始终守恒，宇称和同位旋是否守恒则取决于相互作用*：
- $omega$强衰变，所有相关量子数守恒。
- $eta -> 3pi$主要来自$m_d-m_u$引起的强同位旋破缺，宇称守恒。
- $K$弱衰变，同位旋及其三分量、宇称不守恒。

介子衰变为三个$pi$的矩阵元是Lorentz不变量，在质心系可以约化为三维不变量。其构造受到同位旋、自旋、宇称和Bose统计的限制。用三维协变量构造标量、赝标量、矢量和轴矢量。

#figure(
  image("pic/ch4/three-pion-angular-momenta.png", width: 42%),
  caption: [三个末态动量及两个相对轨道角动量$l_(12),l_3$],
)

动量守恒为$vb(p)_1+vb(p)_2+vb(p)_3=0$。可用的矢量为
$
  vb(p)_1,quad vb(p)_2,quad vb(p)_3
$
轴矢量为
$
  vb(q)=vb(p)_1 times vb(p)_2
  =vb(p)_2 times vb(p)_3=vb(p)_3 times vb(p)_1
$
标量包括常数以及$E_1,E_2,E_3$，并有$E_1+E_2+E_3=M$。

// 源讲义第36–38页。
=== 总同位旋与总角动量

三个$pi$的总同位旋可以为$0,1,2,3$。对于这里讨论的低质量介子，只取$I=0,1$两种情形。气泡室实验中只能观测三个都带电，或两个带电、一个中性的三$pi$末态，列出的电荷组态为
$
            I=1 & : quad pi^+pi^+pi^-,quad pi^+pi^-pi^- \
  I=0 "（或1）" & : quad pi^+pi^-pi^0
$
任选两个粒子$pi_1,pi_2$，其总同位旋记为$I_(12)=0,1,2$，另一个粒子$pi_3$有$I_3=1$。以耦合记号写作
$
  vb(I)=vb(I)_(12) ⊗ vb(I)_3
$
令$pi_1,pi_2$质心系轨道角动量为$l_(12)$，令$l_3$为$pi_3$相对$pi_1pi_2$系统的轨道角动量。三个$pi$的总角动量写作
$
  vb(J)=vb(l)_(12) ⊗ vb(l)_3
$
#block(breakable: false)[
  #note(subname: [角动量耦合记号])[
    这里的$⊗$表示两个角动量表示的耦合。作为算符的总角动量是$vb(J)=vb(l)_(12)+vb(l)_3$，同位旋同理。
  ]
]
三$pi$系统不能处于$J^P=0^+$态，因为
$
  J=0 arrow.r l_(12)=l_3, quad
  P=(-1)^3(-1)^(l_(12))(-1)^(l_3)=-1
$
在只取$J=0,1$的讨论范围内，总共考虑六种组态，即$I=0,1$各配$J^P=0^-,1^-,1^+$。三个$pi$自旋都是0，内禀宇称之积为$-1$，所以相应轨道运动部分的宇称与三$pi$总宇称相反，轨道角动量宇称记作$J^(-P)$。对每种同位旋，跃迁矩阵元须满足交换两个$pi$所需的对称性质，与空间波函数的交换对称性相同。

// 源讲义第39页。
=== 总同位旋$I=0$

电荷组态为$pi^+pi^-pi^0$，取$pi_3=pi^0$。

此时$I_(12)=1$，跃迁矩阵元完全反对称，任意交换两个$pi$，矩阵元变号。三种角动量、宇称下的结构如下
$
  J^P=0^- & : quad A prop (E_1-E_2)(E_2-E_3)(E_3-E_1) \
  J^P=1^- & : quad A prop vb(q) \
  J^P=1^+ & : quad A prop vb(p)_1(E_2-E_3)
            +vb(p)_2(E_3-E_1)+vb(p)_3(E_1-E_2)
$

#figure(
  image("pic/ch4/dalitz-I0-patterns.png", width: 100%),
  caption: [$I=0$的三种Dalitz图模式],
)

// 源讲义第40–41页。
=== 总同位旋$I=1$

若电荷组态为$pi^+pi^+pi^-$或$pi^-pi^-pi^+$，取$pi_3$为电荷不同的那个粒子，跃迁矩阵元在$1 arrow.l.r 2$交换下不变。

若电荷组态为$pi^+pi^-pi^0$，取$pi_3=pi^0$。此时$I_(12)=1$被禁止，因为相应耦合为
$
  ket(I_(12)","I_(12,z))=ket(1","0), quad
  ket(I_3","I_(3,z))=ket(1","0), quad
  ket(I","I_z)=ket(1","0)
$
而相应Clebsch–Gordan系数为0。因此$I_(12)=0$或2，在$1 arrow.l.r 2$交换下对称。两类电荷组态的跃迁矩阵元都在$1 arrow.l.r 2$下对称。

结构为
$
  J^P=0^- & : quad A prop "const", quad A prop E_3 \
  J^P=1^- & : quad A prop vb(q)(E_1-E_2) \
  J^P=1^+ & : quad A prop vb(p)_1+vb(p)_2=-vb(p)_3
$

#figure(
  image("pic/ch4/dalitz-I1-patterns.png", width: 100%),
  caption: [$I=1$的三种Dalitz图模式],
)

== 赝标和矢量介子

// 源讲义第42–43页。数值沿用源表。
=== 两类低自旋介子

赝标介子的自旋宇称为$J^P=0^-$，矢量介子的自旋宇称为$J^P=1^-$。粒子、同位旋及质量如下。

#let ch4-pseudoscalar-table = three-line-table[
  | 粒子 | $I$ | $I_3$ | $S$ | 质量（MeV） |
  | --- | --- | --- | --- | --- |
  | $pi^+$ | $1$ | $1$ | $0$ | $139.57018$ |
  | $pi^0$ | $1$ | $0$ | $0$ | $135.9766$ |
  | $pi^-$ | $1$ | $-1$ | $0$ | $139.57018$ |
  | $K^+$ | $1/2$ | $1/2$ | $1$ | $493.677$ |
  | $K^0$ | $1/2$ | $-1/2$ | $1$ | $497.648$ |
  | $overline(K)^0$ | $1/2$ | $1/2$ | $-1$ | $497.648$ |
  | $K^-$ | $1/2$ | $-1/2$ | $-1$ | $493.677$ |
  | $eta$ | $0$ | $0$ | $0$ | $547.75$ |
  | $eta'$ | $0$ | $0$ | $0$ | $957.78$ |
]
#figure(ch4-pseudoscalar-table, caption: [$J^P=0^-$赝标介子表])

#let ch4-vector-table = three-line-table[
  | 粒子 | $I$ | $I_3$ | $S$ | 质量（MeV） |
  | --- | --- | --- | --- | --- |
  | $rho^+$ | $1$ | $1$ | $0$ | $775.8$ |
  | $rho^0$ | $1$ | $0$ | $0$ | $775.8$ |
  | $rho^-$ | $1$ | $-1$ | $0$ | $775.8$ |
  | $K^(ast +)$ | $1/2$ | $1/2$ | $1$ | $891.66$ |
  | $K^(ast 0)$ | $1/2$ | $-1/2$ | $1$ | $896.10$ |
  | $overline(K)^(ast 0)$ | $1/2$ | $1/2$ | $-1$ | $896.10$ |
  | $K^(ast -)$ | $1/2$ | $-1/2$ | $-1$ | $891.66$ |
  | $omega$ | $0$ | $0$ | $0$ | $782.59$ |
  | $phi$ | $0$ | $0$ | $0$ | $1019.456$ |
]
#figure(ch4-vector-table, caption: [$J^P=1^-$矢量介子表])

// 源讲义第44–47页。
=== 带电$K$介子与$theta$–$tau$疑难

1950年代，宇宙线研究发现一些质量和寿命相同的奇异粒子。当时按衰变模式分别命名，$theta$衰变到两个$pi$，$tau$衰变到三个$pi$，$kappa$用于其他衰变模式。进一步的宇宙线实验和加速器实验证实，这些粒子质量相同。

// #figure(
//   image("pic/ch4/kaon-historical-names.png", width: 83%),
//   caption: [旧名称与现名称对照，圈出$K$的二$pi$和三$pi$衰变],
// )

// 原表的全部对应关系为
#figure(
  three-line-table[
    | 旧名称 | 现名称与衰变模式 |
    | --- | --- |
    | $tau$ | $K_(pi 3)$，$K^+ -> pi^+pi^+pi^-$ |
    | $V_1^0$ | $Lambda^0 -> p pi^-$ |
    | $V_2^0(theta^0)$ | $K_S^0 -> pi^+pi^-$ |
    | $kappa$ | $K_(mu 2)$，$K^+ -> mu^+nu_mu$ |
    | 同属$kappa$所列模式 | $K_(mu 3)$，$K^+ -> mu^+pi^0nu_mu$ |
    | $chi(theta^+)$ | $K_(pi 2)$，$K^+ -> pi^+pi^0$ |
    | $V^+,Lambda^+$ | $Sigma^+ -> p pi^0,n pi^+$ |
  ],
  caption: [旧粒子名称和相应衰变模式],
)

下面是220个$tau -> 3pi$事例的Dalitz图。

#figure(
  image("pic/ch4/tau-three-pion-dalitz.png", width: 33%),
  caption: [220个$tau$三$pi$衰变事例的Dalitz图],
)

与上一节各分布图比较，得到三$pi$末态$I=1$、$J^P=0^-$。然而$theta$衰变到两个$pi$，如果$J=0$，则两体相对轨道角动量$l=0$，宇称为
$
  P=P_pi^2(-1)^l=+1
$
同质量、同寿命的粒子为何分别表现为$0^-$和$0^+$，形成了*$theta$–$tau$疑难*。

对这个谜的可能解释是宇称不守恒。李政道、杨振宁指出，宇称守恒在弱相互作用中尚未得到验证，并建议通过实验检查。

// #figure(
//   image("pic/ch4/cobalt60-parity.png", width: 69%),
//   caption: [讲义的极化$""^60"Co"$衰变示意，比较镜像反演与实际电子发射分布，两个方向的电子数不同],
// )

// #figure(
//   image("pic/ch4/yang-lee-photo.png", width: 75%),
//   caption: [杨振宁（1922—2025）与李政道（1926—2024）。讲义标注二人为1957年诺贝尔物理学奖获得者，提出弱相互作用下宇称不守恒],
// )

// 源讲义第48–49页。
=== $eta$和$eta'$的量子数

$eta$于1961年发现
$
  pi^++d -> pi^++pi^-+pi^0+p+p
$

#figure(
  image("pic/ch4/eta-discovery-mass-marked.png", width: 30%),
  caption: [233个事例中的三$pi$不变质量分布，圈出$eta$峰。横轴为$M(pi^+pi^-pi^0)$（MeV）],
)

没有找到带电的$eta$粒子，因而确定其同位旋为$I=0$。有
$
  m_eta=548 "MeV", quad Gamma_eta=1.3 "keV"
$
以及$eta -> gamma gamma$分支比
$
     Gamma(eta -> gamma gamma)/Gamma_("tot") & =39.4% \
  Gamma(eta -> pi^++pi^-+pi^0)/Gamma_("tot") & =28%
$

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    image("pic/ch4/eta-dalitz.png", width: 50%), image("pic/ch4/eta-radial-density.png", width: 80%),
  ),
  caption: [$eta -> pi^+pi^-pi^0$的Dalitz图及单位面积事例数随半径的分布，原始分区与数据点保持不变],
)

与上一节各模式比较，三$pi$末态为$I=1$、$J^P=0^-$。*电磁衰变*，$I$不守恒，但三分量守恒，宇称守恒。因此初态$eta$的$I=0$与末态三$pi$的$I=1$须明确区分。


#note(subname: [$eta -> 3pi$的同位旋破缺机制])[
  现代描述中，$eta -> 3pi$主要由轻夸克质量差$m_d-m_u$引起的QCD同位旋破缺产生，电磁贡献受到Sutherland定理的抑制。#footnote[参见G. Colangelo et al., “Dispersion relation analysis of $eta -> 3pi$”, Eur. Phys. J. C78 (2018) 947，第9.1节，#link("https://link.springer.com/article/10.1140/epjc/s10052-018-6377-9")[doi:10.1140/epjc/s10052-018-6377-9]。]
]

$eta'$于1964年发现，与$eta$的量子数相同。给出
$
  m_(eta')=958 "MeV", quad Gamma_(eta')=0.2 "MeV"
$

// 源讲义第50–51页。
=== $omega$的量子数

$omega$于1961年发现，反应为
$
  overline(p)+p -> pi^++pi^++pi^0+pi^-+pi^-
$
每个五$pi$事例可取出四个电中性的三$pi$组态，四个单位电荷的三$pi$组态，以及两个双电荷的三$pi$组态。

#figure(
  image("pic/ch4/omega-discovery-mass.png", width: 58%),
  caption: [不同电荷三$pi$组合的不变质量分布，原图分为(A)、(B)、(C)三组，只有电中性组合出现$omega$峰],
)

仅存在电中性的$omega$，所以$I=0$。质量和宽度为
$
  m_omega=782 "MeV", quad Gamma_omega=8 "MeV"
$
取质量峰区域中的中性三$pi$组合，得到以下Dalitz图和径向分布。

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    image("pic/ch4/omega-dalitz.png", width: 80%), image("pic/ch4/omega-radial-density.png", width: 100%),
  ),
  caption: [$omega$质量峰区域的中性三$pi$Dalitz图及事例数随半径的分布，右图同时给出$J^P=1^-$预期和背景],
)

与前述模式比较，得到$I=0$、$J^P=1^-$，故$omega$是矢量介子。

// // 源讲义第52页。
// === 其他$J^P=1^-$矢量介子

// #figure(
//   three-line-table[
//     | 粒子 | $I$ | $I_3$ | $S$ | 质量（MeV） | 宽度（MeV） |
//     | --- | --- | --- | --- | --- | --- |
//     | $rho^+$ | $1$ | $1$ | $0$ | $775.8$ | $approx 150$ |
//     | $rho^0$ | $1$ | $0$ | $0$ | $775.8$ | $approx 150$ |
//     | $rho^-$ | $1$ | $-1$ | $0$ | $775.8$ | $approx 150$ |
//     | $K^(ast +)$ | $1/2$ | $1/2$ | $1$ | $891.66$ | $approx 50$ |
//     | $K^(ast 0)$ | $1/2$ | $-1/2$ | $1$ | $896.10$ | $approx 50$ |
//     | $overline(K)^(ast 0)$ | $1/2$ | $1/2$ | $-1$ | $896.10$ | $approx 50$ |
//     | $K^(ast -)$ | $1/2$ | $-1/2$ | $-1$ | $891.66$ | $approx 50$ |
//     | $omega$ | $0$ | $0$ | $0$ | $782.59$ | $approx 8$ |
//     | $phi$ | $0$ | $0$ | $0$ | $1019.456$ | $4.3$ |
//   ],
//   caption: [讲义列出的矢量介子质量和宽度],
// )

== 更高对称性的寻找

// 源讲义第53–55页，保留再次汇集的分类数值表。
=== 不稳定强子的分类

实验发现了许多不稳定强子。重新将它们按介子和重子、自旋宇称分类，寻找能统一这些粒子的规律。

#figure(ch4-pseudoscalar-table, caption: [介子分类，$J^P=0^-$])
#figure(ch4-vector-table, caption: [介子分类，$J^P=1^-$])

#figure(
  three-line-table[
    | 粒子 | $I$ | $I_3$ | $S$ | 质量（MeV） |
    | --- | --- | --- | --- | --- |
    | $p$ | $1/2$ | $1/2$ | $0$ | $938.27203$ |
    | $n$ | $1/2$ | $-1/2$ | $0$ | $939.56536$ |
    | $Lambda$ | $0$ | $0$ | $-1$ | $1115.683$ |
    | $Sigma^+$ | $1$ | $1$ | $-1$ | $1189.37$ |
    | $Sigma^0$ | $1$ | $0$ | $-1$ | $1192.642$ |
    | $Sigma^-$ | $1$ | $-1$ | $-1$ | $1197.449$ |
    | $Xi^0$ | $1/2$ | $1/2$ | $-2$ | $1314.83$ |
    | $Xi^-$ | $1/2$ | $-1/2$ | $-2$ | $1321.31$ |
  ],
  caption: [重子分类，$J^P=(1/2)^+$],
)

#figure(
  three-line-table[
    | 粒子 | $I$ | $I_3$ | $S$ | 质量（MeV） |
    | --- | --- | --- | --- | --- |
    | $Delta^(++)$ | $3/2$ | $3/2$ | $0$ | $approx 1232$ |
    | $Delta^+$ | $3/2$ | $1/2$ | $0$ | $approx 1232$ |
    | $Delta^0$ | $3/2$ | $-1/2$ | $0$ | $approx 1232$ |
    | $Delta^-$ | $3/2$ | $-3/2$ | $0$ | $approx 1232$ |
    | $Sigma(1385)^+$ | $1$ | $1$ | $-1$ | $1382.8$ |
    | $Sigma(1385)^0$ | $1$ | $0$ | $-1$ | $1383.7$ |
    | $Sigma(1385)^-$ | $1$ | $-1$ | $-1$ | $1387.2$ |
    | $Xi(1530)^0$ | $1/2$ | $1/2$ | $-2$ | $1531.80$ |
    | $Xi(1530)^-$ | $1/2$ | $-1/2$ | $-2$ | $1535.0$ |
  ],
  caption: [重子分类，$J^P=(3/2)^+$],
)

// 源讲义第56页。
// === 从已知守恒量出发

这些粒子都是基本粒子吗，是否存在一个强子的“元素周期表”？强相互作用过程中，同位旋和奇异数守恒。等价地说，*强相互作用Hamiltonian在*
$
  "SU"(2)_("Isospin") times "U"(1)_("Strangeness")
$
*变换下不变*。能否将它扩展到更高的对称性，是本节提出的问题。

#note(subname: [群的直乘])[
  给定两个群$G',G''$，其元素分别记作$a'_k in G'$和$a''_l in G''$。定义元素
  $
    a_(k l)=(a'_k,a''_l)
  $
  并定义乘法
  $
    (a'_1,a''_1)(a'_2,a''_2)
    =(a'_1a'_2,a''_1a''_2)
  $
  就构成新群$G=G_1 times.o G_2$。
]

// 源讲义第57–58页。
=== 同位旋对称的启示

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    image("pic/ch4/baryon-threehalf-multiplets.png", width: 100%),
    image("pic/ch4/pseudoscalar-multiplets.png", width: 100%),
  ),
  caption: [$J^P=(3/2)^+$重子与赝标介子同位旋多重态],
)

每个同位旋多重态与$"SU"(2)$群的一个不可约表示对应。

- 每个不可约表示由参量$I$标志，含$2I+1$个不同分量，不同分量由$I_3$区分。
- 粒子按不可约表示分类，每个粒子或态对应不可约表示中的一个分量。
- 属于同一不可约表示的各粒子的质量、寿命、$J^P$等相同。
- 若属于一个不可约表示的某个粒子存在，则该不可约表示中的全部粒子都应存在。

#block(breakable: false)[
  #note(subname: [对称性极限])[
    上述质量、寿命等相同，是精确同位旋对称性及相应相同动力学条件下的陈述。实际多重态中可以出现同位旋破缺及可用衰变相空间不同造成的差别。
  ]
]

如果忽略不同奇异数粒子间的质量和寿命差别，可能将同位旋和奇异数放进一个更高的对称群。期望该群的每个不可约表示也能用适当参量标志，而其中各分量可以由$I,I_3,S$标识。

// 源讲义第59页是下一节SU(3)群的目录页，由下节标题承接。

#show figure: set block(breakable: true)

// 源PDF第60–123页。
== $"SU"(3)$群

=== 生成元、李代数与表示 <ch4-su3-generators>

$"SU"(3)$群有八个生成元。在基础表示中取$I_i=lambda_i/2$，$i=1,dots,8$，其中八个Gell-Mann矩阵完整写为
$
  lambda_1=mat(0, 1, 0; 1, 0, 0; 0, 0, 0),quad
  lambda_2=mat(0, -i, 0; i, 0, 0; 0, 0, 0),quad
  lambda_3=mat(1, 0, 0; 0, -1, 0; 0, 0, 0),
$
$
  lambda_4=mat(0, 0, 1; 0, 0, 0; 1, 0, 0),quad
  lambda_5=mat(0, 0, -i; 0, 0, 0; i, 0, 0),
$
$
  lambda_6=mat(0, 0, 0; 0, 0, 1; 0, 1, 0),quad
  lambda_7=mat(0, 0, 0; 0, 0, -i; 0, i, 0),quad
  lambda_8=1/sqrt(3)mat(1, 0, 0; 0, 1, 0; 0, 0, -2)
$
任何一个$"SU"(3)$群元素可以写成
$ g({xi_i})=exp(i sum_(i=1)^8 xi_i I_i). $
生成元满足对易关系（李代数）
$ [I_i,I_j]=i sum_k f_(i j k)I_k, $
其中$f_(i j k)$完全反对称，独立的非零结构常数可选为
$
  f_123=1,quad f_458=f_678=sqrt(3)/2,
$
$
  f_147=f_165=f_246=f_257=f_345=f_376=1/2.
$
满足这些对易关系的一组八个Hermitian矩阵，可以构造$"SU"(3)$群的一个表示。反对易关系为
$ {I_i,I_j}=sum_k d_(i j k)I_k+1/3 delta_(i j) bold(1), $
其中$d_(i j k)$完全对称。

// 第62–64页。
$"SU"(3)$不可约表示用两个非负整数$(lambda,mu)$描写，记作
$
  D(lambda,mu),quad lambda,mu=0,1,2,dots
$
其维数为
$
  N(lambda,mu)=1/2(lambda+1)(mu+1)(lambda+mu+2)
$
生成元$I_3$与$I_8$对易，可以同时对角化。定义
$
  Y equiv 2/sqrt(3) I_8
$
一个不可约表示的每一个分量（态）因而具有确定的$I_3$、$Y$，可以在$Y$–$I_3$图上标出，称为表示的*权图*。

=== 权图的构造与直乘分解

权图规则如下：
+ 画一个六边形，上边为$lambda$格，下边为$mu$格，各斜边按$abs((Delta Y)/(Delta I_3))=2$的斜率绘制。当$lambda=0$或$mu=0$，六边形退化为正立或倒立三角形。
+ 六边形左右对称，三个不相邻边的边长为$lambda$格，另外三个不相邻边为$mu$格。
+ 在每一对对边间画平行线，构成以三角形为基本单元的网格。每个交点代表一个态或若干简并态。
+ 坐标原点位于六边形的重心。
+ 从外向内，第一层是单态，第二层是二重态，依此类推。到某一层变成三角形后，简并度停止增加。

#figure(image("pic/ch4/source-p63-1.png", width: 46%), caption: [$D(4,1)$表示的权图])

基础表示及其共轭表示为
$
  D(1,0)=bold(3),quad D(0,1)=bold(3)^*
$
#figure(
  image("pic/ch4/source-p64-1.jpeg", width: 72%),
  caption: [$bold(3)$与$bold(3)^*$的权图，$u,d,s$及其反粒子的位置],
)
与$"SU"(2)$相似，$"SU"(3)$表示的直乘也可以通过Clebsch–Gordan系数分解为不可约表示。例如
$
  bold(3)⊗bold(3)^*=bold(1)⊕bold(8)
$
$
  bold(3)⊗bold(3)⊗bold(3)=bold(1)⊕bold(8)⊕bold(8)⊕bold(10)
$
群、表示、不可约分解的基础概念另见群论简介（@app-group）。

== 八正法（The Eightfold Way）

=== 从八维表示组织强子

1961年，Neeman和Gell-Mann提出八正法理论，用于强子分类。其要点是把同位旋与奇异数包含到更高的$"SU"(3)$对称群中。事实上$"SU"(3)$对称群在更早的理论模型中已经提出。

介子和重子属于$"SU"(3)$群的八维表示，或八维表示直乘分解得到的表示。具体有
$
  bold(8)⊗bold(8)=bold(1)⊕bold(8)⊕bold(8)⊕bold(10)⊕bold(10)^*⊕bold(27)
$
$
  D(1,1)=bold(8),quad D(3,0)=bold(10),quad
  D(0,3)=bold(10)^*,quad D(2,2)=bold(27)
$
当时发现的强子可以很好地放进这些表示。轻味分类中的超荷为$Y=B+S$。

#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p69-mesons.png", width: 100%),
    caption: [赝标与矢量介子的八重态权图，各自的中性同位旋单态还包含$D(0,0)=bold(1)$],
  )
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p70-octet.png", width: 83%),
    caption: [重子八重态及其质量层次，原图标出$N$、$Lambda$、$Sigma$、$Xi$间约167、77、122 MeV的间隔],
  )
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p70-decuplet.png", width: 83%),
    caption: [重子十重态的分类和质量层次，原图中的$Omega^-$位置在当时尚未被实验填入],
  )
]

=== $Omega^-$的预言与发现

当时只发现了九个$J=3/2$重子。八正法要求十重态还必须有第十个粒子
$
  Omega^- ,quad I=0,quad S=-3
$
$"SU"(3)$是近似对称性。若忽略同位旋对称性的破缺，不同奇异数（超荷）的粒子仍有不同质量。十维表示中的质量可以看作$Y$的函数。用已知九个重子的历史质量数据外推，可得
$
  M(Y)=a+b Y quad arrow.r quad M_(Omega^-)=1684.1 "MeV" quad ("一级近似")\
  M(Y)=a+b Y+c Y^2 quad arrow.r quad M_(Omega^-)=1678.4 "MeV" quad ("二级近似")
$
用于外推的$Delta$、$Sigma(1385)$、$Xi(1530)$数据已完整列在前面的$(3/2)^+$表中。

由于质量满足
$
  M_(Omega^-)<M_Xi+M_K,quad M_Lambda+2M_K,quad M_N+3M_K
$
这个粒子不能通过强相互作用或电磁相互作用衰变，只能通过弱相互作用衰变。其寿命远长于强衰变的典型时间尺度，属于亚稳定粒子。
#block(
  breakable: false,
)[#note[这里的“稳定”指相对于强衰变和电磁衰变寿命很长，$Omega^-$仍会弱衰变。上述阈值比较还结合奇异数守恒使用。]]

#block(breakable: false)[
  #figure(
    grid(
      columns: (1.25fr, 1fr),
      gutter: 1em,
      image("pic/ch4/source-p72-1.jpeg", width: 100%), image("pic/ch4/source-p72-2.jpeg", width: 100%),
    ),
    caption: [发现$Omega^-$的气泡室照片、径迹解释及反应链原图，PRL 12 (1964) 204],
  )
]
产生和衰变链为
$
  K^-+p -> Omega^-+K^++K^0\
  Omega^- -> Xi^0+pi^- ,quad Xi^0 -> Lambda^0+pi^0\
  Lambda^0 -> pi^-+p,quad pi^0 -> gamma_1+gamma_2,
  quad gamma_(1,2) -> e^++e^-
$

八正法确立了$"SU"(3)$对称性的分类作用，但留下一个问题。为什么介子出现$bold(1)$和$bold(8)$，重子出现$bold(8)$和$bold(10)$，而简单模型中的$bold(10)^*$和$bold(27)$没有出现？1964年的夸克模型为这个问题给出了解释。

== 夸克模型（The Quark Model）

=== 基本假设与轻夸克性质

Gell-Mann与Zweig在1964年提出夸克模型。模型用三个基本费米子$u,d,s$组成强子，它们构成味$"SU"(3)$的基础表示。介子由一对正反（价）夸克组成，重子由三个（价）夸克组成，因而
$
  bold(3)⊗bold(3)^*=bold(1)⊕bold(8)
$
$
  bold(3)⊗bold(3)⊗bold(3)=bold(1)⊕bold(8)⊕bold(8)⊕bold(10)
$
夸克模型由此解释八正法中最低强子多重态的结构。


#figure(
  image("pic/ch4/source-p75-1.png", width: 100%),
  caption: [$u,d,s$夸克的基本量子数与质量原表：表中$B$列表示bottomness，花体$cal(B)$列表示重子数],
)

夸克带分数电荷和分数重子数，实验中尚未发现自由夸克。味$"SU"(3)$对称性的含义是在忽略三种夸克质量差别后，*强相互作用*不能区分它们。三种夸克可视为同一种粒子的不同*味（flavor）状态*，以$I,I_z,Y$标志。

在味多重态的形式分类中，内部对称变换可以联系不同奇异数和电荷的基态。
#note[这句话是在味多重态分类的语境下，指群变换可以把具有不同$S$和$Q$的基态彼此联系。它不等于说物理电荷的超选择规则被消除，具体反应仍须满足适用的守恒律。]

=== 重子波函数与十重态

// 第76–81页。
重子由三个夸克通过强相互作用组成。把味自由度作为粒子内部状态考虑后，三个夸克是全同费米子，因此总波函数在交换任意两个夸克时必须反对称。不计色自由度时写成
$
  psi=phi_("flavour") chi_("spin") eta_("space")
$
这里讨论基态重子，无内部轨道角动量，即$l=0$，空间波函数对称。

在味空间中
$
  bold(3)⊗bold(3)⊗bold(3)=bold(1)⊕bold(8)⊕bold(8)⊕bold(10)
$
一维表示的基*全反对称*，$(I_3,Y)=(0,0)$的态为
$
  ket(I\,I_3\,Y) = ket(0\,0\,0) = phi_A=1/sqrt(6)(u d s-u s d+s u d-s d u+d s u-d u s)
$
取
$
  u = ket(1/2\,1/2\,1/3),quad d = ket(1/2\,-1/2\,1/3),quad s = ket(0\,0\,-2/3)
$
十维表示的基*全对称*，用$[q_1 q_2 q_3]_S$表示，例如
$
  [u u u]_S & =u u u \
  [u u d]_S & =1/sqrt(3)(u u d+u d u+d u u) \
  [u d s]_S & =1/sqrt(6)(u d s+u s d+d s u+d u s+s u d+s d u)
$
十个基态的位置完整为
$
  ket(3/2\,-3/2\,1)=[d d d]_S,quad ket(3/2\,-1/2\,1)=[d d u]_S,quad ket(3/2\,1/2\,1)=[d u u]_S,quad ket(3/2\,3/2\,1)=[u u u]_S\
  ket(1\,-1\,0)=[d d s]_S,quad ket(1\,0\,0)=[d u s]_S,quad ket(1\,1\,0)=[u u s]_S\
  ket(1/2\,-1/2\,-1)=[d s s]_S,quad ket(1/2\,1/2\,-1)=[u s s]_S\
  quad ket(0\,0\,-2)=[s s s]_S
$
它们依次对应$Delta^-,Delta^0,Delta^+,Delta^(++)$，$Sigma^(*-),Sigma^(*0),Sigma^(*+)$，$Xi^(*-),Xi^(*0)$和$Omega^-$。

#figure(image("pic/ch4/source-p78-2.png", width: 65%), caption: [重子十重态原始权图，质量数据见前述完整$3/2^+$表])

实验发现这些重子的自旋为$3/2$。若夸克自旋为$1/2$，其自旋波函数必须为
$
     ket(3/2","3/2) & =↑↑↑ \
     ket(3/2","1/2) & =1/sqrt(3)(↑↑↓+↑↓↑+↓↑↑) \
  ket(3/2", " -1/2) & =1/sqrt(3)(↑↓↓+↓↑↓+↓↓↑) \
  ket(3/2", " -3/2) & =↓↓↓
$
自旋波函数也*全对称*。*味、自旋和基态空间波函数都对称*，无法满足*总波函数反对称*，因而必须引入味、自旋之外的*色自由度*。

引入色$"SU"(3)_C$后，夸克处于基础表示，三个色态记为$R,G,B$。对于重子
$
  bold(3)⊗bold(3)⊗bold(3)=bold(1)⊕bold(8)⊕bold(8)⊕bold(10)
$
其中一维表示*全反对称*
$
  xi_("colour")=1/sqrt(6)(R G B-R B G+B R G-B G R+G B R-G R B)
$
若*假定强子总处于色单态*（一维表示），也称为*色禁闭*，即不把带净色荷的态作为可独立存在的强子，十重态重子的自旋—统计问题便得到解决。

考虑*色自由度*后，重子总波函数为
$
  psi=phi_("flavour") chi_("spin") xi_("colour") eta_("space")
$
色单态的$xi_("colour")$全反对称，基态的$eta_("space")$对称，因此
$
  xi_("colour") eta_("space") quad "反对称",quad quad
  phi_("flavour") chi_("spin") quad "对称"
$
在这些基态条件下，是否存在味$"SU"(3)$单态的重子？
#note[在当前三个自旋$1/2$夸克、空间基态、颜色单态的条件下，味单态全反对称，需要全反对称的自旋波函数配对才使味—自旋对称。但三个二维自旋空间的全反对称部分$∧^3 bb(C)^2$为零，因此本节的基态构造*不含味单态重子*。]

=== 重子八重态的混合对称基

// 第82–84页。
色禁闭要求三个夸克的*色波函数全反对称*，八重态重子的“味＋自旋”波函数必须*全对称*。自旋$"SU"(2)$的分解为
$
  (bold(2)⊗bold(2))⊗bold(2)
  =(bold(3)⊕bold(1))⊗bold(2)
  =(bold(3)⊗bold(2))⊕(bold(1)⊗bold(2))
  =bold(4)⊕bold(2)⊕bold(2)
$
两个*二维表示具有混合对称性*。按前两个夸克的交换对称性，选取
$
  chi_(M,S)^(+) & =1/sqrt(6)(↑↓↑+↓↑↑-2↑↑↓) \
  chi_(M,S)^(-) & =1/sqrt(6)(-↑↓↓-↓↑↓+2↓↓↑) \
  chi_(M,A)^(+) & =1/sqrt(2)(↑↓↑-↓↑↑) \
  chi_(M,A)^(-) & =1/sqrt(2)(↑↓↓-↓↑↓)
$
这里上标$+$、$-$分别标记$J_z=1/2,-1/2$，$M,S$和$M,A$表示对前两粒子交换对称、反对称的混合基。

味空间中两个八维表示也具有混合对称性。下面列出$(I_3,Y)$与两组基，$Sigma^0$和$Lambda$具有相同$(I_3,Y)=(0,0)$，另用$I$区分。

// #figure(
//   table(
//     columns: (auto, 1fr),
//     align: (left, left),
//     inset: 6pt,
//     [$h$与$(I_3,Y)$], [$phi_(M,S)$],
//     [$p,(1/2,1)$], [$1/sqrt(6)[(u d+d u)u-2u u d]$],
//     [$n,(-1/2,1)$], [$1/sqrt(6)[(u d+d u)d-2d d u]$],
//     [$Sigma^+,(1,0)$], [$1/sqrt(6)[(u s+s u)u-2u u s]$],
//     [$Sigma^0,(0,0)$], [$1/sqrt(6)[s (d u+u d)/sqrt(2)+(d s u+u s d)/sqrt(2)-2(d u+u d)/sqrt(2) s]$],
//     [$Sigma^-,(-1,0)$], [$1/sqrt(6)[(d s+s d)d-2d d s]$],
//     [$Lambda,(0,0)$], [$1/sqrt(2)[(d s u-u s d)/sqrt(2)+(s d u-s u d)/sqrt(2)]$],
//     [$Xi^0,(1/2,-1)$], [$-1/sqrt(6)[(u s+s u)s-2s s u]$],
//     [$Xi^-,(-1/2,-1)$], [$-1/sqrt(6)[(d s+s d)s-2s s d]$],
//   ),
//   caption: [混合味基，第一组$phi_(M,S)$],
// )

// #figure(
//   table(
//     columns: (auto, 1fr),
//     align: (left, left),
//     inset: 6pt,
//     [$h$与$(I_3,Y)$], [$phi_(M,A)$],
//     [$p,(1/2,1)$], [$1/sqrt(2)(u d-d u)u$],
//     [$n,(-1/2,1)$], [$1/sqrt(2)(u d-d u)d$],
//     [$Sigma^+,(1,0)$], [$1/sqrt(2)(u s-s u)u$],
//     [$Sigma^0,(0,0)$], [$1/sqrt(2)((d s u+u s d)/sqrt(2)-(s u d+s d u)/sqrt(2))$],
//     [$Sigma^-,(-1,0)$], [$1/sqrt(2)(d s-s d)d$],
//     [$Lambda,(0,0)$], [$1/sqrt(6)((s d u-s u d)/sqrt(2)+(u s d-d s u)/sqrt(2)-2(d u s-u d s)/sqrt(2))$],
//     [$Xi^0,(1/2,-1)$], [$-1/sqrt(2)(d s-s d)s$],
//     [$Xi^-,(-1/2,-1)$], [$-1/sqrt(2)(u s-s u)s$],
//   ),
//   caption: [混合味基，第二组$phi_(M,A)$],
// )

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    align: (left, left, left),
    inset: 6pt,
    stroke: none,
    table.hline(),
    [$ket(I\,I_3\,Y)$], [$phi_(M,S)$], [$phi_(M,A)$],
    table.hline(),
    [$p$ $ket(1/2\,1/2\,1)$], [$1/sqrt(6)[(u d+d u)u-2u u d]$], [$1/sqrt(2)(u d-d u)u$],
    [$n$ $ket(1/2\,-1/2\,1)$], [$1/sqrt(6)[(u d+d u)d-2d d u]$], [$1/sqrt(2)(u d-d u)d$],
    [$Sigma^+$ $ket(1\,1\,0)$], [$1/sqrt(6)[(u s+s u)u-2u u s]$], [$1/sqrt(2)(u s-s u)u$],
    [$Sigma^0$ $ket(1\,0\,0)$],
    [$1/sqrt(6)[s (d u+u d)/sqrt(2)+(d s u+u s d)/sqrt(2)-2(d u+u d)/sqrt(2) s]$],
    [$1/sqrt(2)((d s u+u s d)/sqrt(2)-(s u d+s d u)/sqrt(2))$],
    [$Sigma^-$ $ket(1\,-1\,0)$], [$1/sqrt(6)[(d s+s d)d-2d d s]$], [$1/sqrt(2)(d s-s d)d$],
    [$Lambda$ $ket(0\,0\,0)$],
    [$1/sqrt(2)[(d s u-u s d)/sqrt(2)+(s d u-s u d)/sqrt(2)]$],
    [$1/sqrt(6)((s d u-s u d)/sqrt(2)+(u s d-d s u)/sqrt(2)-2(d u s-u d s)/sqrt(2))$],
    [$Xi^0$ $ket(1/2\,1/2\,-1)$ ], [$-1/sqrt(6)[(u s+s u)s-2s s u]$], [$-1/sqrt(2)(u s-s u)s$],
    [$Xi^-$ $ket(1/2\,-1/2\,-1)$], [$-1/sqrt(6)[(d s+s d)s-2s s d]$], [$-1/sqrt(2)(d s-s d)s$],
    table.hline(),
  ),
  caption: [重子八重态的混合味基],
)

$Sigma^0$两基展开后为
$
  phi_(M,S) (Sigma^0)=(d s u+u s d+s d u+s u d-2d u s-2u d s)/sqrt(12)\
  phi_(M,A) (Sigma^0)=(d s u+u s d-s d u-s u d)/2
$
这也便于直接检查归一化和前两粒子的交换性质。
#note(subname: [混合基的相位与耦合系数])[
  味基的相位要与自旋混合基和耦合系数配套。下式的加号组合适用于随后给出的质子例子。按当前表中$n$的两列定义及同一组$chi_(M,S),chi_(M,A)$，由质子作$u↔d$得到中子时，$phi_(M,S)$变成表中$n$的$phi_(M,S)$，而$phi_(M,A)$变成表中$n$的$-phi_(M,A)$，因此应配相对减号。原表列出的交换性质和各行相位保留，但不能把不配套的相位定义直接代入同一个加号公式。
]
#newpara()

在“味＋自旋”空间中组合出的全对称态是
$
  1/sqrt(2)(phi_(M,S) chi_(M,S)+phi_(M,A) chi_(M,A))
$
以自旋向上的质子为例，逐步展开为
$
  ket(p↑) & =1/sqrt(2) lr(
              (
                1/sqrt(6)[(u d+d u)u-2u u d]
                1/sqrt(6)(↑↓↑+↓↑↑-2↑↑↓)
              )
            ) \
          & quad +1/sqrt(2) lr((1/sqrt(2)(u d-d u)u 1/sqrt(2)(↑↓↑-↓↑↑)))
$
整理相同的味排列得到
$
  ket(p↑) & =-1/sqrt(18) lr((u u d(↑↓↑+↓↑↑-2↑↑↓))) \
          & quad -1/sqrt(18) lr((u d u(↑↑↓+↓↑↑-2↑↓↑))) \
          & quad -1/sqrt(18) lr((d u u(↑↓↑+↑↑↓-2↓↑↑)))
$
逐个夸克附上自旋后，也可写作
$
  ket(p↑)=-1/sqrt(18)(u↑u↓d↑+u↓u↑d↑-2u↑u↑d↓+"permutations")
$
其中permutations表示同时排列味和自旋标签，使三个味位置$u u d$、$u d u$、$d u u$均包括在内。其九项完全展开为
$
  ket(p↑) & =-1/sqrt(18)(u↑u↓d↑+u↓u↑d↑-2u↑u↑d↓) \
          & quad -1/sqrt(18)(u↑d↑u↓+u↓d↑u↑-2u↑d↓u↑) \
          & quad -1/sqrt(18)(d↑u↑u↓+d↑u↓u↑-2d↓u↑u↑)
$

#figure(image("pic/ch4/source-p84-1.png", width: 62%), caption: [重子八重态的原始权图])


=== 正反夸克系统与介子波函数

// 第85–87页。
正反夸克系统在*色空间*中满足
$
  bold(3)⊗bold(3)^*=bold(1)⊕bold(8)
$
色禁闭要求系统处于*色单态*，其色波函数为
$
  xi_1=1/sqrt(3)(R overline(R)+G overline(G)+B overline(B))
$
*味空间*具有同样的直乘分解。
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p85-flavour.png", width: 92%),
    caption: [正反夸克在味空间中分为八重态与单态的权图，标出各夸克组合],
  )
]
八重态的带味基为
$
  d overline(s),quad u overline(s),quad d overline(u),quad
  u overline(d),quad s overline(u),quad s overline(d)
$
两个中性基为
$
  1/sqrt(2)(u overline(u)-d overline(d)),
  quad 1/sqrt(6)(u overline(u)+d overline(d)-2s overline(s))
$
另有味单态
$
  phi_1=1/sqrt(3)(u overline(u)+d overline(d)+s overline(s))
$
#newpara()
*自旋空间*的对称三重态和反对称单态分别为
$
  chi_S=cases(↑↑, 1/sqrt(2)(↑↓+↓↑), ↓↓),
  quad chi_A=1/sqrt(2)(↑↓-↓↑)
$
#newpara()
*赝标介子*的自旋处于单态。它们的味组成完整写为
$
  K^0=d overline(s),quad K^+=u overline(s)\
  pi^-=d overline(u),quad pi^0=1/sqrt(2)(u overline(u)-d overline(d)), quad pi^+=u overline(d)\
  K^-=s overline(u),quad overline(K)^0=s overline(d)
$
$
  eta_8=1/sqrt(6)(u overline(u)+d overline(d)-2s overline(s)),
  quad eta_1=1/sqrt(3)(u overline(u)+d overline(d)+s overline(s))
$
对中性、自共轭的赝标介子，$J^(P C)=0^(-+)$。其完整粒子性质表见前述赝标介子表。

*矢量介子*的自旋处于三重态。对应的味组成是
$
  K^(*0)=d overline(s),quad K^(*+)=u overline(s)\
  rho^-=d overline(u),quad rho^0=1/sqrt(2)(u overline(u)-d overline(d)),quad rho^+=u overline(d)\
  K^(*-)=s overline(u),quad overline(K)^(*0)=s overline(d)
$
$
  omega_8=1/sqrt(6)(u overline(u)+d overline(d)-2s overline(s)),
  quad omega_1=1/sqrt(3)(u overline(u)+d overline(d)+s overline(s))
$
对中性、自共轭的矢量介子，$J^(P C)=1^(--)$。其完整粒子性质表见前述矢量介子表。

=== 强子的磁矩

// 第88–89页。
对一个夸克，其磁矩为
$
  vb(mu)=g Q/(2m) vb(s),quad g=2
$
在非相对论近似下，复合系统的磁矩是各组分之和，
$
  vb(mu)=sum_i g Q_i/(2m_i) vb(s)_i
$
通常也把磁矩在外磁场方向（取$z$轴）的投影称为磁矩。以自旋向上的单夸克定义$mu_q=Q_q/(2m_q)$，用上面的质子波函数得到
$
  mu_p & =bra(p↑)sum_i g Q_i/(2m_i)s_(i z)ket(p↑) \
       & =1/18 lr(
           ((mu_u-mu_u+mu_d)
             +(-mu_u+mu_u+mu_d)+4(2mu_u-mu_d))
         ) times 3 \
       & =1/3(4mu_u-mu_d)
$
// 这里三个相同的味排列给出因子3，振幅$-2$的项给出概率权重4。

作替换$u->d,d->u$得到中子波函数和磁矩，
$
  mu_n=bra(n↑)sum_i g Q_i/(2m_i)s_(i z)ket(n↑)
  =1/3(4mu_d-mu_u)
$
于是
$
  mu_n/mu_p=(4mu_d-mu_u)/(4mu_u-mu_d)
  arrow.r^(m_u=m_d) -2/3
$
这里$m_u=m_d$时，由夸克电荷$Q_u=(2e)/3$、$Q_d=-e/3$可知$mu_u=-2mu_d$。实验值为
$
  mu_n/mu_p=-0.68497945 plus.minus 0.00000058
$

== 味对称的破缺和混合

=== 质量矩阵与八重态破缺项

// 第90–92页。
味$"SU"(3)$只是近似对称性，其近似程度远比同位旋对称性差。考虑味$"SU"(3)$破缺时，先忽略同位旋与奇异数对称性的破缺，假设
$ "SU"(2)_("Isospin") times "U"(1)_("Strangeness") $
仍为严格对称群。夸克质量矩阵为
$
  bra(q_i)H_("st")ket(q_j) & =mat(m_u, 0, 0; 0, m_d, 0; 0, 0, m_s) \
                           & arrow.r^(m_u=m_d) (2m_u+m_s)/3 bold(1)
                             +(m_u-m_s)/3 mat(1, 0, 0; 0, 1, 0; 0, 0, -2) \
                           & =(2m_u+m_s)/3 bold(1)+(m_u-m_s)/sqrt(3) lambda_8
$
这里$lambda_8$见@ch4-su3-generators。由此尝试把强相互作用Hamiltonian写成
$
  H_("st")=H_0+H_8
$
其中$H_0$味$"SU"(3)$不变，$H_8$按八维表示的第八分量变换。

微扰展开并忽略$H_8$的高阶项。对于按照某个$"SU"(3)$不可约表示变换的强子态，
$
  H_0 ket(h_i^((0)))=m^((0))ket(h_i^((0)))\
  (m_h)_(i j)=bra(h_i^((0)))H_("st")ket(h_j^((0)))
  =m^((0))delta_(i j)+bra(h_i^((0)))H_8 ket(h_j^((0)))
$
$"SU"(3)$变换能够互换同一不可约表示中的态，因此知道$H_8$的变换性质，就能得到这些粒子质量之间的关系。

由群生成元构造、按八维表示第八分量变换的两个线性独立算符可取为
$
  vb(I)^2-1/4 Y^2,quad Y
$
写成
$
  H_8=delta m_1 Y+delta m_2(vb(I)^2-1/4 Y^2)
$
因此
$
  m_h (I,Y)=m^((0))+delta m_1 Y
  +delta m_2(I(I+1)-1/4 Y^2)
$
这就是*Gell-Mann–Okubo公式*。对重子用质量，对介子则用质量的平方。

=== 重子八重态和十重态的质量分裂

// 第93–94页。
对于八重态，$N$、$Lambda$、$Sigma$和$Xi$分别代入$(I,Y)=(1/2,1),(0,0),(1,0),(1/2,-1)$，得到
$
  m_N=m^((0))+delta m_1+1/2 delta m_2,
  quad m_Lambda=m^((0)),
$
$
  m_Sigma=m^((0))+2delta m_2,
  quad m_Xi=m^((0))-delta m_1+1/2 delta m_2.
$
消去三个参数后有
$ (m_N+m_Xi)/2=(3m_Lambda+m_Sigma)/4. $
用各同位旋多重态的质量作比较，左右两侧约为1129 MeV和1135 MeV。原始八重态质量表和权图见前文，所有电荷态均列出。

对于十重态，常略去可吸收入常数的项而简写为
$ I(I+1)-1/4 Y^2 prop Y, $
从而得到等间距关系
$ m(I,Y)=m^((0))+delta m Y, $
$
  m_(Sigma^*)-m_Delta=m_(Xi^*)-m_(Sigma^*)=m_(Omega^-)-m_(Xi^*).
$
三个实验差值依次约为153 MeV、145 MeV、140 MeV。
#block(breakable: false)[#note(subname: [十重态关系中的常数项])[
  十重态满足$I=1+Y/2$，故准确的代数关系为
  $ I(I+1)-Y^2/4=2+3Y/2. $
  这里的$prop Y$省略了常数项。把$2delta m_2$吸收到$m^((0))$后，质量仍为$Y$的一次函数，等间距结论成立。
]]

=== 介子质量分裂与中性态混合

// 第95页全部六组矩阵元。
介子与反介子处于同一个不可约表示，CPT不变要求其质量相等。在前述近似中，线性于$Y$的项不再保留，于是
$ H_8=delta m(vb(I)^2-1/4 Y^2). $
单态与八重态中的两个中性同位旋单态可以混合。相关矩阵元为
$
  bra(eta_1)H_("st")ket(eta_1)
  =bra(eta_1)(H_0+H_8)ket(eta_1)
  =bra(eta_1)H_0 ket(eta_1) equiv m_1,
$
$
  bra(alpha)H_("st")ket(eta_1)
  =bra(alpha)H_8 ket(eta_1)=0,
  quad alpha != eta_1,eta_8,
$
$
  bra(eta_8)H_("st")ket(eta_8)
  =bra(eta_8)(H_0+H_8)ket(eta_8)
  =bra(eta_8)H_0 ket(eta_8) equiv m_8,
$
$
  bra(alpha)H_("st")ket(eta_8)
  =bra(alpha)H_8 ket(eta_8)=0,
  quad alpha != eta_1,eta_8,
$
$
  bra(eta_8)H_("st")ket(eta_1)
  =bra(eta_8)H_8 ket(eta_1) equiv m_("mix"),
$
$
  bra(alpha)H_("st")ket(beta) & =bra(alpha)(H_0+H_8)ket(beta) \
                              & =bra(alpha)[m_8+delta m(vb(I)^2-Y^2/4)]ket(beta), \
                              & quad alpha,beta != eta_1,eta_8.
$
因此四个参数$m_8,m_1,m_("mix"),delta m$即可描述该介子非重态的质量平方矩阵。

对于赝标介子，在$(pi,K,eta_8,eta_1)$所标志的多重态块基中，质量平方矩阵为
$
  cal(M)_P^2=
  mat(
    m_pi^2=m_8+2delta m, 0, 0, 0;
    0, m_K^2=m_8+1/2 delta m, 0, 0;
    0, 0, m_8, m_("mix");
    0, 0, m_("mix"), m_1
  ).
$
第一块有三个$pi$态，第二块有四个$K$态。把全部九个分量显式保留，可写成
$
  cal(M)_P^2="diag"(m_pi^2 bold(1)_3,m_K^2 bold(1)_4,
    mat(m_8, m_("mix"); m_("mix"), m_1)).
$
物理态与味基的关系是
$
  ket(eta)=cos theta_I ket(eta_8)+sin theta_I ket(eta_1),
$
$
  ket(eta')=-sin theta_I ket(eta_8)+cos theta_I ket(eta_1).
$
由历史实验质量估计，可取$theta_I approx -11 degree$。

对于矢量介子，同样有
$
  cal(M)_V^2=
  mat(
    m_rho^2=m_8+2delta m, 0, 0, 0;
    0, m_(K^*)^2=m_8+1/2 delta m, 0, 0;
    0, 0, m_8, m_("mix");
    0, 0, m_("mix"), m_1
  ),
$
$
  ket(omega)=cos theta_V ket(omega_8)+sin theta_V ket(omega_1),
$
$
  ket(phi)=-sin theta_V ket(omega_8)+cos theta_V ket(omega_1).
$
常见旧资料中的角度与味组成写作
$
  theta_V approx -35 degree,quad sin theta_V approx 1/sqrt(3),
$
$
  omega ∼ 1/sqrt(2)(u overline(u)+d overline(d)),
  quad phi ∼ s overline(s),
$
称为*理想混合*。

#block(breakable: false)[#note(subname: [质量参数和混合角约定])[
  介子公式使用质量平方，所以这里$m_8,m_1,m_("mix"),delta m$的单位均为质量平方，两组介子各有自己的一套参数。上列$theta_V approx-35 degree$与$sin theta_V approx+1/sqrt(3)$在同一角度约定下不相容。使用上面明确写出的旋转和$omega_8,omega_1$味基，非奇异$omega$对应$sin theta_V=sqrt(2/3)$、$cos theta_V=1/sqrt(3)$，即$theta_V approx+54.7 degree$，此时$phi=-s overline(s)$，整体相位无物理影响。交换单态/八重态的书写次序或改变角定义，常见的理想角可写为$35.3 degree$。这三条表达采用了不配套的角度约定，不能直接混用。
]]

// 第98–100页。
矢量介子的近似理想混合可以解释$phi$的衰变方式。相应分支比约为
$
  phi(1020)->cases(K^+K^-, K^0 overline(K)^0) quad "合计84%",
$
$
  phi(1020)->pi^+pi^-pi^0 quad "15%".
$
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p98-ozi.png", width: 87%),
    caption: [夸克线图。$phi->K^+K^-$、$omega->3pi$可有连通夸克线，$phi->3pi$的断开夸克线构型受到OZI压低],
  )
]

=== 更多味与更大的分类群

随着更多夸克的发现，轻味三夸克扩展为$u,d,s+c+b+dots$，味空间的分类群也扩展为
$ "SU"(3)->"SU"(4)->"SU"(5)->dots. $
对称性破缺越来越严重，但这种分类仍能为强子组织提供重要信息。
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p100-multiplets.png", width: 100%),
    caption: [加入粲味后的介子和重子多重态原图，含双粲和三粲重子位置。图中双粲部分的红圈属图中的强调标记],
  )
]
延伸阅读：“双粲重子的发现”，DOI：10.1360/TB-2024-0123。

== 粲素

=== 第四种夸克与GIM机制

// 第101页重复目录，第102页。
1964年，Gell-Mann的三夸克图像以$u,d,s$对应$e,mu,nu$三种轻子。1962年已经发现$nu_mu$，轻子数目因而需要区分电子中微子和μ中微子。同在1964年，Glashow与Bjorken提出除三个夸克外还有第四种夸克，与$e,nu_e,mu,nu_mu$四种轻子相对应。

1970年，Glashow、Iliopoulos与Maiani提出GIM机制，解释不同夸克味之间中性流弱过程的压低。相应历史PDG分支比为
$
  "BR"(K^+->pi^+nu overline(nu))=(1.5_(-0.9)^(+1.3))times 10^(-10),
$
$
  "BR"(K^+->pi^0e^+nu_e)=(4.98 plus.minus 0.07)times 10^(-2).
$
GIM机制引入第四种夸克，称为charm（粲），电荷$+2/3$。定义粲数$C$，$c$夸克有$C=+1$，反$c$夸克有$C=-1$。

=== $J slash psi$的发现

// 第103–106页。
1974年，丁肇中在BNL的AGS上建造谱仪，研究具有光子量子数$J^(P C)=1^(--)$的粒子。该装置最初并非专为寻找粲夸克设计。把这种粒子记作$J$，经下列过程寻找其正负电子衰变，
$ p+"Be"->J+X,quad J->e^++e^-. $
谱仪须同时探测两个电荷相反的粒子，尽可能扣除介子本底，并精确测量其动量。$J$在$e^+e^-$不变质量分布中形成尖峰。按该装置的角度约定，有
$
  m(e^+e^-)=sqrt(2m_e^2+2E_1E_2-2p_1p_2 cos(theta_1+theta_2)).
$
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p103-1.png", width: 94%),
    caption: [BNL双臂谱仪原图，标出靶、磁铁、Cherenkov计数器、径迹室和量能器],
  )
]

实验在正负电子不变质量分布中发现非常窄的峰，初期结果为
$ m_J=3100 "MeV",quad Gamma_J<5 "MeV". $
#block(breakable: false)[
  #figure(image("pic/ch4/source-p104-1.jpeg", width: 64%), caption: [BNL观察到的$e^+e^-$不变质量峰原图])
]
相关史料见2024年10月20日IHEP举办的“J粒子发现50周年研讨会”。#footnote[#link("https://news.cyol.com/gb/live/articles/lives/content_qbKa42ipWd.html")[J粒子发现50周年研讨会，2024年10月20日]。]

几乎同时，SLAC的正负电子对撞机SPEAR也发现该态。SPEAR最大能量8 GeV，在最高能量运行一段时间后，回到约3 GeV。调节束流能量时，在3.1 GeV附近的下列截面中发现尖峰，把粒子称为$psi$，
$
  e^++e^-->psi->e^++e^-,
  quad e^++e^-->psi->mu^++mu^-,
$
$ e^++e^-->psi->"hadrons". $
这一发现被称为“November revolution”，丁肇中和B. Richter获1976年Nobel物理学奖。
#block(breakable: false)[
  #figure(
    grid(
      columns: (1fr, 1fr),
      gutter: 2em,
      align(center)[#image("pic/ch4/source-p105-1.jpeg", width: 76%)\ 丁肇中],
      align(center)[#image("pic/ch4/source-p105-2.jpeg", width: 48%)\ B. Richter],
    ),
    caption: [丁肇中与B. Richter],
  )
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p105-cross-sections.png", width: 55%),
    caption: [SPEAR在强子、$mu^+mu^-$、$e^+e^-$三种末态中观察到的共振峰],
  )
]
#block(breakable: false)[
  #figure(image("pic/ch4/source-p105-7.jpeg", width: 37%), caption: [$psi'->J slash psi pi^+pi^-$衰变事例])
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p106-1.jpeg", width: 100%),
    caption: [BNL发现论文原图，Experimental Observation of a Heavy Particle J，1974年11月12日收稿],
  )
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p106-2.jpeg", width: 100%),
    caption: [SLAC发现论文原图，Discovery of a Narrow Resonance in $e^+e^-$ Annihilation，1974年11月13日收稿],
  )
]

=== 量子数的确认与窄宽度测量

// 第107–109页。
$J slash psi$衰变到正负电子，且可在正负电子碰撞中直接产生，这提示它有光子的量子数$J^(P C)=1^(--)$。但仍须排除衰变过程宇称不守恒、粒子具有$J^P=1^+$的可能。

考虑连续谱过程
$ e^++e^-->gamma->mu^++mu^- $
及共振峰附近的
$ e^++e^-->J slash psi->mu^++mu^-. $
若$J slash psi$具有光子量子数，两过程的跃迁振幅便会干涉。与数据的比较显示存在干涉，支持$J slash psi$具有光子量子数。
#block(breakable: false)[
  #figure(image("pic/ch4/source-p107-1.jpeg", width: 54%), caption: [共振区截面与干涉线形的比较原图])
]

在强子末态中考察
$ e^++e^-->n pi. $
仅$n=3,5$时有$J slash psi$共振峰，$n=2,4$时没有。这说明其强子衰变过程保留$G$宇称，属于强衰变。另外，$J slash psi->rho^0pi^0$与$J slash psi->rho^+pi^-$分支比相同，得到$I=0$。

发现$J slash psi$之后，SPEAR继续扫描其它能量，十天后发现$psi'$，量子数仍与光子相同。意大利ADONE电子对撞机把能量从3 GeV提高到3.1 GeV后，也观测到$J slash psi$共振峰。

SLAC的历史质量与宽度测量值为
$
  m(psi)=3097 "MeV",quad Gamma(psi)=91 "keV",
$
$
  m(psi')=3686 "MeV",quad Gamma(psi')=281 "keV".
$
这两个态的宽度远小于实验分辨率。共振截面写作
$
  sigma(E)=3pi/E^2 (Gamma_e Gamma_f)/((E-M_R)^2+(Gamma/2)^2),
$
其积分为
$
  integral sigma(E)dif E=6pi^2/M^2 (Gamma_e Gamma_f)/Gamma.
$
积分截面不依赖于仪器能量分辨率，结合分支比可以确定总宽度。
#block(
  breakable: false,
)[#note[窄共振近似下把缓慢变化的$E^(-2)$在峰附近取为$M^(-2)$，再用$integral_(-infinity)^infinity dif x/(x^2+a^2)=pi/a$，即可从前一式得到后一式。实验展宽会改变峰高与线形，但归一化展宽卷积保留峰面积。]]

=== 粲偶素与开粲介子

// 第110–113页。
$J slash psi$和$psi'$极窄的宽度说明它们是一类不同的强子态，称为粲偶素（charmonium）或hidden charm，由$c overline(c)$组成。两态轨道角动量为零，$J slash psi$处于$1S$态，$psi'$处于$2S$态。

为理解这些态的宽度，1976年SPEAR继续寻找含粲夸克的赝标介子，研究
$
  e^++e^-->D^0+overline(D)^0+X,
  quad e^++e^-->D^++D^-+X.
$
首先找到
$ D^0->K^-pi^+,quad overline(D)^0->K^+pi^-, $
质量1865 MeV，宽度小于实验分辨率。很快又找到带电$D$介子，早期质量估计为1875 MeV，反应道为
$ D^+->K^-pi^+pi^+,quad D^-->K^+pi^-pi^-. $
作为对照，当时未见的反应道为
$ D^+->K^+pi^+pi^-,quad D^-->K^-pi^+pi^-. $
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p111-1.jpeg", width: 90%),
    caption: [带电$D$介子信号道与对照反应道的$K pi pi$质量谱],
  )
]

$J slash psi$和$psi'$的质量均低于$D overline(D)$阈值，强衰变只能经OZI压低的湮灭道进行，因而宽度很窄。这与前述$phi$衰变的夸克线图可作类比。SLAC又发现$psi''$，早期分类曾把它标为$3S$态，其测量值为
$ m(psi'')=3770 "MeV",quad Gamma(psi'')=24 "MeV". $
相应夸克线结构与前面的OZI图相同。超过开粲阈值后，$D overline(D)$强衰变道开放，宽度明显增大。
#block(breakable: false)[#note(
  subname: [第112页的谱学指认],
)[“$3S$”是这里保留的早期分类，$psi(3770)$通常指认为主要由$1^3D_1$组成的粲偶素态。#footnote[CLEO，#link("https://arxiv.org/abs/hep-ex/0605070")[Observation of $psi(3770)->gamma chi_(c 0)$]，Phys. Rev. D 74 (2006) 031106。]]]

#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p113-1.jpeg", width: 100%),
    caption: [最低质量隐粲与开粲介子的完整原表，包括$J slash psi,psi',psi'',eta_c,D^+,D^0,D_s^+$的夸克组成、质量、宽度或寿命、量子数和主要衰变。表中数值为历史参数],
  )
]
#block(
  breakable: false,
)[#note[本节正文先后出现$D^+$质量1875 MeV与表中1869 MeV、$J slash psi$宽度91 keV与表中93 keV，分别对应不同历史资料。它们来自不同表述或资料版本，使用数值计算时应选取同一参数来源。]]

== 第三代夸克

=== 第三代的量子数

// 第114页。
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p114-1.jpeg", width: 91%),
    caption: [三代轻子与夸克，原图保留各代质量的历史近似值和电荷],
  )
]
#block(breakable: false)[
  #figure(image("pic/ch4/source-p114-2.jpeg", width: 31%), caption: [“Who ordered THAT?!”示意图])
]
$b$夸克的bottomness为$B=-1$，反$b$为$B=+1$。$t$夸克的topness为$T=+1$，反$t$为$T=-1$。这里的$B$是底味量子数，须与重子数区分。$B$和$T$在强相互作用、电磁相互作用中守恒。

=== $b$夸克强子的发现

// 第115–117页。
1977年L. Lederman团队在Fermilab以400 GeV质子束研究
$ p+("Cu","Pt")->mu^++mu^-+X. $
为扣除大量强子本底，实验使用仅允许μ子穿过的强子过滤器，这同时降低了动量分辨率。$mu^+mu^-$不变质量中出现三个峰，称为$Upsilon$（Upsilon）。
#block(breakable: false)[
  #figure(image("pic/ch4/source-p115-1.jpeg", width: 81%), caption: [$Upsilon$发现时的μ子对不变质量分布和三峰结构原图])
]

DESY和Cornell的正负电子对撞机随后更精确测量了$Upsilon$性质。历史测量值为
$
  m(Upsilon(1^3 S_1))=9460 "MeV",quad Gamma(Upsilon(1^3 S_1))=53 "keV",
$
$
  m(Upsilon(2^3 S_1))=10023 "MeV",quad Gamma(Upsilon(2^3 S_1))=43 "keV",
$
$
  m(Upsilon(3^3 S_1))=10352 "MeV",quad Gamma(Upsilon(3^3 S_1))=26 "keV".
$
这些态具有光子量子数$J^(P C)=1^(--)$，且$I=0$。它们与粲偶素类似，称为底偶素（bottomonium）。窄宽度的原因与低于开味阈值的粲偶素相同。
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p116-1.jpeg", width: 56%),
    caption: [CLEO在CESR测得的强子截面，显示$Upsilon(1S),Upsilon(2S),Upsilon(3S)$三个态，原图注引Andrews等（1980）],
  )
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p117-1.jpeg", width: 100%),
    caption: [隐底与开底强子的完整原始数据表，包括$Upsilon(1S)$至$Upsilon(4S)$、$B^+,B^0,B_s^0,B_c^+$],
  )
]
$B$介子的寿命比$D$介子还长。
#block(
  breakable: false,
)[#note[第116页正文与第117页表中的部分$Upsilon$宽度和$3S$质量不同，均保留原始数值。部分旧资料把1977年装置误记为“Fermilab Tevatron”；实验史记录表明E288使用400 GeV Main Ring质子束。1995年顶夸克发现数据的质心能量为1.8 TeV，下文约2 TeV是近似表述。#footnote[Fermilab，#link("https://history.fnal.gov/historical/experiments/exp_discover.html")[Discoveries at Fermilab]。]]]

=== $t$夸克的发现

// 第118–119页。
1995年CDF在Fermilab Tevatron的质子—反质子碰撞中发现27个顶夸克事例，质心系能量约为2 TeV。$t$质量约170 GeV，在普通强子化之前已经发生弱衰变，因此不能形成通常意义上的顶强子。Tevatron约每$10^10$个事例才产生一对顶夸克。

产生和衰变链为
$
  p+overline(p)->t+overline(t)+X,
$
$
  t->W^++b->W^++"jet"(b),
$
$
  overline(t)->W^-+overline(b)->W^-+"jet"(overline(b)),
$
$
  W->e nu_e quad (mu nu_mu),
  quad W->q overline(q)'->"jet"+"jet".
$
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p118-1.jpeg", width: 51%),
    caption: [半轻子$t overline(t)$事例的衰变拓扑，含两个$b$喷注、两个轻味喷注、正电子和中微子],
  )
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p119-1.jpeg", width: 91%),
    caption: [CDF典型顶夸克事例原图，左为喷注、电子和缺失动量，右为$b$候选次级顶点的放大图],
  )
]
质量测量结果为
$ m_t=174.2 plus.minus 3.3 "GeV". $

=== $t overline(t)$阈值附近的准束缚结构

// 第120页，必须保留原图时点。
2025年7月EPS-HEP会议上，A. Hoecker报告了$t overline(t)$阈值附近的准束缚结构。
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p120-2.png", width: 39%),
    caption: [阈值附近的顶—反顶过程，Phys. Rev. D 47 (1993) 56],
  )
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p120-1.jpeg", width: 100%),
    caption: [2025年7月EPS-HEP报告原图，CMS在$t overline(t)$阈值附近发现增强，ATLAS在该会议报告确认对应结构。保留NRQCD建模、拟合分布、显著性和截面原始标记],
  )
]
#block(
  breakable: false,
)[#note[ATLAS在2025年7月8日的官方说明指出，观测支持阈值附近极短暂的准束缚toponium解释，其详细性质仍需进一步QCD计算。这与单个顶夸克在通常强子化前已弱衰变可以同时成立。#footnote[ATLAS，#link("https://atlas.cern/Updates/Press-Statement/Quasi-Bound-Tops")[Quasi-bound top-quark pairs，2025年7月8日]。]]]

== 标准模型中的基本粒子

// 第121–123页。第121页正文标题误写§12，按课件目录为第13节。
=== 夸克、轻子及其反粒子


#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p121-1.jpeg", width: 100%),
    caption: [六种夸克的量子数和质量完整原表。$B$列为bottomness，花体$cal(B)$为重子数，质量数字保留该表的数据版本],
  )
]
#block(breakable: false)[
  #figure(
    image("pic/ch4/source-p122-1.jpeg", width: 91%),
    caption: [24个基本费米子及其反粒子原表，每列是一代。六种味的夸克各有$R,G,B$三色，共18个夸克态，加上六个轻子态为24个],
  )
]

=== 相互作用

#block(breakable: false)[
  #figure(image("pic/ch4/source-p123-1.jpeg", width: 100%), caption: [四种相互作用的比较与交换粒子示意])
]
原图列出强、电磁、弱、引力四种相互作用，其相对强度示意为$1,10^(-3),10^(-5),10^(-38)$。强相互作用的场量子为胶子，电磁相互作用为光子，弱相互作用为$W^+,W^-,Z^0$。原图把引力子的存在以问号标明。图下方用船上传球产生反冲的图像解释“粒子的交换产生力”的直觉。
#block(
  breakable: false,
)[#note[这些相对强度是定性尺度比较，实际耦合强弱依过程、动量尺度与归一化而定。标准模型包括强、电磁和弱相互作用，图中引力一行是为比较同时列入。]]

== 本章小结

=== 从共振峰到强子量子数

强相互作用中的短寿命态通过末态重建和散射共振被辨认。不变质量分布确定质量与宽度，截面的能量依赖、衰变角分布、反应道及强作用选择规则共同确定$I$、$J$与$P$。共振峰的位置、形状和量子数包含不同信息；只看见质量峰，并不足以完成粒子鉴别。

Dalitz图用三个末态粒子的两项独立运动学变量，把三体衰变的相空间变成一个平面区域。均匀的相空间只是基线；中间共振形成带状结构，而自旋、宇称、同位旋和Bose统计对矩阵元的限制，会改变区域内部的分布。三$pi$系统的分析及$theta$–$tau$疑难说明，同一质量与寿命的粒子在不同衰变道中的宇称推断，必须结合相互作用是否守恒宇称。

=== 从同位旋多重态到夸克与色

$"SU"(2)$同位旋把近简并的带电态组织成多重态。八正法把同位旋和奇异数纳入味$"SU"(3)$，用八重态、十重态等不可约表示组织强子，并由未占据的位置预言$Omega^-$。味对称性是近似的，不能把同一味多重态的质量差别忽略为严格等质量。

夸克模型为这些表示提供了组成解释：
$
  bold(3) ⊗ overline(bold(3))=bold(1) ⊕ bold(8),
  quad bold(3) ⊗ bold(3) ⊗ bold(3)
  =bold(1) ⊕ bold(8) ⊕ bold(8) ⊕ bold(10)
$
基态重子的空间波函数对称，色单态反对称，因此“味$+$自旋”部分必须对称。十重态的全对称味波函数和自旋$3/2$，以及八重态两类混合对称波函数的组合，都由这个总交换性质联系起来。味、色、自旋、空间四部分应分别检查，不能只看其中一项判断是否满足Pauli原理。

=== 用模型计算并检验近似

非相对论夸克模型把强子磁矩写成组分夸克磁矩的期望值，给出
$
  mu_p=(4mu_u-mu_d)/3, quad mu_n=(4mu_d-mu_u)/3,
  quad lr(mu_n/mu_p)_(m_u=m_d)=-2/3
$
这里的等组分质量和非相对论近似有明确适用范围；与实验比较，才能评价模型的精度。

质量分裂来自味对称性破缺。把破缺项按群表示分类，可得到Gell-Mann–Okubo关系、十重态近似等间距规律及介子单态–八重态混合。重子通常比较质量，介子关系比较质量平方；混合角还依赖基底相位及角的定义，必须连同态展开式一起解释。

=== 重味粒子与标准模型图像

$J slash psi$、$Upsilon$和开粲、开底强子把轻味夸克模型扩展到新的味。质量相对阈值的位置、允许衰变道与OZI压低共同解释窄宽度，不能只用“强子一定宽”来判断新态。顶夸克在通常强子化之前即弱衰变，其实验重建和阈值附近准束缚效应也应区分。

从群论的角度看，*群*规定变换的复合法则，*表示*规定物理对象怎样变换，*不可约表示*给出分类的基本单位，*直积分解*连接复合系统与基本组成。数学分类须与具体相互作用、对称性破缺和实验可观测量一起使用，才构成本章的强子物理图像。
