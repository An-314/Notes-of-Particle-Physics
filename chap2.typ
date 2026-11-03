#import "@preview/scripst:1.1.3": *
#show figure: set block(breakable: true)

#pagebreak(weak: true)

#show heading.where(level: 2): it => block(sticky: true)[#it]
#show heading.where(level: 3): it => block(sticky: true)[#it]
#show heading.where(level: 4): it => block(sticky: true)[#it]
#set page(header: context {
  set text(font: font.header)
  let sec = query(<chap2-particles>).first()
  grid(columns: (1fr, auto), align: (left, right))[
    #smallcaps([粒子物理])
  ][
    #if here().page() > sec.location().page() {
      numbering(sec.numbering, ..counter(heading).at(sec.location()))
      [ ]
      smallcaps(sec.body)
    }
  ]
})

= 核子、轻子和玻色子 <chap2-particles>

本章从粒子的发现及性质测量出发，讨论质量、自旋、寿命和内部量子数如何由实验确定，再引入相对论波动方程及反粒子的解释。除显式恢复单位的地方外，继续采用$hbar=c=1$及度规$g^(mu nu)="diag"(1,-1,-1,-1)$。

到1930年代中期，电子、质子、中子、光子和正电子已进入粒子物理的基本图像；原子核由质子和中子组成。但是，核子之间的短程吸引力如何产生，以及宇宙线中是否还有未知粒子，仍需新的理论与实验。

// 课后讲义PDF第2页。
课件以“1935年的基本粒子”为起点，列出当时图像的建立节点：
#figure(
  three-line-table[
    | 对象或认识 | 年份 | 研究者 |
    | --- | --- | --- |
    | 电子 | 1897 | J. J. Thomson |
    | 质子 | 1919 | E. Rutherford |
    | 光子的实验依据 | 1922 | A. Compton |
    | 中子 | 1932 | J. Chadwick |
    | 正电子 | 1932 | C. Anderson |
    | 原子核由质子与中子组成 | 1932 | W. Heisenberg、D. D. Ivanenko（伊凡宁柯） |
  ],
  caption: [课件列出的早期粒子物理节点；其中1922年的光子条目指Compton散射所提供的粒子性证据],
)
// 课后讲义PDF第1、3页为总目录；第15、33、41、73、96、101、108页重复目录，分别对应以下七节。

// 讲义第4至12页。
== $μ$子和$π$介子 (The muon and pion)

=== Yukawa势与核力的作用距离

Yukawa在1935年类比电磁相互作用，提出通过交换有质量的粒子描述核力。其基本图像是“荷$arrow.l.r$场（势）$arrow.l.r$荷”，通过比较两个静止粒子间的相互作用力研究不同相互作用的性质。

#block(breakable: false)[
#figure(
  grid(columns: (1fr,), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-yukawa.png", height: 2.4cm)

#text(size: 10pt)[Hideki Yukawa（汤川秀树）]],
  ),
  caption: [课件第4页的Yukawa肖像],
)
]

首先考虑静止点源产生的场。在Lorenz规范下，电磁标势的波动方程具有形式
$
  (nabla^2-pdv(, t, 2)) phi_"em"(vb(r),t)=-rho_"em"(vb(r),t)
$
取静止点源$rho_"em"=Q_"em" delta^3 (vb(r))$，满足无穷远边界条件的解为
$
  phi_"em"(r)=Q_"em"/(4 pi r)
$
无质量光子的交换对应长程的Coulomb势。

若媒介场具有质量$m$，则相应的标量模型为
$
  (nabla^2-pdv(, t, 2)-m^2) phi(vb(r), t)=-rho(vb(r), t)
$
对静止点源$rho=Q delta^3 (vb(r))$，在$r>0$处令$u(r)=r phi(r)$，方程化为
$
  dv(u, r, 2)-m^2 u=0
$
舍去无穷远发散的解，并由点源处的通量确定归一化，得到*Yukawa势*
$
  phi(r)=Q/(4 pi) e^(-m r)/r
$
两粒子的相互作用势还需乘第二个粒子的耦合；例如吸引的标量交换常写成$V(r)=-g^2 e^(-m r)/(4 pi r)$。势的符号和自旋结构取决于具体的相互作用。

指数因子给出特征作用距离$L tilde 1/m$。按讲义对这一径向势所用的定义，还可直接算出
$
  L=lim_(R -> infinity) (integral_0^R r^2 phi(r) dd(r))/(integral_0^R r phi(r) dd(r))
  =(integral_0^infinity r^2 phi(r) dd(r))/(integral_0^infinity r phi(r) dd(r))
  =(integral_0^infinity r e^(-m r) dd(r))/(integral_0^infinity e^(-m r) dd(r))=1/m
$
恢复单位后
$
  L=hbar/(m c), quad m c^2=(hbar c)/L
$
核力的典型作用距离为$1 "fm"$量级，因而预期媒介粒子的质量能量约为
$
  m c^2 tilde (197 "MeV fm")/(1 "fm") tilde 200 "MeV"
$

// 课后讲义PDF第6页：弱作用力程估算。
#block(breakable: false)[
#example(subname: [由弱作用媒介子的质量估计力程])[

  *课件原题（单选，1分）*：已知弱相互作用媒介子质量约$80 "GeV"$，根据汤川理论，其力程约为多少？选项为A.$1/400 "fm"$；B.$1/40 "fm"$；C.$1/4 "fm"$；D.$1 "fm"$。

  *计算*：
  若交换粒子的质量能量约为$M c^2=80 "GeV"$，沿用Yukawa势的尺度关系，有
  $
    L tilde (hbar c)/(M c^2)
    = (0.197 "GeV fm")/(80 "GeV")
    approx 2.5 times 10^(-3) "fm" approx 1/400 "fm"
  $
  与核力的飞米尺度相比，弱作用的这一尺度小得多。这里估计的是有质量媒介子交换对应的特征距离，并非粒子的飞行距离或衰变长度；弱过程的衰变寿命还取决于耦合、可用能量和末态相空间。
]
]
#newpara()

#block(breakable: false)[
#note(subname: [核力与基本强相互作用])[
  核子之间的力是QCD在低能下的剩余相互作用。π介子交换描述核力的长程部分；在更短距离处还需考虑其他交换和短程作用。π介子本身是夸克与反夸克组成的强子，不是标准模型中传递色相互作用的基本规范玻色子。
]
]
#newpara()

=== $μ$子的发现及其与核力的区别

Anderson和Neddermeyer于1937年报告宇宙线中的一种新粒子，其质量介于电子和质子之间。由于质量尺度接近Yukawa的预言，它最初被视为核力媒介粒子的候选者。

// 课后讲义PDF第7页。
课件所引早期云室事例中，中性宇宙线粒子在横贯云室的铅板内发生相互作用；上半幅的强电离径迹射程约$40 "mm"$，曲率半径约$65 "mm"$，当时由此给出约$180 "MeV/c"^2$的质量估计。这是早期的事例重建结果，不能用来替代后来精确测得的$mu$子质量。
#block(breakable: false)[
#figure(
  image("pic/ch2/muon-discovery-cloud.png", width: 90%),
  caption: [Anderson与Neddermeyer的立体云室照片及原图说明；保留早期质量估计以说明粒子发现与精密测量的区别],
)
]

#block(breakable: false)[
#figure(
  grid(columns: (1fr, 1fr), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-anderson.png", height: 2.4cm)

#text(size: 10pt)[C. Anderson]],
    align(center)[#image("pic/ch2/portrait-neddermeyer.png", height: 2.4cm)

#text(size: 10pt)[S. Neddermeyer]],
  ),
  caption: [课件第9页所列μ子发现者],
)
]

判断一种粒子的身份不能只依赖质量，还必须研究相互作用与衰变。Rossi和Nereson在1942年测得其寿命约为$(2.15 plus.minus 0.10) "μs"$。1947年Conversi、Pancini和Piccioni比较了不同材料中正、负$μ$子的停止、吸收与衰变：负$μ$子在铁中容易被核俘获，但在碳中仍有显著的衰变成分，明显不符合强相互作用介子的预期。

// 课后讲义PDF第8页。
实验先选出低能、特定电荷的$mu$子，再研究其能损停止之后是否被核吸收。课件将结果概括为“铁：全部吸收；碳：部分吸收”。符合计数与延迟符合区分粒子到达和随后衰变；关键结论是$mu$子同物质的强作用太弱，因而不是Yukawa粒子。
#block(breakable: false)[
#figure(
  image("pic/ch2/conversi-muon-absorption.png", width: 90%),
  caption: [Conversi–Pancini–Piccioni实验：磁场选电荷、停止层及延迟符合的示意],
)
]

$μ$子是自旋$1/2$的*轻子*，质量约$105.7 "MeV"$、固有寿命约$2.20 "μs"$。它有电荷，参与电磁和弱相互作用，但不参与强相互作用。其主要衰变为
$
  mu^- -> e^- + overline(nu)_e + nu_mu, quad
  mu^+ -> e^+ + nu_e + overline(nu)_mu
$
停止的负$μ$子还可被核俘获；在核子层面，典型的弱过程为
$
  mu^- + p -> n + nu_mu
$

// 课后讲义PDF第9页。
课件引用的PDG 2006汇总页还列出$mu$子的精确质量、寿命、$c tau$、磁矩、电偶极矩、普通及辐射衰变分支比，以及轻子味破坏衰变的实验上限。为保留原表的全部数值与置信水平，原表录如下；这些是*课件所引版本的数据*。
#block(breakable: false)[
#figure(
  image("pic/ch2/muon-pdg2006.png", width: 98%),
  caption: [课件所引PDG 2006的μ子性质及衰变模式表],
)
]

=== $π$介子的发现及衰变链

#block(breakable: false)[
#figure(
  grid(columns: (1fr,), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-powell.png", height: 2.4cm)

#text(size: 10pt)[C. Powell]],
  ),
  caption: [课件第10页的Powell肖像],
)
]

1947年Lattes、Occhialini、Powell等在高海拔宇宙线核乳胶实验中识别出$π$介子。

// 课后讲义PDF第10页。
云室中发现的$mu$子与物质相互作用太弱，因此仍需寻找真正符合核力特征的介子。核子间的作用可以通过中性及带电π交换组织起来，课件给出的四种连接为$p p$与$n p$间的$pi^0$交换，以及$p n arrow.l.r n p$的$pi^+$、$pi^-$交换；由此需要$pi^0,pi^+,pi^-$三种电荷态。
#block(breakable: false)[
#figure(
  image("pic/ch2/pion-exchange-four-diagrams.png", width: 90%),
  caption: [课件的四个π交换图：中性交换保持核子电荷，带电交换使质子与中子互换],
)
]乳胶中可以分辨先后衰变的径迹
$
  pi^+ -> mu^+ + nu_mu, quad
  mu^+ -> e^+ + nu_e + overline(nu)_mu
$
电荷共轭过程为
$
  pi^- -> mu^- + overline(nu)_mu, quad
  mu^- -> e^- + overline(nu)_e + nu_mu
$

#figure(
  image("pic/ch2/pion-muon-decay.png", width: 68%),
  caption: [核乳胶中的$π$介子、$μ$子连续衰变径迹。中微子不留下直接的电离径迹],
)

π介子与原子核有强相互作用，可以引起核反应及吸收。用$X_(A,Z)$表示质量数为$A$、电荷数为$Z$的原子核，典型反应可写成
$
  pi^+ + X_(A,Z) & -> X_(A-1,Z) + p \
  pi^- + X_(A,Z) & -> X_(A-1,Z-1) + n
$
它的质量及强相互作用性质共同支持了Yukawa介子的解释。

$π$介子有$pi^+,pi^0,pi^-$三种电荷态。中性$π$介子主要通过电磁过程衰变
$
  pi^0 -> gamma + gamma
$
其寿命约为$8.4 times 10^(-17) "s"$，比通过弱相互作用衰变的带电π介子短得多。光子可以进一步转换为$e^+e^-$对，所以中性粒子也能由次级带电径迹重建。

// 课后讲义PDF第12页。
核乳胶的中性π事例由两个光子转换出的电子对显示；课件在这张早期事例旁标出$pi^0 -> 2gamma$约占$99%$，寿命为$(8.4 plus.minus 0.6) times 10^(-17) "s"$。
#block(breakable: false)[
#figure(
  image("pic/ch2/neutral-pion-emulsion.png", width: 90%),
  caption: [中性π介子在核乳胶中的事例。原图标注P处为光子的电子对转换点，标尺为50 μm],
)
]

// 课后讲义PDF第13页；第34页重复展示同一组表。
课件进一步给出带电与中性π介子的PDG 2006性质表：不仅有质量、寿命及$J^(P C)$，还列出形状因子、全部展示的衰变分支比、置信水平与禁戒道上限。两张原表分开排列，保留表中全部信息。
#block(breakable: false)[
#figure(
  image("pic/ch2/pion-charged-pdg2006.png", width: 92%),
  caption: [课件原表：带电π介子的PDG 2006性质、形状因子及衰变模式],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/pion-neutral-pdg2006.png", width: 92%),
  caption: [课件原表：中性π介子的PDG 2006性质及衰变模式],
)
]

// 课后讲义PDF第14页：比较两体末态相空间；题面μ质量113 MeV为笔误，采用前文105.7 MeV。
#example(subname: [相空间更大，衰变就一定更快吗？])[

  *课件原题（单选，1分）*：$pi^+ -> mu^+ nu_mu$和$pi^+ -> e^+ nu_e$，哪个末态相空间体积大？原题给$mu$子质量$113 "MeV"$、电子质量$0.511 "MeV"$、中微子质量接近零。A.前者；B.后者。

  *补注*：题面$113 "MeV"$与本节前面的$mu$子质量不一致，下列计算采用$105.7 "MeV"$；这不影响选B。

  比较$pi^+ -> e^+ nu_e$与$pi^+ -> mu^+ nu_mu$。在π介子静止系中忽略中微子质量，轻子与中微子的动量大小相同，为
  $
    p_l=(m_pi^2-m_l^2)/(2m_pi), quad l=e,mu
  $
  按第一章的不变相空间约定，对末态方向积分后
  $
    Phi_2=integral dd(Phi_2)=p_l/(4pi m_pi)
      =1/(8pi)(1-m_l^2/m_pi^2)
  $
  电子比$mu$子轻，故$p_e>p_mu$、电子道的两体相空间更大。这正是课堂题所比较的*纯运动学因素*。

  但衰变宽度还含振幅。在标准的左手带电弱流近似下，自旋零的π介子衰变到轻子与中微子的振幅正比于$m_l$，称为*螺旋度压低*。于是忽略辐射修正时
  $
    Gamma(pi^+ -> l^+ nu_l) prop
      m_l^2 m_pi (1-m_l^2/m_pi^2)^2
  $
  两道之比为
  $
    R_(e/mu) & = Gamma(pi^+ -> e^+nu_e)/Gamma(pi^+ -> mu^+nu_mu) \
    & =m_e^2/m_mu^2
      ((m_pi^2-m_e^2)/(m_pi^2-m_mu^2))^2
    approx 1.3 times 10^(-4)
  $
  因而相空间较小的$mu$子道反而占主导。相空间与相互作用振幅共同决定衰变率，不能只比较末态质量。
]
#newpara()

// 讲义第14至28页。
== 奇异介子和超子 (Strange mesons and hyperons)

=== 宇宙线中的新粒子与V形衰变

核乳胶、云室及符合触发技术使人们在宇宙线中发现了一批更重的粒子。早期事例常按衰变形态命名，随后才通过质量、寿命和衰变道把它们归并为同一种粒子。

// 课后讲义PDF第16–17页。
在发现π介子之后，一度似乎“问题好像都清楚了”，但“为什么还需要μ子”仍不明白；宇宙线中更多新粒子的发现很快又使图像复杂起来。二战后的主要研究中心是Bristol的Powell、Manchester的Blackett、Ecole Polytechnique的Leprince-Ringuet、Caltech的Anderson，以及Berkeley的Brode与Fretter。

课件用上下计数器与云室的符合触发图说明怎样选择穿过云室的粒子。历史名称与后来身份的对照包括：$tau$对应$K_(pi 3)^+$；$V_1^0$对应$Lambda^0 -> p pi^-$；$V_2^0$或$theta^0$对应$K_S^0 -> pi^+pi^-$；$kappa$对应$K_(mu 2)^+$；还出现过$K_(mu 3)^+$、$chi(theta^+)=K_(pi 2)^+$，以及后来归为$Sigma^+$的$V^+,Lambda^+$。
#block(breakable: false)[
#figure(
  image("pic/ch2/cosmic-trigger-and-old-names.png", width: 90%),
  caption: [课件的云室符合触发示意和历史粒子名称对照表],
)
]

例如1944年的散射事例被解释为$K^+e^- -> K^+e^-$，给出约$(506 plus.minus 61) "MeV"$的质量估计；1947年Rochester和Butler观测到中性粒子产生两条带电径迹的*V形衰变*
$
  V^0 -> a^+ + b^-
$
母粒子本身没有电离径迹，两条末态径迹却在离开主相互作用点的位置交会。带电母粒子衰变为一个带电粒子及中性粒子时，则可能出现径迹的折点。

// 课后讲义PDF第18页。
Leprince-Ringuet与L’héritier在1944年的立体散射重建给出
$
  m_K=990m_e plus.minus 12%=(506 plus.minus 61) "MeV"
$
原文为《Comptes Rendus de l’Académie des Sciences de Paris》，1944年12月13日，第618页。
#block(breakable: false)[
#figure(
  image("pic/ch2/kaon-1944-scattering.png", width: 90%),
  caption: [1944年K⁺e⁻弹性散射事例的立体重建],
)
]

// 课后讲义PDF第19–20页。
Rochester与Butler在约50个宇宙线穿透事例中找到两个衰变事例（Nature 160 (1947) 855）：一个是中性$V^0 -> a^+b^-$，另一个是带电$a^+ -> b^++"neutral"$。课件保留的磁场、张角、两条径迹动量和电荷符号的原始实验表如下。
#block(breakable: false)[
#figure(
  image("pic/ch2/v-decay-1947-data.png", width: 94%),
  caption: [Rochester–Butler两个事例的原始实验数据表],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/v-decay-1947-neutral.png", width: 90%),
  caption: [1947年中性V形衰变的立体云室照片],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/v-decay-1947-charged.png", width: 90%),
  caption: [1947年带电母粒子发生折点的立体云室照片],
)
]

#block(breakable: false)[
#example(subname: [由云室内的衰变概率估计寿命])[
  粒子的速度为$beta c$，平均飞行距离为$ell=beta gamma c tau_0$。若从进入观测区开始计算、观测长度为$D$，则
  $
    P_"decay"=1-e^(-D/ell) approx D/(beta gamma c tau_0), quad D << ell
  $
  课件的粗估假定约50个宇宙线事例中每个都产生约一个这样的粒子；两种衰变类型各出现约一次，因而对每一种粒子都有$P_"decay" approx 1/50=0.02$。取$D approx 0.30 "m"$及$beta approx 0.7$，得到
  $
    tau_0 approx (D sqrt(1-beta^2))/(P_"decay" beta c)
    approx 5 times 10^(-8) "s"
  $
  这是$10^(-8) "s"$量级的粗略估计。实际测量还需知道产生数量、速度分布、进入观测区之前的存活概率和探测效率。
]
]
#newpara()

早期称为$kappa$的粒子可出现$mu -> e$的后续衰变链，而称为$tau$的一类事例衰变到三个π介子。这些历史名称中的$tau$指后来归入$K$介子的粒子，与第三代带电轻子$tau$不同。

// 课后讲义PDF第21–22页。
具体事例包括C. O’Ceallaigh（Phil. Mag. XLII (1951) 1032）记录的$kappa -> mu -> e$链，得到$m_kappa=(562 plus.minus 70) "MeV"$；A. Bonetti等（Nuovo Cimento 10 (1953) 1）记录的$Sigma^+ -> p pi^0$；以及R. Brown等（Nature 163 (1949) 82）的$tau -> pi^+pi^+pi^-$。
#block(breakable: false)[
#figure(
  image("pic/ch2/kappa-sigma-emulsion.png", width: 90%),
  caption: [课件中的κ→μ→e与Σ⁺→pπ⁰核乳胶事例],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/kaon-three-pion-1949.png", width: 90%),
  caption: [Brown等记录的三π衰变事例及原照片说明],
)
]

// 课后讲义PDF第23页：宇宙线新粒子性质的课堂讨论。
#block(breakable: false)[
#note(subname: [由宇宙线事例能够归纳什么？])[

  *课件投票题（最多选两项）*：从宇宙线实验，对这些新粒子印象较深的两项是什么？A.比π介子质量大；B.寿命长，跟π介子相近；C.可能参与强相互作用；D.可以衰变到π介子。

  *讨论*：
  这些新粒子的质量比π介子大，有些能够衰变到π介子，并可在探测器中飞行到与产生点分离的次级顶点。较长的寿命提示它们并非立即通过强相互作用衰变；但仅凭衰变顶点或末态中出现π介子，还不能确定产生过程的相互作用类型。随后测得的强作用产生截面与慢衰变之间的反差，才构成“奇异性”的关键证据。
]
]
#newpara()

宇宙线的产生位置、能量和强度难以控制。加速器提供可重复的束流，气泡室提供清晰的多径迹记录，使精确比较不同事例的质量和寿命成为可能。例如级联衰变
$
  Xi^- -> Lambda + pi^-, quad Lambda -> p + pi^-
$
会形成两个可区分的次级顶点。

// 课后讲义PDF第24–25页。
随着衰变模式增多，必须判别“同一粒子的不同衰变道”与“不同粒子的衰变”。这要求①可重复的实验；②精确的径迹、能量测量和粒子鉴别。加速器与气泡室满足了宇宙线实验难以同时满足的条件。图示级联事例来自British 1.5 m气泡室，以CERN质子同步加速器提供的$6 "GeV/c"$ $K^-$束照射；$Xi^-$是相互作用顶点出射的四条径迹中最下面一条，随后产生$Lambda$和$pi^-$。
#block(breakable: false)[
#figure(
  image("pic/ch2/xi-cascade-bubble.png", width: 90%),
  caption: [加速器–气泡室的Ξ⁻级联衰变，保留相互作用顶点、两级衰变及原图说明],
)
]

=== 协同产生与奇异数

奇异粒子的关键特征是：*产生过程具有强相互作用的速率，而许多基态粒子的衰变却很慢*。典型的协同产生过程为
$
  pi^- + p -> K^0 + Lambda
$
产生截面可达$"mb"$量级，而$Lambda -> p pi^-$的寿命约$2.6 times 10^(-10) "s"$，远长于典型强衰变时间。

// 课后讲义PDF第26–28页。
W. B. Fowler等（Phys. Rev. 93 (1954) 861）的加速器–云室实验直接看到协同产生及随后衰变
$
  pi^-p -> K^0 Lambda, quad K^0 -> pi^+pi^-, quad Lambda -> p pi^-
$
课件给出的产生截面为$sigma tilde 1 "mb"$，$Lambda$寿命为$(2.631 plus.minus 0.020) times 10^(-10) "s"$。
#block(breakable: false)[
#figure(
  image("pic/ch2/associated-production-cloud-1954.png", width: 90%),
  caption: [1954年加速器–云室中的K⁰与Λ协同产生；后图继续给出加速器–气泡室事例],
)
]

#figure(
  image("pic/ch2/associated-production.png", width: 73%),
  caption: [气泡室中的奇异粒子协同产生事例：中性的$K^0$与$Lambda$通过各自的带电衰变产物显现],
)

Gell-Mann和Nishijima在1953年引入可加性量子数*奇异数*$S$：强相互作用和电磁相互作用守恒$S$，弱相互作用则可以改变$S$。旧的已知粒子如质子和π介子，其奇异数均为零。现代夸克语言下
$
  S(s)=-1, quad S(overline(s))=+1, quad
  S=N_(overline(s))-N_s
$
这里$s$夸克的$S=-1$是奇异数的约定；它与$s$夸克的电荷$Q/e=-1/3$及自旋$1/2$是不同的量子数，不可混淆。
其余轻味夸克的奇异数为零。例如
$
  K^0=d overline(s): S=+1, quad Lambda=u d s: S=-1
$
因此上述产生反应满足$0=(+1)+(-1)$，但$Lambda -> p pi^-$使奇异数由$-1$变为$0$，只能通过改变味的弱相互作用发生。

#block(breakable: false)[
#note(subname: [“成对产生”的准确含义])[
  对初态总奇异数为零的强反应，末态总奇异数仍须为零，因此新产生的$s$与$overline(s)$要相互补偿。它们可以进入不同强子，也可以进入同一个隐奇异强子；并非所有反应都必须恰好产生两个带奇异数的粒子。若初态已经含奇异粒子，只需保持总$S$不变。
]
]
#newpara()

奇异夸克$s$属于第二代夸克，电荷为$-e/3$，自旋为$1/2$。含$s$或$overline(s)$的强子称为奇异强子；实际寿命由该强子的具体组成和允许衰变道决定，不能用“s夸克寿命更短”概括所有奇异粒子的寿命。夸克的流质量还依赖重整化方案与能标，不能当作强子内一颗自由粒子的独立静质量。

=== K介子与亚稳定超子

这里的*亚稳定*指不存在允许的强衰变道，粒子通过弱或电磁过程衰变，并不表示绝对稳定。

// 课后讲义PDF第29页。
课件的K介子数据还给出主要分支比：$K^+ -> mu^+nu_mu$约$63%$，$pi^+pi^+pi^-$约$21%$，$pi^+pi^0$约$5.6%$；$K^-$有相应共轭道。原表的整数质量为$494,498,494,498 "MeV"$，带电K的寿命均约$12 "ns"$；中性味态的寿命栏记n.a.（not applicable），其原因正是下面讨论的中性K混合。四个K是这里所说仅有的亚稳定奇异介子，基态自旋为0。

#block(breakable: false)[
#note(subname: [补充：K⁺原表的两项分支比])[
  原课件将三π与$pi^+pi^0$两项百分数写反了。应为$K^+ -> pi^+pi^0$约$21%$，$K^+ -> pi^+pi^+pi^-$约$5.6%$；原表的$mu^+nu_mu$约$63%$不受这项交换影响。#footnote[参见#link("https://pdg.lbl.gov/2024/listings/rpp2024-list-K-plus-minus.pdf")[PDG 2024: K⁺/K⁻]。]
]
]

轻味*基态奇异$K$介子*的自旋为零，其量子数为

#block(breakable: false)[
#figure(
  three-line-table[
    | 粒子 | 价夸克 | $Q/e$ | $S$ | 质量量级 |
    | --- | --- | --- | --- | --- |
    | $K^+$ | $u overline(s)$ | $+1$ | $+1$ | $494 "MeV"$ |
    | $K^-$ | $s overline(u)$ | $-1$ | $-1$ | $494 "MeV"$ |
    | $K^0$ | $d overline(s)$ | $0$ | $+1$ | $498 "MeV"$ |
    | $overline(K)^0$ | $s overline(d)$ | $0$ | $-1$ | $498 "MeV"$ |
  ],
  caption: [四种K介子的味与电荷量子数],
)
]

$K^+$与$K^-$互为反粒子，$K^0$与$overline(K)^0$也互为反粒子。$K^+$的寿命约$12 "ns"$，主要衰变包括$mu^+nu_mu$、$pi^+pi^0$和$pi^+pi^+pi^-$。激发态$K^* (892)$则可通过$K^* -> K pi$强衰变，寿命短得多。

中性$K$介子的味本征态不是传播时的质量、寿命本征态。忽略CP破坏并选定相位约定时，近似有
$
  ket(K_S) approx (ket(K^0)+ket(overline(K)^0))/sqrt(2), quad
  ket(K_L) approx (ket(K^0)-ket(overline(K)^0))/sqrt(2)
$
两者寿命约为$0.09 "ns"$和$51 "ns"$。这解释了为什么不能为纯粹的$K^0$味态指定一个独立的单指数寿命。

*超子*是含奇异夸克的重子。下面是六种自旋$1/2$基态超子，以及自旋$3/2$的$Omega^-$，其量子数为

#block(breakable: false)[
#figure(
  three-line-table[
    | 粒子 | 价夸克 | $S$ | $J$ | 主要衰变示例 |
    | --- | --- | --- | --- | --- |
    | $Lambda$ | $u d s$ | $-1$ | $1/2$ | $p pi^-$、$n pi^0$ |
    | $Sigma^+$ | $u u s$ | $-1$ | $1/2$ | $p pi^0$、$n pi^+$ |
    | $Sigma^0$ | $u d s$ | $-1$ | $1/2$ | $Lambda gamma$ |
    | $Sigma^-$ | $d d s$ | $-1$ | $1/2$ | $n pi^-$ |
    | $Xi^0$ | $u s s$ | $-2$ | $1/2$ | $Lambda pi^0$ |
    | $Xi^-$ | $d s s$ | $-2$ | $1/2$ | $Lambda pi^-$ |
    | $Omega^-$ | $s s s$ | $-3$ | $3/2$ | $Lambda K^-$、$Xi pi$ |
  ],
  caption: [常见亚稳定奇异超子及其衰变],
)
]

它们都各有反粒子。其中$Sigma^0 -> Lambda gamma$为电磁衰变，寿命约$10^(-19) "s"$；表中其余粒子的主要衰变为弱衰变，寿命多为$10^(-10) "s"$量级。

// 课后讲义PDF第30页。
课件原表的质量、寿命、平均衰变长度与分支比如下：
#figure(
  three-line-table[
    | 超子 | $m$ / MeV | $tau$ / ps | $c tau$ / mm | 主要衰变及BR / % |
    | --- | --- | --- | --- | --- |
    | $Lambda$ | 1116 | 263 | 79 | $p pi^-$（64），$n pi^0$（36） |
    | $Sigma^+$ | 1189 | 80 | 24 | $p pi^0$（51.6），$n pi^+$（48.3） |
    | $Sigma^0$ | 1193 | $7.4 times 10^(-8)$ | $2.2 times 10^(-8)$ | $Lambda gamma$（100） |
    | $Sigma^-$ | 1197 | 148 | 44.4 | $n pi^-$（99.8） |
    | $Xi^0$ | 1315 | 290 | 87 | $Lambda pi^0$（99.5） |
    | $Xi^-$ | 1321 | 164 | 49 | $Lambda pi^-$（99.9） |
  ],
  caption: [课件原表的亚稳定奇异超子数据；保持原表的近似精度],
)
#block(breakable: false)[
#note(subname: [补充：原课件的自旋概括])[
  课件在六个自旋$1/2$超子的表后补入$Omega^-$，并将七种一并写为“自旋$1/2$”。需要区分：前六种的基态为$1/2$，$Omega^-$基态为$3/2$。奇异介子与超子都含$s$或$overline(s)$，因而不是这里所谓的无内部结构的基本粒子。
]
]

=== $K$介子在物质中的吸收差异

普通物质含核子，其重子数$B=1$、奇异数$S=0$。反K介子可以把自身的$s$夸克转移给重子，形成超子，例如
$
  overline(K)^0+p -> pi^+ + Lambda
$
及
$
  K^-+p -> pi^0+Lambda, quad pi^0+Sigma^0, quad pi^+ + Sigma^-, quad pi^-+Sigma^+
$
后一式右侧列举的是不同反应道。它们都满足电荷、重子数和奇异数守恒。

相反，$K^0+p -> pi^+ + Lambda$会使$S$由$+1$变为$-1$，不能作为强反应发生；$K^+p$也没有相同的低能超子吸收道。

因此在相应的低能吸收条件下，在通过物质时，$K^+,K^0$通常比$K^-,overline(K)^0$具有更长的相互作用平均自由程。

// 课后讲义PDF第32页。
#block(breakable: false)[
#example(subname: [课堂单选：奇异夸克的奇异数])[
  奇异夸克的奇异数是：A.$+1$；B.$-1$；C.$0$；D.$+1/2$。

  按定义$S(s)=-1$，故选B。其电荷为$-1/3$，自旋为$1/2$，三者不能混淆。
]
]

// 讲义第30至35页。
== 带电$π$介子的量子数 (Quantum numbers of the charged pion)

// 课后讲义PDF第34页。
本节进一步说明π介子的质量、寿命和自旋怎样测得；课件再次展示前面的两张PDG表，并提醒Particle Data Book每两年更新一次。引用表中数据时需保留其版本，而不能把历史表中的所有数值都写成新的实验结果。

=== $pi$介子质量的测量

质量需要由独立的运动学观测量求出。已知磁场中的曲率给出动量，核乳胶中的射程结合能损标定给出动能，再由
$
  m^2=E^2-p^2
$
确定质量。若直接测得的是动能$T=E-m$，则可改写为
$
  p^2=T^2+2m T, quad m=(p^2-T^2)/(2T)
$
#newpara()

1951年Burfening等利用$380 "MeV"$的$α$束打靶。在Berkeley 回旋加速器中，次级$π$介子在加速器磁场下偏转击中相应的核乳胶探测器，动量由$π$介子进入核乳胶的位置、角度以及靶的位置确定，能量由$π$介子在核乳胶中的径迹长度确定。

// 课后讲义PDF第35页。
#block(breakable: false)[
#figure(
  image("pic/ch2/pion-mass-apparatus.png", width: 90%),
  caption: [Burfening等的π介子质量测量装置：α束、铜屏蔽和两侧核乳胶的位置关系],
)
]

结合磁场偏转和核乳胶射程，得到历史测量值
$
  m_(pi^+)=(141.5 plus.minus 0.6) "MeV", quad
  m_(pi^-)=(140.8 plus.minus 0.7) "MeV"
$
现代常用的近似质量为$m_(pi^plus.minus) approx 139.57 "MeV"$。正负π介子质量相同是粒子与反粒子关系的重要检验。

课件列出的精确值为$m_(pi^plus.minus)=(139.57018 plus.minus 0.00035) "MeV"$，保留此数值作为讲义所引实验精度。

=== $pi$介子固有寿命的测量

Chamberlain等在1951年利用

$340 "MeV"$的$gamma$束（Berkeley synchrotron），通过
$
  gamma+p -> pi^++n
$
产生$π$介子。粒子穿过第一个闪烁体，在第二个闪烁体中停止在其中衰变，停止信号与随后的
$
  pi^+ -> mu^+nu_mu
$
信号之间的时间差给出衰变时间；$μ$子再衰变产生的信号用于辅助识别。

#figure(
  image("pic/ch2/pion-lifetime.png", width: 95%),
  caption: [停止π介子的寿命测量示意，延迟符合将粒子停止与随后衰变联系起来],
)

对于停止的粒子，实验室时间就是固有时间。剩余粒子数及衰变时间概率密度分别为
$
  N(t)=N_0 e^(-t/tau), quad f(t)=1/tau e^(-t/tau), quad t>=0
$
实验记录了554个事例，得到$tau=(26.5 plus.minus 1.2) "ns"$。

课件列出的精确参考值为$(26.033 plus.minus 0.005) "ns"$。停止的$mu^+$在约$2.2 "mu s"$后衰变成$e^+$，提供另一时标。常用精确近似值为$tau_(pi^plus.minus) approx 26.03 "ns"$，对应$c tau approx 7.80 "m"$。真实时间谱拟合还需处理时间分辨、触发时间窗及偶然符合本底。

=== 用细致平衡确定自旋

质量和寿命不能确定粒子自旋。比较同一质心能量下的互逆反应
$
  pi^++d -> p+p, quad p+p -> pi^++d
$
其中$d$为氘核，$s_d=1$，而$s_p=1/2$。令$p_pi$表示$pi d$道的质心动量大小，$p_p$表示$p p$道的质心动量大小。

对未偏振的二体过程，在全立体角内积分并对末态自旋求和，截面具有结构
$
  sigma(a b -> c d)=1/(64 pi^2 s) p_f/p_i
  1/((2s_a+1)(2s_b+1)) 1/S_f
  integral dd(Omega) sum_"spins" abs(M_(f i))^2
$
$S_f$为末态全同粒子的对称因子。对$p p$末态有$S_f=2!$，避免在完整相空间积分中重复计数；初态自旋平均不包含这个因子。

在时间反演不变的强相互作用中，适当反转动量和自旋后，正逆反应的自旋求和振幅模平方相同。因此
$
  sigma(pi^+ d -> p p)/sigma(p p -> pi^+ d)
  =p_p^2/p_pi^2 1/2 ((2s_p+1)^2)/((2s_pi+1)(2s_d+1)) (sum_(pi^+ d -> p p) abs(M)^2)/(sum_(p p -> pi^+ d) abs(M)^2)
$
细致平衡原理给出
$
  sum_(pi^+ d -> p p) abs(M)^2=sum_(p p -> pi^+ d) abs(M)^2
$
从而
$
  sigma(p p -> pi^+ d)/sigma(pi^+ d -> p p) & = p_pi^2/p_p^2 (2(2s_pi+1)(2s_d+1))/((2s_p+1)^2) \
                                            & = p_pi^2/p_p^2 (3(2s_pi+1))/2
$
于是可由测量值反推
$
  2s_pi+1=2/3 p_p^2/p_pi^2
  sigma(p p -> pi^+ d)/sigma(pi^+ d -> p p)
$
历史实验给出$2s_pi+1=0.97 plus.minus 0.31$，与$s_pi=0$相符。

// 课后讲义PDF第37–38页。
吸收截面于1951年测得，相同质心能量的产生截面于1953年测得。按课件原先采用的“吸收/产生”方向，关系为
$
  sigma(pi^+d -> p p)/sigma(p p -> pi^+d)
  =p_p^2/p_pi^2 ((2s_p+1)^2)/(2(2s_pi+1)(2s_d+1))
  =2/(3(2s_pi+1)) p_p^2/p_pi^2
$
在形成比值前，两道的微分截面分别为
$
  dv(sigma_("abs"),Omega) prop p_p/p_pi
  1/((2s_pi+1)(2s_d+1)) 1/2 sum_(f,i) abs(M_(f i))^2 \
  dv(sigma_("prod"),Omega) prop p_pi/p_p
  1/((2s_p+1)^2) sum_(f,i) abs(M_(f i))^2
$
这保留了末态两个相同质子的$1/2$因子。

#block(breakable: false)[
#note(subname: [比较截面时要保持的条件])[
  正逆反应必须在相同$s$下比较，并使用一致的全相空间及全同粒子计数约定。动量因子、自旋平均因子和末态$1/2!$都不可省略。
]
]
#newpara()

=== 中性$π$介子及性质

π介子是*赝标量介子*：赝是因为它在空间反演下取负号，标量是因为自旋为零。带电态$pi^plus.minus$的$J^P=0^-$，中性态的$J^(P C)=0^(-+)$。中性态质量约$134.98 "MeV"$，略小于带电态。

#figure(
  three-line-table[
    | 粒子 | 质量 | 固有寿命 | 主要衰变与作用类型 | $J^P$或$J^(P C)$ | 价夸克 |
    | --- | --- | --- | --- | --- | --- |
    | $pi^plus.minus$ | $139.57 "MeV"$ | $2.60 times 10^(-8) "s"$ | $mu^plus.minus nu$，弱衰变 | $0^-$ | $u overline(d)$或$d overline(u)$ |
    | $pi^0$ | $134.98 "MeV"$ | $8.43 times 10^(-17) "s"$ | $gamma gamma$，电磁衰变 | $0^(-+)$ | $(u overline(u)-d overline(d))/sqrt(2)$ |
  ],
  caption: [带电与中性π介子的性质比较],
)

$pi^0 -> gamma gamma$的分支比约为$98.8%$，另有约$1.17%$的$pi^0 -> e^+e^-gamma$衰变。#footnote[数值参见 #link("https://pdg.lbl.gov/2024/listings/rpp2024-list-pi-zero.pdf")[PDG 2024: $π⁰$]。]

// 课后讲义PDF第39页。
课件原页给出$m_(pi^0)=(134.9766 plus.minus 0.0006) "MeV"$，并与$m_(pi^plus.minus)=(139.57018 plus.minus 0.00035) "MeV"$比较；寿命为$(8.43 plus.minus 0.13) times 10^(-17) "s"$，引用Science 368 (2020), 6490, 506–509。原页将两光子分支比写作$99.8%$，与前面PDG原表的约$98.798%$不一致；这里保留原页说法并明确指出这一差别。

质量相近的粒子寿命仍可相差许多数量级，因为寿命取决于允许的相互作用、选择定则、耦合强度和末态相空间，而不是只由质量决定。

// 课后讲义PDF第40页：π0→γγ的夸克图课堂题；下图据题意重新绘制。
#example(subname: [中性π介子的两光子衰变图])[

  *课件第40页原题（主观题，2分）*：假设$pi^0$是$u$夸克和反$u$夸克的束缚态，试画$pi^0 -> gamma gamma$衰变过程的费曼图。

  先按课堂题把初态简化为$u overline(u)$束缚态。在电磁顶点，带电夸克可与光子耦合；夸克与反夸克湮灭到两个光子的最低阶示意有两种连接次序：

  #figure(
    image("pic/ch2/pion-two-photon-diagrams.svg", width: 94%),
    caption: [夸克–反夸克湮灭到两个光子的两种连接次序；实线上的箭头表示费米子流，内部线是虚夸克],
  )

  两个末态光子相同，交换$gamma_1$与$gamma_2$得到的图都必须计入振幅。真实的π介子在同位旋近似下是$(u overline(u)-d overline(d))/sqrt(2)$，还需计入$d overline(d)$分量及束缚态的自旋、颜色和空间波函数，不能把它当作两个自由在壳夸克的碰撞。上述图用于辨认电磁顶点和光子连接次序，并不单独给出π介子的完整衰变宽度。
]
#newpara()

#block(breakable: false)[
#note(subname: [电子偶素与夸克偶素])[
  电子偶素$e^+e^-$、$μ$子偶素$mu^+mu^-$和夸克偶素$q overline(q)$都是Fermion-antiFermion复合态，但并不都具有总自旋零：两个自旋$1/2$可耦合成单态或三态，还可有轨道角动量。比较两光子衰变时，必须先选定束缚态的量子数；“由粒子与反粒子组成”本身不能决定自旋和允许的衰变道。
]
]

// 讲义第37至63页。
== 带电轻子和中微子 (Charged leptons and neutrinos)

=== 三代轻子

1897年J.J. Thomson发现电子，1932年Chadwick发现中子；Anderson在1932年发现正电子，并于1933年发表详细报告。1937年宇宙线中发现$μ$子，1962年BNL的Lederman、Schwartz和Steinberger实验确认了$ν_μ$的存在。1975年SLAC的Perl等在$e^+e^-$对撞机中发现了第三代带电轻子$τ$；$ν_τ$的直接观测由DONUT实验于2000年完成。

三种带电轻子$e^-,mu^-,tau^-$的电荷都是$-e$，自旋都是$1/2$，质量约为
$
  m_e=0.511 "MeV", quad m_mu=105.7 "MeV", quad m_tau=1.777 "GeV"
$
它们各有带相反电荷的反粒子。

// 课后讲义PDF第42、44页。
原页的轻子表采用GeV为质量单位，给出$e$为$0.000511$、$mu$为$0.106$、$tau$为$1.7771$，三种中微子的旧直接上限依次为$10^(-8)$、$0.0002$、$0.02$；三种带电轻子电荷均为$-1$，中微子均为0，自旋均为$1/2$。这些表格中的旧上限与本页另外新增的$0.45 "eV"$不是同一版数据，不能当成同时更新后的数值。
#block(breakable: false)[
#figure(
  image("pic/ch2/lepton-mass-source-table.png", width: 58%),
  caption: [课件所用的轻子质量、电荷和自旋原表。下文单独说明新增0.45 eV上限对应的观测量],
)
]

#figure(
  three-line-table[
    | 粒子 | 质量 | 固有寿命 | $J$ | 电荷 | 主要衰变道 |
    | --- | --- | --- | --- | --- | --- |
    | $e^plus.minus$ | $0.511 "MeV"$ | $>10^21 "yr"$ | $1/2$ | $plus.minus 1$ | 稳定 |
    | $nu_e$ | $m_beta<0.45 "eV"$ | 稳定 | $1/2$ | $0$ | 电子中微子 |
    | $mu^plus.minus$ | $105.7 "MeV"$ | $2.20 "μs"$ | $1/2$ | $plus.minus 1$ | $mu^+ -> e^+ + nu_e + overline(nu)_mu$ |
    | $nu_mu$ | $<0.17 "MeV"$ | 稳定 | $1/2$ | $0$ | $μ$子中微子 |
    | $tau^plus.minus$ | $1.777 "GeV"$ | $2.90 times 10^(-13) "s"$ | $1/2$ | $plus.minus 1$ | $tau^+ -> e^+ + nu_e + overline(nu)_tau$ |
    | $nu_tau$ | $<18.2 "MeV"$ | 稳定 | $1/2$ | $0$ | $τ$子中微子 |
  ],
  caption: [三代带电轻子及其中微子],
)

=== 带电轻子

==== $τ$子的寻找

#block(breakable: false)[
#figure(
  grid(columns: (1fr,), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-perl.png", height: 2.4cm)

#text(size: 10pt)[M. Perl]],
  ),
  caption: [课件第43页的Perl肖像],
)
]

在正负电子对撞机中，可以通过
$
  e^+e^- -> tau^+tau^-
$
寻找新的带电轻子，其产生阈值为$sqrt(s)>=2m_tau approx 3.55 "GeV"$。对称对撞时，每束能量需至少达到约$1.78 "GeV"$；1967年的ADONE正负电子对撞机单束$1.5 "GeV"$的机器不能达到该阈值。

τ子可以发生轻子衰变，例如
$
  tau^+ -> e^+ + nu_e + overline(nu)_tau \
  tau^- -> mu^- + overline(nu)_mu + nu_tau
$
联合起来，实验中观测到$e^+mu^-$及不可见能量，也可能观测到电荷共轭的$e^-mu^+$。末态有四个中微子，故两条可见径迹通常不背靠背，也不要求与束流方向共面。

这与没有不可见粒子的二体过程$e^+e^- -> e^plus.minus mu^minus.plus$不同，后者改变电子与$μ$子味轻子数。

// 课后讲义PDF第43页：可见eμ径迹事例。
#block(breakable: false)[
#figure(image("pic/ch2/tau-spear-emu-event.png", width: 43%), caption: [课件中的SPEAR反常eμ事例小图：可见径迹需要结合不可见末态解释])
]

Perl等在1970年代中期的SLAC-SPEAR实验中用反常的$e mu$事例建立了$τ$子的证据。1992年，北京正负电子对撞机的BES实验进一步利用阈值扫描精确测量$τ$子质量。

// 课后讲义PDF第43页。
课件按以下三个实验节点排列：1967年ADONE，束流能量$1.5 "GeV"$，未找到$tau$；1976年SLAC–SPEAR，束流能量标为$4 "GeV"$，找到$tau$；1992年BES精密测量质量。原页逐项划去
$
  e^+e^- -> e^+mu^-, quad e^+e^- -> e^-mu^+
$
并以$e^+e^- -> tau^+tau^-$及其后续四中微子衰变解释反常的可见$e mu$末态。
#block(breakable: false)[
#note(subname: [补充：这里的轻子数与历史年份])[
  原页“轻子数守恒禁止直接$e mu$二体末态”指逐味轻子数，不是总轻子数；四个中微子保证完整末态的逐味计数在相应近似下相容。上面的1976年是课件列出的节点，前面介绍的1975年对应最初发表的证据；两者所指的历史节点不同。#footnote[M. L. Perl等，#link("https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.35.1489")[Evidence for Anomalous Lepton Production in e⁺e⁻ Annihilation]，Phys. Rev. Lett. 35, 1489 (1975)。]
]
]

=== 中微子的假说与发现

==== $β$衰变的连续能谱与中微子假说

中微子的质量非常小，且不带电，仅参与弱相互作用
$
  sigma_(nu N) tilde 10^(-43) "cm"^2
$
非常难于直接探测。

// 课后讲义PDF第44页新增0.45 eV；区分直接β衰变有效质量与质量本征值。
#block(breakable: false)[
#note(subname: [讲义中的中微子质量上限])[
  课后讲义给出的$0.45 "eV"$上限对应β衰变运动学所探测的*有效电子中微子质量*$m_beta$。若以$nu_i$表示质量为$m_i$的质量本征态，$U$为轻子混合矩阵，则
  $
    m_beta^2=sum_i abs(U_(e i))^2 m_i^2
  $
  因而它不是给电子味态指定一个独立的静质量，也不表示三个$m_i$都等于同一数值。表中$mu$味、$tau$味的较宽松直接上限来自不同过程和实验条件，不能据此排出三种中微子的真实质量层次。截面$10^(-43) "cm"^2$也仅是本节低能弱反应的数量级示例；实际截面依赖中微子能量、味和靶。
  #footnote[这里采用课后讲义引用的2025年KATRIN直接β衰变有效质量上限$0.45 "eV"$（90%置信水平），见 #link("https://www.katrin.kit.edu/1271.php")[KATRIN合作组2025年结果]。它与宇宙学拟合中的质量和上限、无中微子双β衰变中的有效Majorana质量是不同的观测量。]
]
]
#newpara()

// 课后讲义PDF第45、49页：自由程与截面单位换算。
#block(breakable: false)[
#example(subname: [由截面比较估算中微子在铅中的自由程])[

  *课件原题（单选，1分）*：已知中子在铅中的碰撞长度$17 "cm"$，假设中子与铅原子核的反应截面为$2000 "mb"$，估算中微子在铅中的碰撞长度。原题同时给$1 "mb"=10^(-31) "m"^2=10^(-27) "cm"^2$。

  选项：A.$1.7 times 10^16 "m"$；B.$1.7 times 10^10 "m"$；C.$1.7 times 10^8 "m"$；D.$1.7 "m"$。课件标出A，下面直接核算题给数据。

  对同一种均匀靶，碰撞长度为$lambda=1/(n sigma)$，其中$n$为靶粒子数密度。若中子在铅中的碰撞长度为$lambda_n=17 "cm"$，与铅核的反应截面取$sigma_n=2000 "mb"$，并把中微子–铅核截面也按课堂题近似取为$sigma_nu=10^(-43) "cm"^2$，则
  $
    sigma_n=2000 times 10^(-27) "cm"^2
      =2 times 10^(-24) "cm"^2, quad
    10^(-43) "cm"^2=10^(-47) "m"^2
  $
  消去共同的靶数密度，得到
  $
    lambda_nu=lambda_n sigma_n/sigma_nu
      =0.17 "m" times (2 times 10^(-24))/(10^(-43))
      approx 3.4 times 10^18 "m"
  $
  这说明通常的物质屏蔽很难挡住中微子。注意题目给定的$2000 "mb"$与该截面对应的结果是$3.4 times 10^18 "m"$；课件标出的选项$1.7 times 10^16 "m"$不能由这些输入同时得到。此外，若引用的是每个核子的截面，不能直接当作每个铅核的截面使用，必须先统一靶的定义。
]
]
#newpara()

#block(breakable: false)[
#figure(
  grid(columns: (1fr,), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-pauli.png", height: 2.4cm)

#text(size: 10pt)[W. Pauli]],
  ),
  caption: [课件第46页的Pauli肖像],
)
]

1899，发现$β$射线是电子流；1930年之前，人们认为$β$射线是二体过程
$
  ""^A_Z X -> ""^A_(Z+1) Y + e^-
$

若静止母核$M$只发生二体衰变，则由四动量守恒，电子的总能量固定为
$
  E_e = sqrt(m_2^2 + p^2) = (M^2+m_e^2-m_1^2)/(2M)
$
但$β$衰变电子的能谱是连续的。Pauli于1930年提出末态还存在一个难以观测的中性粒子(neutron，后面发现和中子不是一个粒子，Fermi改名为neutrino)，共同带走能量和动量。现代写法为
$
  n -> p+e^-+overline(nu)_e
$
三体末态允许电子和反中微子连续地分享释放能量，因此不需要放弃能量守恒。

// 课后讲义PDF第46页。
课件将Bohr曾考虑的“能量不守恒”同Pauli的“末态还有一个中性粒子带走能量”对照。$""^210 "Bi"$的电子能谱展示从零到端点的连续分布，横轴是电子动能；这正是用两体运动学无法说明的事实。
#block(breakable: false)[
#figure(
  image("pic/ch2/beta-spectrum-bi210.png", width: 90%),
  caption: [课件中的²¹⁰Bi β衰变连续电子能谱；曲线横轴为动能],
)
]

==== 反电子中微子：反应堆与延迟符合

Reines和Cowan利用反应堆产生的反电子中微子$Phi=10^17 "m"^(-2) "s"^(-1)$，通过*逆$β$衰变*（inverse beta decay, IBD）

开展Savannah River实验（1953–1956）；Reines于1995年因中微子探测获得Nobel奖。反应堆反中微子具有上限约几MeV的连续能谱，反应为
$
  overline(nu)_e+p -> e^++n, sigma tilde 10^(-43) "cm"^2
$
进行探测。

#block(breakable: false)[
#figure(
  grid(columns: (1fr, 1fr), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-reines.png", height: 2.4cm)

#text(size: 10pt)[F. Reines]],
    align(center)[#image("pic/ch2/portrait-cowan.png", height: 2.4cm)

#text(size: 10pt)[C. Cowan]],
  ),
  caption: [课件第48页的反中微子实验研究者],
)
]

静止质子靶上的阈值可由不变量求得
$
  s=m_p^2+2m_p E_nu, quad
  E_(nu,"th")=((m_n+m_e)^2-m_p^2)/(2m_p) approx 1.806 "MeV"
$
所以并非反应堆产生的每一个反中微子都能通过IBD被记录。

一次信号有两部分：
- *瞬发信号*：正电子减速并与电子湮灭，产生两个约$0.511 "MeV"$的光子，连同正电子的能损形成闪烁信号
- *延迟信号*：中子慢化后被捕获，产生俘获$γ$射线。历史实验在水靶中加入含镉材料，以获得较明显的中子俘获信号
要求两类信号在合理的时间间隔和空间区域内符合，可大幅减少不相关的本底。

// 课后讲义PDF第47–48页。
原装置用含$"CdCl"_2$的水靶，每个水槽约$100 "L"$；相邻液体闪烁体槽各约$1000 "L"$，由PMT读出闪光。水提供自由质子，镉增强中子俘获信号。课件示波器记录的两组脉冲间隔$Delta t=13.5 "mu s"$，正电子对应瞬发符合，随后中子俘获给出延迟符合。
#block(breakable: false)[
#figure(
  image("pic/ch2/reines-cowan-apparatus.png", width: 70%),
  caption: [Reines–Cowan探测器：含镉水靶与液体闪烁体交替排列],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/reines-cowan-oscillograms.png", width: 94%),
  caption: [课件原示波器脉冲记录：正电子与中子俘获信号相隔13.5 μs],
)
]

#figure(
  image("pic/ch2/inverse-beta-signal.png", width: 70%),
  caption: [逆$β$衰变的瞬发正电子信号与延迟中子俘获信号],
)

反应堆通量约$10^17 "m"^(-2) "s"^(-1)$，约$200 "kg"$水靶中含自由质子
$
  N_p=2 (2 times 10^5 "g")/(18 "g mol"^(-1)) N_A
  approx 1.34 times 10^28
$
若用$10^(-47) "m"^2$作为有效截面的粗略示例，则产生率为
$
  R=Phi sigma N_p tilde 1.3 times 10^(-2) "s"^(-1)
$
历史实验得到每小时约$3 plus.minus 0.2$个信号事例；主要本底包括反应堆中子、宇宙线及材料放射性。

课件用$sigma approx 10^(-47)(E_nu/"MeV")^2 "m"^2$表示低能反应截面的近似能量依赖，并把$200 "kg"$水靶的有效反应率估为$10^(-3) "Hz"$。上面的$1.3 times 10^(-2) "s"^(-1)$只是将单一代表截面乘通量和全部自由质子数的粗估；与实验记录率比较，还必须积分能谱，并计入阈值、几何接受度、符合和探测效率。1956年的观测距离1930年的预言约25年。

// 课后讲义PDF第49页。
#block(breakable: false)[
#example(subname: [课堂单选：回顾中微子反应截面])[
  中微子与核子反应截面的数量级是：A.$10^(-47) "m"^2$；B.$10^(-43) "m"^2$；C.$10^(-30) "m"^2$；D.$10^(-23) "m"^2$。

  本节所用低能数量级$10^(-43) "cm"^2=10^(-47) "m"^2$，故选A。能量不同，截面也不同。
]
]

==== $μ$子中微子与$τ$子中微子

考虑
- $β$衰变中微子
  $
    n -> p + e^- + overline(nu)_e
  $
- $π$介子衰变中微子
  $
    pi^+ -> mu^+ + nu_mu, quad
    pi^- -> mu^- + overline(nu)_mu
  $
$β$衰变产生的$overline(nu)_e$与$π$衰变产生的$overline(nu)_mu$是否相同，可以看它们在带电流反应中产生哪一种带电轻子。

// 课后讲义PDF第50页。
原页提出的直接比较是：已知$overline(nu)_e+p -> e^++n$，那么$overline(nu)_mu+p -> e^++n$是否也发生？这把“有没有第二种中微子”的问题转化成对末态电子与μ子的实验区分。

#block(breakable: false)[
#figure(
  grid(columns: (1fr, 1fr, 1fr), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-lederman.png", height: 2.4cm)

#text(size: 10pt)[L. M. Lederman]],
    align(center)[#image("pic/ch2/portrait-schwartz.png", height: 2.4cm)

#text(size: 10pt)[M. Schwartz]],
    align(center)[#image("pic/ch2/portrait-steinberger.png", height: 2.4cm)

#text(size: 10pt)[J. Steinberger]],
  ),
  caption: [课件第51页的第二种中微子实验研究者],
)
]

1962年BNL的Lederman、Schwartz和Steinberger实验用质子束打靶产生$π$介子，让其飞行衰变形成中微子束，再用厚屏蔽吸收大部分强子和$μ$子。大质量火花室同时作为靶和探测器，寻找
$
  nu_mu+n -> mu^-+p, quad overline(nu)_mu+p -> mu^++n
$
若它们就是电子型中微子，在足够能量下应相应产生电子型事例。实验观察到以$μ$子径迹为特征的反应，没有出现与“同一种中微子”假设相符的电子簇射数目，因此确立了第二种中微子。电子与$μ$子的区分依赖第一章介绍的电磁簇射和穿透能力。该实验在1988年获得Nobel奖。

// 课后讲义PDF第51–52页。
装置以$13 "m"$厚的铁层作屏蔽。由于截面小，探测器必须同时提供约$10 "t"$的靶物质，课件强调不能只用低密度气泡室，而采用多层火花室，其极板本身即为中微子的反应靶。电子容易产生电磁簇射，μ子留下穿透性强的径迹；这使二者能够鉴别。
#block(breakable: false)[
#figure(
  image("pic/ch2/bnl-neutrino-beam.png", width: 90%),
  caption: [BNL–AGS第二种中微子实验的质子束、π衰变、中微子束、屏蔽与火花室的布局],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/bnl-iron-spark-chambers.png", width: 95%),
  caption: [13 m铁屏蔽与火花室。原课件旁列清华火花室照片],
)
]

第三代中微子由Fermilab的DONUT实验于2000年直接观测。质子打靶产生含粲粒子，典型的源过程为
$
  D_s^+ -> tau^+ + nu_tau, quad
  D_s^- -> tau^- + overline(nu)_tau
$
$τ$子的后续衰变也产生$τ$味中微子。探测端的带电流过程为
$
  nu_tau+N -> tau^-+X, quad
  overline(nu)_tau+N -> tau^++X
$
其中$X$为强子末态。$τ$子寿命很短，实验利用核乳胶的高空间分辨寻找短τ径迹及其衰变折点。这里中微子产生$tau^-$，反中微子产生$tau^+$。

// 课后讲义PDF第53页。
#block(breakable: false)[
#figure(
  image("pic/ch2/donut-detector-and-kink.png", width: 90%),
  caption: [DONUT的探测器与τ衰变折点。示意保留钢屏蔽、核乳胶/Scintillating-fibre平面、磁铁、漂移室、量能器和μ鉴别层],
)
]

#block(breakable: false)[
#note(subname: [补充：DONUT原页的电荷标签])[
  原页把源和探测简写为$D_s -> tau+nu_tau$、$nu_tau+N -> tau+"hadrons"$，其中“$tau$”旁的加号起连接末态的作用。区分粒子电荷时，应使用上面写出的$tau^-$与$tau^+$及相应中微子、反中微子；不要从简写误读为中微子必产生正τ。
]
]

==== Z宽度与轻中微子的数目

中微子在$Z$衰变中不可见，但会增加$Z$的总宽度。由可见末态测出总宽度及各可见分宽度，可以推得
$
  Gamma_"inv"=Gamma_Z-Gamma_"visible", quad
  N_nu=Gamma_"inv"/Gamma_(nu overline(nu))^"SM"
$
分母是一种具有标准模型耦合的轻中微子所贡献的分宽度。增加不可见道会改变共振峰的高度和宽度；在简化的Breit-Wigner近似中
$
  sigma_(e^+e^- -> f overline(f))(s)
  approx (12 pi Gamma_(e e) Gamma_(f f))/((s-m_Z^2)^2+m_Z^2 Gamma_Z^2)
$
精密分析还需考虑辐射修正及束流效应。

#figure(
  image("pic/ch2/z-lineshape.png", width: 78%),
  caption: [Z共振线形对轻中微子数目的敏感性。图中比较两、三、四种轻中微子的预言，数据支持三种],
)

这个结论约束的是质量足够小、能够在$Z$衰变中产生且具有相应弱耦合的*活性中微子*。它不能单独排除$m>m_Z/2$的中性粒子，也不能用同样方法排除不直接耦合$Z$的惰性中微子。#footnote[定义和分析条件参见 #link("https://pdg.lbl.gov/encoder_listings/s007.pdf")[PDG: Number of Light Neutrino Types from Collider Experiments]。]

=== 螺旋度、手征性和轻子数

对自旋$1/2$粒子，采用本征值为$plus.minus 1$的螺旋度(helicity)算符
$
  h=(2 vb(S) dot vb(p))/abs(vb(p))
$
自旋与动量反平行时$h=-1$，平行时$h=+1$。在*忽略中微子质量*的弱作用近似中，观测到左螺旋中微子与右螺旋反中微子。

// 课后讲义PDF第55页。
课件原式写作$H=(vb(p) dot vb(sigma))/(abs(vb(p)) abs(vb(sigma)))$。这里若把$vb(sigma)$理解为自旋方向矢量，它表达的是两个方向的归一化内积；若将其理解为Pauli矩阵，则应采用前面规范的螺旋度算符，而不再除以$abs(vb(sigma))$。

课件把“如果中微子没有质量，则螺旋度固定”与图中的方向配对：中微子动量向右、自旋向左，反中微子动量向右、自旋向右；分别标Left-handed与Right-handed。原页用动量与自旋方向的归一化内积来表示这一取值。
#block(breakable: false)[
#figure(
  image("pic/ch2/neutrino-helicity.png", width: 90%),
  caption: [课件的中微子/反中微子螺旋度方向图],
)
]

#block(breakable: false)[
#note(subname: [螺旋度不等于手征性])[
  对有质量粒子，沿动量方向的Lorentz变换可以改变动量方向而不反转自旋，因而螺旋度可依赖参考系。

  手征性则由Dirac旋量上的投影算符$P_(L,R)=(1 minus.plus gamma^5)/2$定义。二者在无质量极限具有简单对应；在$E >> m_nu$时，错误螺旋度的弱作用振幅受到$m_nu/E$抑制。

  中微子是否为Dirac或Majorana粒子，也不能只由电中性或螺旋度判断。
]
]

#block(breakable: false)[
#note(subname: [Majorana粒子])[
  Majorana粒子是其自身的反粒子。若中微子为Majorana粒子，相应场在电荷共轭意义下自共轭，不再携带一个精确区分粒子与反粒子的守恒轻子数。不过，弱作用中按伴随带电轻子的电荷及螺旋度区分的“中微子”“反中微子”实验标签仍有意义，并非无法区分产生或探测信号。Majorana质量项违反总轻子数；常见高能弱过程中的分味计数仍可作为忽略微小质量效应的近似。
]
]

=== 非加速器中微子的来源

不同源覆盖很不相同的能量范围。

#figure(
  image("pic/ch2/neutrino-sources.png", width: 88%),
  caption: [宇宙背景、太阳、反应堆、大气及高能天体中微子的能区示意],
)

==== 大气中微子

宇宙线打入大气后产生$π$介子等次级强子。

// 课后讲义PDF第57页。
原图从入射质子与大气分子的碰撞开始，列出$pi^+$、$pi^-$、$pi^0$和中子等次级粒子；带电π的衰变给出μ子与中微子，$pi^0 -> gamma gamma$继而形成$e^+e^-$簇射。课件标出这里讨论的中微子能量为几十MeV以上，并问其到达方向。
#block(breakable: false)[
#figure(
  image("pic/ch2/atmospheric-neutrino-shower.png", width: 90%),
  caption: [大气簇射中强子、电磁与中微子分支],
)
]若$π$和随后产生的$μ$子都充分衰变
$
  pi^+ -> mu^+nu_mu, quad mu^+ -> e^+nu_e overline(nu)_mu\
  pi^- -> mu^- overline(nu)_mu, quad mu^- -> e^- overline(nu)_e nu_mu
$
每条链给出两个$μ$味中微子或反中微子，以及一个电子味中微子。连同负电荷链，源端的简单计数预言为
$
  Phi(nu_mu+overline(nu)_mu)/Phi(nu_e+overline(nu)_e) approx 2
$
这一比值适用于相应的低能、充分衰变近似。高能$μ$子可能在到达地面前来不及衰变，$K$介子贡献也会改变比值；传播振荡进一步改变探测到的味组成。

大气源分布在地球周围，大气中微子可以在任何方向上被探测到。向下事件的传播距离通常为几十千米，向上事件可穿过地球、传播约$10^4 "km"$，所以天顶角分布提供了不同的传播基线。


==== 太阳中微子

太阳核聚变链包括
$
  p+p -> d+e^++nu_e, quad p+e^-+p -> d+nu_e
$
以及$""^7"Be"$电子俘获、$""^8"B"$的$β$衰变等中微子源。总的聚变反应可概括为
$
  4p -> ""^4"He"+2e^++2nu_e+"energy"
$
主要太阳核反应在源端产生$nu_e$，没有$overline(nu)_e$，能量通常低于$20 "MeV"$。到达地球时，由于振荡及太阳物质效应，已不再是纯电子味。

// 课后讲义PDF第58页。
课件的完整$p p$链从两种起始反应分支，随后为
$
  ""^2 "H"+p -> ""^3 "He"+gamma
$
再分为$2 ""^3 "He" -> ""^4 "He"+2p$，以及$""^3 "He"+""^4 "He" -> ""^7 "Be"+gamma$。后者通过
$
  ""^7 "Be"+e^- -> ""^7 "Li"+nu_e, quad
  ""^7 "Li"+p -> 2 ""^4 "He"
$
或
$
  ""^7 "Be"+p -> ""^8 "B"+gamma \
  ""^8 "B" -> ""^8 "Be"^*+e^++nu_e, quad
  ""^8 "Be"^* -> 2 ""^4 "He"
$
结束；还列出稀有hep反应$""^3 "He"+p -> ""^4 "He"+e^++nu_e$。图中标出各分支比例，能谱同时显示$p p$、pep、$""^7 "Be"$线、$""^8 "B"$、hep与CNO中微子贡献。
#block(breakable: false)[
#figure(
  image("pic/ch2/solar-pp-chain.png", width: 79%),
  caption: [课件的完整太阳pp链及各分支比例],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/solar-neutrino-spectrum.png", width: 92%),
  caption: [课件的太阳中微子能谱：连续谱与单能线并存],
)
]

==== 反应堆中微子

裂变产物通常富中子，连续的$β$衰变产生$overline(nu)_e$，典型能量为几$"MeV"$。以每次裂变释放约$200 "MeV"$、产生约六个反中微子估算，热功率$P_"th"=1 "GW"$时
$
  R_"fission" approx (10^9 "J s"^(-1))/(200 times 1.602 times 10^(-13) "J")
  approx 3.1 times 10^19 "s"^(-1)
$
故总发射率约$2 times 10^20 "s"^(-1)$。这里使用的是*热功率*，且计数包括低于IBD阈值的反中微子。

// 课后讲义PDF第59页。
原页逐一比较$""^235 "U"$、$""^238 "U"$、$""^239 "Pu"$及$""^241 "Pu"$每次裂变的中微子能谱（Vogel与Engel），并以反应堆建筑与堆芯照片说明源的位置。横轴为中微子能量，纵轴为每次裂变、每MeV的反中微子数。
#block(breakable: false)[
#figure(
  image("pic/ch2/reactor-neutrino-spectrum.png", width: 66%),
  caption: [不同裂变核素的反应堆反中微子能谱],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/reactor-core-source.png", width: 69%),
  caption: [课件中的反应堆与堆芯源示意],
)
]

==== 超新星中微子

大质量恒星核心坍缩
$
  "Fe" + gamma -> p + n + X
$
电子俘获
$
  p+e^- -> n+nu_e
$
可形成短暂的电子中微子爆发；随后原中子星在秒至十秒量级通过中微子冷却，产生各味中微子与反中微子。能谱、时间分布和味组成分别提供核心温度、爆发演化及传播的信息。中微子能比电磁信号更直接地携带致密核心的物理信息。

// 课后讲义PDF第60页。
课件按六个阶段画出核心坍缩：①开始坍缩；②中微子俘获；③$t=0$附近激波形成；④$t<10 "ms"$的中子化爆发；⑤约$1–10 "s"$的中微子冷却；⑥数小时后的超新星爆发，留下约$10 "km"$的中子星。时间谱分别画$nu_e$、$overline(nu)_e$与$nu_x$的发射率：初期电子中微子尖峰与随后各味冷却信号不同。原图据T. Totani、K. Sato、H. E. Dalhed与J. R. Wilson，ApJ 496, 216 (1998)。
#block(breakable: false)[
#figure(
  image("pic/ch2/supernova-evolution.png", width: 90%),
  caption: [核心坍缩超新星的六阶段结构、尺度和时间],
)
]

#block(breakable: false)[
#figure(
  image("pic/ch2/supernova-neutrino-time.png", width: 63%),
  caption: [课件的超新星中微子发射时间分布],
)
]

// 课后讲义PDF第61页：为什么孤立氢原子不能自发电子俘获。
#block(breakable: false)[
#example(subname: [氢原子为什么不能自发变成中子？])[

  *课件第61页原题（主观题，2分）*：为什么氢原子里的电子不能和质子进行$e^-+p -> n+nu_e$？

  反应$e^-+p -> n+nu_e$守恒电荷、重子数与电子味轻子数，但守恒量子数只是反应允许的必要条件，还必须满足能量–动量守恒。

  对基态氢原子，以自然单位写其质量为
  $
    M_H=m_p+m_e-E_B, quad E_B=13.6 "eV"
  $
  而在氢原子静止系中，任何$n+nu_e$末态的总能量至少为$m_n$（忽略中微子质量）。可释放的能量为
  $
    Q=M_H-m_n=m_p+m_e-m_n-E_B
      approx -0.782 "MeV"<0
  $
  初态的总质量不足，因此孤立氢原子不能自发进行该反应。原子中的电子虽有动能，但它已经包含在束缚态总能量中，不能再额外计算一次来补足亏损。

  超新星核心中的电子俘获并不与此矛盾：高能电子及致密物质环境可以提供所需能量。其他原子核发生电子俘获时，也要比较相应母、子核及电子束缚态的总能量，而不能照搬自由质子的结论。
]
]
#newpara()

=== 稀有信号、本底与地下实验

对于单能、均匀通量，靶内反应率为$R=Phi sigma N_"target"$。若存在连续能谱、阈值和效率
$
  R=N_"target" integral dd(E_nu)
  dv(Phi, E_nu) sigma(E_nu) epsilon(E_nu)
$
这里$epsilon$包含触发、重建及选择效率。

#block(breakable: false)[
  #example(subname: [一千吨水中的太阳中微子与宇宙线$μ$子])[
    对
    $
      nu_e e^- -> nu_e e^-
    $
    弹性散射，$1 "kt"=10^9 "g"$水中的电子数为
    $
      N_e=(10^9 "g")/(18 "g mol"^(-1)) N_A times 10
      approx 3.35 times 10^32
    $
    若取地球上太阳中微子通量$Phi_nu=7 times 10^10 "cm"^(-2) "s"^(-1)$及有效截面$sigma=10^(-45) "cm"^2$，单位效率下
    $
      R_nu approx 2.3 times 10^(-2) "s"^(-1)
      approx 2 times 10^3 "day"^(-1)
    $
    每天$10^3$量级。

    课件第62页采用更粗的$N_"target" tilde 10^32$，写为$N_e tilde 0.01 "s"^(-1)$或$1000 "day"^(-1)$；上式保留水中每分子10个电子后得到约$2000 "day"^(-1)$，二者属于同一数量级估算。这里的电子味中微子–电子弹性散射在标准模型中同时含带电流与中性流贡献。

    实验中常见的干扰有宇宙线$mu$子。同样的一千吨水若做成边长约$10 "m"$的立方体，在海平面取$μ$子通量约$1 "cm"^(-2) "min"^(-1)$，通过上表面的速率估计为
    $
      R_mu approx (10^3 "cm")^2 times 1 "cm"^(-2) "min"^(-1)
      approx 1.7 times 10^4 "s"^(-1)
    $
    它比上述中微子反应率高约六个数量级。
  ]
]
#newpara()

$μ$子可以直接留下巨大信号，也可产生中子及放射性同位素，后续信号容易模拟中微子事例。降低本底的方法包括岩石覆盖、水或其他屏蔽层、主动$μ$子否决、洁净材料和时间、空间符合。

// 课后讲义PDF第63页。
课件具体列出三类$mu$子诱发过程：
$
  mu^-+N -> mu^-+N^++e^- \
  mu^-+N -> n+X \
  mu^-+N -> N_1+X, quad N_1 -> N_2+beta^-+overline(nu)_e
$
分别对应电离、次级中子和活化产物的延迟β衰变；这些信号可与目标中微子反应相似。

// 课后讲义PDF第64页。
#block(breakable: false)[
#figure(
  image("pic/ch2/vertical-muon-depth.png", width: 78%),
  caption: [课件中宇宙线μ子垂直强度随深度的曲线。横轴为km水当量，纵轴为m⁻² s⁻¹ sr⁻¹；它与下一张实验室总通量图的定义和单位不同],
)
]

地下深度常用*米水当量*（m.w.e.）表示，即按覆盖层的柱质量折算成水的深度；它与几何深度不是同一个量。

// 图源：课后讲义PDF第65页（替换课前第57页），裁切保留通量–深度图及文献标注。
#block(breakable: false)[
#figure(
  image("pic/ch2/underground-muon-depth-after.png", width: 85%),
  caption: [地下实验室的宇宙线$mu$子通量与等效垂直深度。图据课后讲义，原出处为《核技术》2023年第46卷080018；圆的大小示意可用空间体积],
)
]

图中随等效深度增加，能够穿透岩石到达实验室的$mu$子通量显著降低。覆盖岩石的密度、地形和到达方向都会影响实际屏蔽效果，因此几何埋深不能不经换算就与横轴的$"km w.e."$比较。深地下提供低本底环境，探测器仍需控制天然放射性、残余$mu$子及其次级中子等来源。

代表性实验可按靶与物理目标归纳为

#figure(
  three-line-table[
    | 实验或地点 | 主要介质、方法 | 物理作用 |
    | --- | --- | --- |
    | Super-Kamiokande | 大型水切伦科夫探测器 | 由环形、方向和时间研究大气、太阳及超新星中微子 |
    | SNO | 重水中的带电流、中性流及弹性散射 | 分别测电子味与全部活性味通量 |
    | KamLAND | 约千吨液体闪烁体，IBD延迟符合 | 研究较长基线反应堆反中微子的消失 |
    | 大亚湾 | 多个近、远探测器比较反应堆谱和通量 | 降低共同系统误差，测量反中微子振荡 |
    | 锦屏地下实验室 | 深山岩石覆盖，讲义示意约$2400 "m"$ | 为稀有过程提供低宇宙线本底环境 |
  ],
  caption: [中微子实验中的靶、信号与本底控制],
)

以SNO为例，重水中的两个关键反应是
$
  nu_e+d -> p+p+e^-, quad
  nu_alpha+d -> p+n+nu_alpha
$
第一个是只对电子味敏感的带电流反应，第二个是对三种活性味都敏感的中性流反应。二者比较能够区分源本身发射得少与传播中变成了其他味。

// 课后讲义PDF第66页。
*Super-Kamiokande*：课件标为$50 "kt"$水切伦科夫探测器，位于约$1 "km"$地下，装置图标出高$41.4 "m"$、直径$39.3 "m"$。μ子产生较清晰的环，电子或光子形成电磁簇射，对应较模糊的环；原页还放入Kamiokande所记录的SN1987A中微子事例时间–能量图，以及相关实验物理学家的照片。
#block(breakable: false)[
#figure(
  image("pic/ch2/super-kamiokande-source.png", width: 90%),
  caption: [课件的Super-Kamiokande装置、μ/e环形信号与SN1987A事例图],
)
]

// 课后讲义PDF第67页。
*SNO*：到地表深度$2092 "m"$，靶为约$1 "kt"$重水。课件给出地下装置剖面、重水容器与光电探测器分布、一个重建事例，以及Arthur B. McDonald的照片。
#block(breakable: false)[
#figure(
  image("pic/ch2/sno-source.png", width: 90%),
  caption: [SNO的地下重水探测器和重建事例],
)
]

// 课后讲义PDF第68页。
*KamLAND*：位于Kamioka，以约$1 "kt"$液体闪烁体为靶；图中内外尺度分别标为$13 "m"$、$18 "m"$。其目标是在太阳中微子效应对应的$L/E$区间观察反应堆反中微子消失。例示IBD事例的瞬发能量约$3.2 "MeV"$，延迟俘获能量约$2.22 "MeV"$，时间间隔约$110 "mu s"$，重建位置差约$0.35 "m"$。
#block(breakable: false)[
#figure(
  image("pic/ch2/kamland-source.png", width: 90%),
  caption: [KamLAND装置与瞬发–延迟符合事例；保留课件标出的能量、时间和位置差],
)
]

// 课后讲义PDF第69页。
*大亚湾中微子实验*：课件给出Daya Bay、Ling Ao与Ling Ao II反应堆群及实验厅的地理布局、山体覆盖图和探测器。装置图逐一标注AD、AD支架、内外水屏蔽、PMT、Tyvek反射层、RPC及混凝土大厅；水屏蔽与RPC共同帮助识别宇宙线μ子。
#block(breakable: false)[
#figure(
  image("pic/ch2/daya-bay-source.png", width: 90%),
  caption: [大亚湾的反应堆–实验厅布局、山体与探测器结构],
)
]

// 课后讲义PDF第70页。
*中国锦屏地下实验室（CJPL）*：原图显示四川位置、隧道和山体覆盖，标出最大岩石覆盖约$2400 "m"$，隧道长度$8750 "m"$。这两个长度分别描述垂直覆盖和沿隧道的几何长度，不能互换。
#block(breakable: false)[
#figure(
  image("pic/ch2/jinping-source.png", width: 90%),
  caption: [课件的锦屏实验室地形、隧道与位置图],
)
]

#block(breakable: false)[
#note(subname: [味态与质量态])[
  弱作用产生、探测的味态与自由传播的质量态不同，可写成
  $
    ket(nu_alpha)=sum_i U_(alpha i)^* ket(nu_i), quad alpha=e,mu,tau
  $
  不同质量态积累不同相位，导致探测到的味概率随$L/E$变化。真空两味近似给出
  $
    P_(alpha -> beta)=sin^2 (2theta) sin^2 ((Delta m^2 L)/(4E)), quad alpha != beta
  $
  太阳传播还要考虑物质效应，实际三味分析也比这个近似复杂。中微子振荡要求至少存在两个不同的质量平方，直接说明把所有中微子严格当作无质量粒子不是完整描述。
]
]
#newpara()

=== 轻子数

为整理弱衰变，可以给每一代定义味轻子数$L_e,L_mu,L_tau$：该代带负电的轻子及中微子取$+1$，相应反粒子取$-1$，其余取零。

#figure(
  three-line-table[
    | 粒子组 | $L_e$ | $L_mu$ | $L_tau$ |
    | --- | --- | --- | --- |
    | $e^-,nu_e$ | $1$ | $0$ | $0$ |
    | $mu^-,nu_mu$ | $0$ | $1$ | $0$ |
    | $tau^-,nu_tau$ | $0$ | $0$ | $1$ |
    | $e^+,overline(nu)_e$ | $-1$ | $0$ | $0$ |
    | $mu^+,overline(nu)_mu$ | $0$ | $-1$ | $0$ |
    | $tau^+,overline(nu)_tau$ | $0$ | $0$ | $-1$ |
  ],
  caption: [轻子及反轻子的味轻子数约定],
)

轻子数守恒可以解释许多弱衰变的选择定则。

例如
$
  mu^- -> e^-overline(nu)_e nu_mu
$
保持$L_mu=1$和$L_e=0$。若只有
$
  mu^- -> e^-e^-e^+
$
总轻子数$L=L_e+L_mu+L_tau$仍为$1$，但$L_mu$及$L_e$分别改变，因此它违反的是*味轻子数*，一般认为不发生。$tau^- -> e^-gamma$也是同类的带电轻子味破坏过程。

味轻子数守恒是许多低能反应中极好的近似，但不是包含中微子质量与混合后普遍成立的精确规律。中微子振荡说明*传播中的味可以改变*；带电轻子味破坏在仅加入轻中微子质量的理论中极其微弱，因此仍是寻找新物理的重要过程。

// 课后讲义PDF第71页。
原页把$n -> p e^-overline(nu)_e$、$mu^- -> e^-overline(nu)_e nu_mu$与下列受限过程并列：
$
  "BR"(tau^- -> e^-gamma)<2.6 times 10^(-6), quad "90% CL" \
  "BR"(mu^- -> e^-e^-e^+)<1 times 10^(-12), quad "90% CL"
$
这是*课件所引实验上限*；本节保留原值和置信水平，不将它们称为当前最新上限。

#block(breakable: false)[
#note(subname: [轻子数守恒与中微子振荡是否矛盾？])[

  *课件第72页原题（主观题，1分）*：弱作用过程中的轻子数守恒与中微子振荡有无矛盾？

  // 课后讲义PDF第72页课堂题。
  需要区分*味轻子数*与*总轻子数*，并说明讨论的是产生、传播还是探测。弱带电流顶点把带电轻子$l_alpha$与对应的味态$nu_alpha$联系起来；味态本身是不同质量态的叠加，传播时不同分量积累不同相位，末端因而可能产生另一种味的带电轻子。

  例如$nu_mu -> nu_e$改变了味标签，所以若把$L_e,L_mu,L_tau$分别当成完整理论中精确守恒的量，就与振荡不相容；前面弱衰变中的逐味计数只是忽略中微子质量和混合时的有效近似。另一方面，通常的中微子味振荡仍把中微子变为中微子，没有仅因味改变就要求总轻子数$L$改变。中微子若具有Majorana质量，还涉及不同的总轻子数问题，不能从观测到味振荡单独判定。
]
]

// 讲义第65至85页。
== Dirac方程 (The Dirac equation)

粒子物理研究的对象是微观高速运动客体，（假设）遵循两个最基本的原理：*量子力学和狭义相对论*。

粒子的各种状态（种类，数目，运动状态等）均对应量子系统的状态；如上，$m$(mass),$sigma$(spin)描述粒子的时空特征，$Q$(charge)描述内部特征。

// 课后讲义PDF第74页。
以态矢量写就是
$
  i pdv(,t)ket(psi)=hat(H)ket(psi), quad
  ket(psi)=ket(psi_({m,sigma,Q,...}))
$
量子系统的状态包含粒子种类、数目与运动状态，而其运动方程还必须满足Lorentz协变性。

Schrödinger方程是非相对论的量子力学描述。它的时间演化算符是Hamilton量$hat(H)$，而$hat(H)$是能量算符$hat(E)$的非相对论近似。若要在量子力学框架下引入狭义相对论，需要找到Lorentz协变的波动方程。

=== 从量子力学到相对论波动方程

// 课后讲义PDF第75–76页。
课件列出六条非相对论量子力学基本原理：

+ *波函数及其几率解释*：量子态由Hilbert空间的矢量表示；在位置表象中，归一化波函数满足$integral abs(psi(vb(x),t))^2 dd(vb(x),3)=1$，模平方为位置概率密度。
+ *可观测量与Hermitian算符*：每个物理可观测量以一个Hermitian算符表示，例如$vb(p) -> -i nabla$。
+ *本征态*：系统处于$Omega$的本征态$ket(Phi_n)$，如果
  $
    Omega ket(Phi_n)=omega_n ket(Phi_n)
  $
+ *展开公设*：任一波函数可按一组对易算符全集的完备正交归一本征函数展开，
  $
    ket(psi)=sum_n a_n ket(psi_n), quad
    bra(psi_n)ket(psi_m)=delta_(n m), quad sum_n abs(a_n)^2=1
  $
+ *测量公设*：一次测量得到该可观测量的一个本征值；同样制备的体系反复测量，平均值为
  $
    ⟨Omega⟩=bra(psi)Omega ket(psi)
      =sum_n abs(a_n)^2 omega_n
  $
  因而本征值$omega_n$的概率为$abs(a_n)^2$（有简并时须将相应子空间的概率相加）。
+ *时间演化*：由Schrödinger方程给出
  $
    i pdv(,t)ket(psi)=hat(H)ket(psi)
  $

在相对论量子力学中，前五条原理可以保留；但自由粒子的非相对论波动方程不满足Lorentz协变性，必须改变运动方程。允许产生、湮灭粒子时还需要Fock空间。

// 课后讲义PDF第77页。
自由粒子的非相对论能量为$E=vb(p)^2/(2m)$。代入
$
  E -> i pdv(, t), quad vb(p) -> -i nabla
$
得到
$
  i pdv(, t) psi=-1/(2m) nabla^2 psi
$
将方程乘$psi^*$，与共轭方程作差，可得连续性方程
$
  pdv(, t) rho+div vb(j)=0 \
  rho=psi^*psi, quad vb(j)=-i/(2m)(psi^* nabla psi-psi nabla psi^*)
$
在适当边界条件下，$integral rho dd(vb(x), 3)$守恒，且$rho>=0$可作为概率密度。自由Hamilton量的能谱非负；但时间一阶、空间二阶的这种非相对论方程不具有所要求的Lorentz协变形式。

课件强调的另一条结论可明确写成
$
  bra(psi)hat(E)ket(psi)
    =1/(2m) integral abs(nabla psi)^2 dd(vb(x),3)>=0
$
这里使用自由粒子Hamilton量，并假定边界项消失。

=== Klein-Gordon方程

相对论色散关系是$E^2=vb(p)^2+m^2$。同样的正则量子化
$
  E -> i pdv(, t), quad vb(p) -> -i nabla
$
给出
$
  (pdv(, t, 2)-nabla^2+m^2)psi=0
$
定义
$
  partial^mu & = pdv(, x_mu) = (pdv(, t), -nabla) \
  partial_mu & = pdv(, x^mu) = (pdv(, t), nabla) \
      square & = partial_mu partial^mu = pdv(, t, 2)-nabla^2
$
则*Klein-Gordon方程*（KG方程）为
$
  (square+m^2)psi=0
$
它的形式是Lorentz协变的，描述自由自旋零场。

==== 平面波与正、负频解

取$psi(x)=N e^(-i p dot x)$，其中$p dot x=E t-vb(p) dot vb(x)$，代入KG方程得到
$
  E=plus.minus sqrt(vb(p)^2+m^2)
$
若统一记$E_p=sqrt(vb(p)^2+m^2)>0$，则可写出两支平面波$psi_+ (x)=e^(-i p dot x)$、$psi_- (x)=e^(+i p dot x)$。课件将二者称作正能与负能部分；采用正的$E_p$作为物理参数时，也常称为正频与负频部分。一般复场解可以写成
$
  psi(x)=integral dd(vb(p), 3)/((2pi)^3 2E_p)
  [a(vb(p))e^(-i p dot x)+b^* (vb(p))e^(i p dot x)]
$
积分测度的选择可以通过重新定义$a,b$改变；这里采用第一章的不变测度。

// 课后讲义PDF第79–80页。
课件第80页采用另一归一化约定，原式的分母为$sqrt((2pi)^3 2E_p)$：
$
  psi(x)=integral dd(vb(p),3)/sqrt((2pi)^3 2E_p)
    [a_0 (vb(p))e^(-i p dot x)+b_0^* (vb(p))e^(i p dot x)]
$
这里把原页的展开系数另记为$a_0,b_0$，以区别两种归一化；将系数相应重定义即可得到上一式。

KG方程对时间是二阶的，需要同时给出$psi(vb(x), 0)$和$pdv(, t) psi(vb(x), 0)$。只保留正频部分会对这两组初始条件施加额外约束，因此不能表示一般的初始数据。正能解本身不能构成一个完全集，在有相互作用的情形，不能避免正能级到负能级的跃迁。在自由理论中可研究正频子空间，但不能因此删掉完整局域场论中的反粒子自由度。

==== 守恒流及概率解释的问题

把KG方程乘$psi^*$，再减去共轭方程乘$psi$，得到
$
  partial_mu j^mu=0, quad
  j^mu=i[psi^* partial^mu psi-(partial^mu psi^*)psi]
$
其时间与空间分量为
$
  rho=i(psi^* pdv(, t) psi-psi pdv(, t) psi^*), quad
  vb(j)=-i(psi^* nabla psi-psi nabla psi^*)
$

直接代入连续性方程就是课件所列的展开式
$
  pdv(,t)[i(psi^* pdv(psi,t)-psi pdv(psi^*,t))] \
  +nabla dot [-i(psi^* nabla psi-psi nabla psi^*)]=0
$
对于$psi=N e^(-i p dot x)$，
$
  j^mu=2p^mu abs(N)^2, quad rho=2E abs(N)^2
$
负频解给出相反符号的密度$rho$，在这里无法解释为几率密度。

#block(breakable: false)[
#note(subname: [KG方程并没有因此失效])[
  这里受阻的是把这个守恒流直接当作单粒子的概率流。对于具有相位对称性的复标量场，它可以解释为电荷流；电荷密度允许正负两种符号。量子化后，正、负频部分分别联系粒子湮灭与反粒子产生，二者的物理激发能量均为正。实标量场同样满足KG方程，但没有这种独立的复相位电荷。

  在量子场论中，Klein-Gordon方程不再被理解为单粒子的波动方程，而是经典场的运动方程。
]
]
#newpara()

// 课后讲义PDF第82页：KG单粒子概率解释的主要困难。
#block(breakable: false)[
#note(subname: [负频解与非正定概率密度是两件事])[

  *课件原题（第82页，单选1分）*：K-G方程不能直接作这里的单粒子相对论性波动方程，主要困难是什么？A.负能解；B.概率密度不正定。课件选B。

  课堂题所指出的直接困难是*上述局域守恒密度不保证非负*，因此不能原封不动用作单粒子位置概率密度。不能把这句话缩成“出现负频解，所以方程错误”：Dirac方程同样有负频解，却能构造$psi^dagger psi>=0$的密度。

  守恒流的存在只说明连续性方程成立，并不自动赋予该流概率意义。量子场论保留KG方程及其正、负频自由度，将它们与粒子、反粒子联系起来，从而改变了物理解释。
]
]
#newpara()

=== Dirac方程

==== 线性化能量关系与Dirac矩阵

#block(breakable: false)[
#figure(
  grid(columns: (1fr,), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-dirac.png", height: 2.4cm)

#text(size: 10pt)[P. A. M. Dirac]],
  ),
  caption: [课件第83页的Dirac肖像],
)
]

Dirac希望构造对时间和空间都只含一阶导数的局域方程。

// 课后讲义PDF第83–84页。
课件以“KG对时间是二阶，出现不能作为概率解释的密度”为历史动机，寻找一个一阶偏微分方程；这是一条构造思路，不表示所有二阶时间方程都必然对应负的物理概率。直接写$hat(H)=sqrt(-nabla^2+m^2)$虽然保留正能根，却不是所需的局域一阶微分算符。为此设
$
  hat(H)=vb(alpha) dot vb(p)+beta m
$
其中$alpha_i,beta$是作用于多分量波函数的常数Hermitian矩阵。要求
$
  hat(H)^2=(vb(p)^2+m^2) I
$
将左边展开，分别比较$p_i^2$、$p_i p_j$、$m p_i$与$m^2$的系数，得到
$
  alpha_i alpha_j+alpha_j alpha_i=2delta_(i j) I \
  alpha_i beta+beta alpha_i=0, quad beta^2=I
$
特别地$alpha_i^2=I$。

在$3+1$维时满足这些条件的最小矩阵维数为四。一种称为*Dirac表象*的选择为
$
  alpha_i=mat(0, sigma_i; sigma_i, 0), quad
  beta=mat(I_2, 0; 0, -I_2)
$
这里每个元素是$2 times 2$块，其中$I_2=mat(1,0;0,1)$，而将相对论能量关系理解成矩阵式时要求
$
  (E I_n)^2=(vb(alpha) dot vb(p)+beta m)^2
    =(vb(p)^2+m^2)I_n
$
先允许$n$个波函数分量，再由反对易关系确定最小$n=4$。Pauli矩阵为
$
  sigma_1=mat(0, 1; 1, 0), quad
  sigma_2=mat(0, -i; i, 0), quad
  sigma_3=mat(1, 0; 0, -1)
$
且$sigma_i sigma_j=delta_(i j) I_2+i epsilon_(i j k) sigma_k$。

#block(breakable: false)[
#note(subname: [最小的维数为4])[
  每个$alpha_i$都与可逆的$beta$反对易，所以$"tr"(alpha_i)=0$；同理$"tr"(beta)=0$。本征值为$plus.minus 1$的矩阵因而必须有相同数目的正、负本征值，维数为偶数。二阶无迹Hermitian矩阵只能写成$vb(a) dot vb(sigma)$，而四个两两反对易的矩阵要求三维空间中存在四个两两正交的非零$vb(a)$，不可能。因此至少需要四维，上面的表示证明四维已经足够。
]
]
#newpara()

由此正则量子化得到的方程为*Dirac方程*
$
  i pdv(, t) psi=(-i vb(alpha) dot nabla+beta m)psi
$
$psi$有四个复分量
$
  psi = mat(psi_1; psi_2; psi_3; psi_4)
$
称为*Dirac旋量*（spinor）。这些分量不是普通四矢量的时间、空间分量，它们按旋量表示作Lorentz变换。

==== 守恒概率流

由于$alpha_i^dagger=alpha_i$、$beta^dagger=beta$，引入Hermitian共轭行旋量$psi^dagger=(psi_1^*,psi_2^*,psi_3^*,psi_4^*)$。由此得到
$
  pdv(, t)(psi^dagger psi)+div (psi^dagger vb(alpha)psi)=0
$
因此
$
  rho=psi^dagger psi=sum_(a=1)^4 abs(psi_a)^2>=0, quad
  vb(j)=psi^dagger vb(alpha)psi
$
这修复了单粒子波函数的局域非负概率密度问题。不过，它并没有消除负频解，也没有使固定粒子数描述适用于所有高能过程。而且引入了更多的自由度。

=== $4$分量旋量Dirac粒子

==== 内禀自旋与总角动量

对自由Dirac粒子，系统的Hamilton量为
$
  hat(H)=vb(alpha) dot vb(p)+beta m
$
在坐标表象为
$
  hat(H)=-i vb(alpha) dot nabla+beta m
$
#newpara()
*轨道角动量*$vb(L)=vb(r) times vb(p)$不单独守恒。利用$[r_i,p_j]=i delta_(i j)$可得
$
  [hat(H),vb(L)]=-i(vb(alpha) times vb(p))
$
定义*总角动量*算符
$
  Sigma_i=mat(sigma_i, 0; 0, sigma_i), quad
  vb(S)=vb(Sigma)/2, quad vb(J)=vb(L)+vb(S)
$
由矩阵关系$[alpha_j,Sigma_i]=2i epsilon_(j i k)alpha_k$，得到
$
  [hat(H),vb(S)]=i(vb(alpha) times vb(p))
$
两项相消，故
$
  [hat(H),vb(J)]=0
$
这意味着加上*自旋角动量*$hat(vb(S))$，总角动量守恒。

同时
$
  vb(S)^2=3/4 I
$
满足
$
  s(s+1)=3/4 => s=1/2
$
因此自旋并非额外任意附加的标签，而是Dirac旋量的旋转性质所要求的内禀角动量。

==== 磁矩与$g$因子

Dirac方程正确预言了电子的磁距。

对电荷为$q$的粒子作最小耦合$vb(p)->vb(p)-q vb(A)$、$H->H+q phi$。在低速、弱场近似下，消去较小的两分量，可得Pauli Hamilton量
$
  H_"NR" approx m+q phi+(vb(p)-q vb(A))^2/(2m)
  -q/(2m) vb(sigma) dot vb(B)
$
将最后一项与磁能$-vb(mu) dot vb(B)$比较，由$vb(S)=vb(sigma)/2$得到
$
  vb(mu)=g q/(2m) vb(S), quad g=2
$
这是假定点状Dirac粒子、树图层次的结果，量子辐射修正会使$g$偏离$2$。

恢复$hbar$，取$e>0$，定义正的Bohr磁子
$
  mu_B=(e hbar)/(2m_e) approx 5.788 times 10^(-11) "MeV/T"
$
电子的电荷为$q=-e$，所以$vb(mu)_e=-g mu_B vb(S)/hbar$。

=== Dirac方程的协变形式与Dirac共轭

定义
$
  gamma^0=beta=mat(I_2, 0; 0, -I_2), quad
  gamma^i=beta alpha_i=mat(0, sigma_i; -sigma_i, 0)
$
它们满足Clifford代数
$
  gamma^mu gamma^nu+gamma^nu gamma^mu=2g^(mu nu)
$
故$(gamma^0)^2=I_4$、$(gamma^i)^2=-I_4$。将Hamilton形式的Dirac方程左乘$gamma^0$，得到
$
  (i gamma^mu partial_mu-m)psi=0
$
对四矢量$Q^mu$，常记作$cancel(Q) = gamma^mu Q_mu = gamma_nu Q^mu$，称为Feynman slash记号。Dirac方程也可写成
$
  (i cancel(partial) -m) psi=0
$

对于$x'^mu=Lambda^mu_(nu)x^nu$，旋量变换为
$
  psi'(x')=S(Lambda)psi(x)
$
协变性要求
$
  S^(-1) gamma^mu S=Lambda^mu_(nu) gamma^nu
$
因此旋量的变换矩阵$S$与四矢量的变换矩阵$Lambda$承担不同的作用。

普通Hermitian共轭不足以构造Lorentz标量。定义*Dirac共轭*
$
  overline(psi)=psi^dagger gamma^0
$
利用$S^dagger gamma^0=gamma^0 S^(-1)$，有$overline(psi)'(x')=overline(psi)(x)S^(-1)$。于是
$
  overline(psi)'psi'=overline(psi)psi, quad
  j^mu=overline(psi)gamma^mu psi
$
前者为Lorentz标量，后者为四矢量，其$j^0=psi^dagger psi$正好回到上面的密度。

共轭Dirac方程为
$
  i(partial_mu overline(psi))gamma^mu+m overline(psi)=0
$
与原方程组合直接给出$partial_mu j^mu=0$。

==== 双线性协变量

定义
$
  gamma_5 = gamma^5=i gamma^0 gamma^1 gamma^2 gamma^3, quad
  sigma^(mu nu)=i/2 (gamma^mu gamma^nu-gamma^nu gamma^mu)
$
其中$(gamma^5)^2=I$，$gamma^5$与每个$gamma^mu$反对易。Dirac双线性共有五类，总计$1+1+4+4+6=16$个独立矩阵结构。

#figure(
  three-line-table[
    | 类型 | 双线性 | 分量数 |
    | --- | --- | --- |
    | 标量 $S$ | $overline(psi)psi$ | $1$ |
    | 赝标量 $P$ | $i overline(psi)gamma^5 psi$ | $1$ |
    | 矢量 $V^mu$ | $overline(psi)gamma^mu psi$ | $4$ |
    | 赝矢量 $A^mu$ | $overline(psi)gamma^mu gamma^5 psi$ | $4$ |
    | 反对称张量 $T^(mu nu)$ | $overline(psi)sigma^(mu nu)psi$ | $6$ |
  ],
  caption: [Dirac双线性协变量],
)

对正时向Lorentz变换及其与空间反演的组合，变换律如下。课件第90页以波函数本身将其逐式写成
$
  overline(psi)'(x')psi'(x')=overline(psi)(x)psi(x) \
  overline(psi)'(x')gamma_5 psi'(x')
    =det(Lambda)overline(psi)(x)gamma_5 psi(x) \
  overline(psi)'(x')gamma^mu psi'(x')
    =Lambda^mu_(" "nu)overline(psi)(x)gamma^nu psi(x) \
  overline(psi)'(x')gamma_5 gamma^mu psi'(x')
    =det(Lambda)Lambda^mu_(" "nu)overline(psi)(x)gamma_5 gamma^nu psi(x) \
  overline(psi)'(x')sigma^(mu nu)psi'(x')
    =Lambda^mu_(" "rho)Lambda^nu_(" "sigma)overline(psi)(x)sigma^(rho sigma)psi(x)
$
缩写为表中的$S,P,V,A,T$就是
$
  S'=S, quad P'=det(Lambda)P \
  V'^mu=Lambda^mu_(" "nu)V^nu, quad
  A'^mu=det(Lambda)Lambda^mu_(" "nu)A^nu \
  T'^(mu nu)=Lambda^mu_(" "rho)Lambda^nu_(" "sigma)T^(rho sigma)
$
我们说$overline(psi) gamma^mu psi$是流$j^mu$，因为
$
  partial_mu j^mu = sum_(mu=1)^3 partial_mu j^mu + partial_0 j^0 = div vb(j) + pdv(, t) rho = 0
$
#block(breakable: false)[
#note(subname: [一些张量分析的知识])[
  关于向量与对偶空间、上下指标、普通量与赝量、Lorentz协变性以及$gamma^5$的数学背景，见#link(<app-tensor>)[附录一：矢量、张量与物理中的变换]。
]
]
#newpara()

=== Dirac方程的解

一般的解可以写成平面波叠加，一个平面波的解写作
$
  psi(vb(x), t)=u(E, vb(p))e^(-i p dot x)
$

==== 静止解及其极化

静止时$vb(p)=0$，Hamilton量为$beta m$。略去共同归一化因子，四个独立解为
$
  psi_1=e^(-i m t)mat(1; 0; 0; 0), quad
  psi_2=e^(-i m t)mat(0; 1; 0; 0) \
  psi_3=e^(+i m t)mat(0; 0; 1; 0), quad
  psi_4=e^(+i m t)mat(0; 0; 0; 1)
$
前两解的$i pdv(, t)$本征值为$+m$，后两解为$-m$。所以Dirac方程依然同时包含正、负频解。

#block(breakable: false)[
#example(subname: [验证静止波函数的极化])[

  *课件第92页原题（主观题，2分）*：如何验证静止波函数每个解的极化？

  选择$z$轴为自旋量子化轴，
  $
    S_z=1/2 Sigma_z=1/2 mat(1, 0, 0, 0; 0, -1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1)
  $
  逐个作用于上面的四个解，有
  $
    S_z psi_1=+1/2 psi_1, quad S_z psi_2=-1/2 psi_2 \
    S_z psi_3=+1/2 psi_3, quad S_z psi_4=-1/2 psi_4
  $
  也可以计算归一化期望值$(psi_a^dagger S_z psi_a)/(psi_a^dagger psi_a)$得到相同结果。

  这是四个旋量解本身的$S_z$本征值。若把负能电子态解释为被移走的占据态，则空穴携带相反的角动量；反粒子的物理自旋标签要按所选约定重新对应。静止时没有非零动量方向，因而这里验证的是自旋极化，不是螺旋度。
]
]
#newpara()

==== 运动粒子的自由旋量

令$E=sqrt(vb(p)^2+m^2)>0$。正频解写为$psi=u(p)e^(-i p dot x)$，满足
$
  (gamma^mu p_mu-m)u(p)=0
$
在Dirac表象中写$u=mat(phi; chi)$，方程化为
$
  (E-m)phi=(vb(sigma) dot vb(p))chi, quad
  (E+m)chi=(vb(sigma) dot vb(p))phi
$
因此对两个正交归一的二分量旋量$xi_r$，可以取
$
  u_r (p)=sqrt(E+m)mat(xi_r; (vb(sigma) dot vb(p))/(E+m) xi_r), quad r=1,2
$
例如$xi_1=mat(1; 0)$、$xi_2=mat(0; 1)$，给出
$
  u_1=sqrt(E+m)mat(1; 0; p_z/(E+m); (p_x+i p_y)/(E+m)) \
  u_2=sqrt(E+m)mat(0; 1; (p_x-i p_y)/(E+m); -p_z/(E+m))
$
负频解写为$psi=v(p)e^(+i p dot x)$，仍用正的物理能量参数$E$，于是
$
  (gamma^mu p_mu+m)v(p)=0
$
可选
$
  v_r (p)=sqrt(E+m)mat((vb(sigma) dot vb(p))/(E+m) eta_r; eta_r)
$
$eta_r$为另一组正交归一的二分量旋量。若取$eta_1=mat(0; 1)$、$eta_2=mat(1; 0)$，就得到两个$v$旋量；这组标号使静止系反粒子的物理自旋标签与负频旋量的$Sigma_z/2$本征值相反。

// 课后讲义PDF第93页。
原页把这一反粒子自旋标签约定明确写为
$
  hat(S)^(v)=-hat(S)
$
这里区分的是反粒子的物理自旋标签与用于书写负频旋量分量的自旋算符；不能将它当作所有表示中反粒子总角动量一律取负的独立定律。

于是四个解为
$
  u_1 (p) = sqrt(E+m)mat(1; 0; p_z/(E+m); (p_x+i p_y)/(E+m)), quad
  u_2 (p) = sqrt(E+m)mat(0; 1; (p_x-i p_y)/(E+m); -p_z/(E+m)) \
  v_1 (p) = sqrt(E+m)mat((p_x-i p_y)/(E+m); -p_z/(E+m); 0; 1), quad
  v_2 (p) = sqrt(E+m)mat(p_z/(E+m); (p_x+i p_y)/(E+m); 1; 0)
$
上述归一化满足
$
  u_r^dagger u_s=v_r^dagger v_s=2E delta_(r s) \
  overline(u)_r u_s=2m delta_(r s), quad
  overline(v)_r v_s=-2m delta_(r s)
$
这里的$2E$与第一章采用的相对论态归一化相配合。对两个自旋态求和，还有常用的完备关系
$
  sum_r u_r (p)overline(u)_r (p)=gamma^mu p_mu+m I \
  sum_r v_r (p)overline(v)_r (p)=gamma^mu p_mu-m I
$
这将自旋求和转化为$γ$矩阵运算，是计算散射振幅模平方的基础。

==== 负能解、空穴与反粒子

如果把负能解当作普通可占据的单粒子能级，电子似乎可以不断跃迁到更低能量的状态。Dirac利用Fermi统计提出*空穴理论*：真空中所有负能态已被填满，Pauli不相容原理阻止普通电子继续下落。

// 课后讲义PDF第94页。
课件还明确规定：填满的负能海构成感受不到的背景；真空不仅要求负能级填满，也要求正能级没有电子。把一个负能级电子激发到正能级时，正能区出现一个电子，而负能海中同时留下一个缺少负能量、负电荷的空穴，因此空穴表现为正能量、正电荷的粒子。

从一个能量为$-E$、电荷为$-e$的已占据态移去电子，相对真空的变化为
$
  Delta E=+E, quad Delta Q=+e
$
因而空穴表现为具有正能量、正电荷的粒子，即正电子。动量和角动量也按“移去某一占据态”取相反的变化。

这一图像具有历史价值，但不能直接推广为所有反粒子的普遍理论，尤其不能依靠填满玻色子的负能海。现代量子场论把Dirac场展开为
$
  hat(psi) (x)=sum_r integral dd(vb(p), 3)/((2pi)^3 2E_p)
  [a_r (vb(p))u_r (p)e^(-i p dot x)
    +b_r^dagger (vb(p))v_r (p)e^(+i p dot x)]
$
其中$a_r$湮灭粒子，$b_r^dagger$产生反粒子；两种实际激发的能量都是$E_p>0$。预言了正电子的存在。

Feynman-Stückelberg解释把负能解沿反向时间的传播，等价地改写为正能反粒子沿正向时间的传播。这是组织振幅的解释方式，不要求现实中的探测粒子具有负能量或向过去运动。

// 课后讲义PDF第94页。
#block(breakable: false)[
#figure(
  image("pic/ch2/dirac-hole-levels.png", width: 48%),
  caption: [Dirac海的能级示意：正能电子、负能填充态与正电空穴],
)
]

// 课后讲义PDF第95页。
课件强调Dirac海解释有许多困难，主要应作历史图像。Feynman–Stückelberg图中，向后传播的负能电子等价改写为向前传播的正能正电子；但*反粒子线的箭头仍指向反时间方向，用来标记它是反粒子解*，箭头不等于探测到的运动方向。相位可作
$
  e^(-i(-E)(-t)) -> e^(-i E t)
$
式的重解释，随即改用$E=sqrt(abs(vb(p))^2+m^2)>0$的反粒子波函数处理振幅。
#block(breakable: false)[
#figure(
  image("pic/ch2/feynman-stueckelberg-diagram.png", width: 90%),
  caption: [课件的Feynman–Stückelberg重解释及电子–光子顶点箭头示意],
)
]

本节课件的阅读指引为M. Thomson《Modern Particle Physics》第4章：静止解与一般自由旋量见§4.6；磁矩、协变性与双线性分别见附录B.1、B.2、B.3。原课件第93、95页还给出其#link("https://www.hep.phy.cam.ac.uk/~thomson/MPP/ModernParticlePhysics.html")[配套课程网页]。

// 讲义第87至90页。
== 正电子 (The positron)

=== 硬$γ$射线的异常吸收

#block(breakable: false)[
#figure(
  grid(columns: (1fr,), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-chao.png", height: 2.4cm)

#text(size: 10pt)[赵忠尧（1902–1998）]],
  ),
  caption: [课件第97页的赵忠尧肖像],
)
]

赵忠尧在1930年研究硬$γ$射线的吸收：轻元素中的结果与Compton散射的Klein-Nishina公式较相符，但在铅等重元素中出现额外吸收，并伴随约$0.5 "MeV"$的次级辐射。

// 课后讲义PDF第97–98页。
具体地，在铝等轻元素中的测量与Compton散射预言相符，而在铅中的吸收比Klein–Nishina公式高出约$40%$；伴随的约$0.5 "MeV"$辐射在总体上各向均匀。论文为C. Y. Chao，Phys. Rev. 36, 1519 (1930)，1930年10月13日收到。赵忠尧生卒年为1902–1998。
#block(breakable: false)[
#figure(
  image("pic/ch2/chao-1930-absorption.png", width: 90%),
  caption: [赵忠尧1930年论文原页和课件所引铅的光子作用截面图；成对产生解释额外吸收],
)
]

现代解释是核场中的电子对产生
$
  gamma+N -> e^++e^-+N
$
与正负电子湮灭
$
  e^++e^- -> gamma+gamma
$
前者在相应近似下随核电荷有显著的$Z^2$增强。若正负电子在质心系中近乎静止，两个湮灭光子的能量各为$m_e c^2=0.511 "MeV"$，方向相反。对许多未偏振、随机取向的事例，辐射可表现出近似各向同性的总体分布。

#block(breakable: false)[
  #note(subname: [为什么需要原子核参与成对产生])[
    一个实光子在真空中有$p_gamma^2=0$，而两个有质量粒子的总四动量满足$(p_++p_-)^2>=4m_e^2$，所以真空中的$gamma -> e^+e^-$不能同时满足能量与动量守恒。原子核承担反冲，才使这个过程成为可能。质量为$M_N$的静止靶上的阈值为
    $
      E_(gamma,"th")=((M_N+2m_e)^2-M_N^2)/(2M_N)
      =2m_e (1+m_e/M_N)
    $
    对重核，它非常接近$2m_e$。
  ]
]
#newpara()

=== Anderson的云室证据

磁场中的弯曲方向可以确定$q$的符号。Anderson在云室中加入约$6 "mm"$铅板：粒子通过铅板时损失能量，出射段的动量更低、曲率更大。由板两侧的曲率比较先确定运动方向，再利用已知磁场确定电荷符号。Anderson实验中，板前约$63 "MeV/c"$、板后约$23 "MeV/c"$；结合电离和射程，能够排除质子而识别正电子。第一章的云室部分已给出该照片。

Blackett和Occhialini使用Geiger计数器符合触发云室，提高了捕获宇宙线事例的效率；他们记录到更多正电子及电子对产生径迹，形成了相互支持的实验依据。理论预言、异常吸收和带电径迹识别由此联系起来。

// 课后讲义PDF第99页。
Anderson原图的磁场指向纸内，大小为$15000 "Gauss"=1.5 "T"$，上、下段重建动量分别约$23$和$63 "MeV/c"$，中间为$6 "mm"$铅板。该事例发表于C. D. Anderson，Phys. Rev. 43 (1933) 491。图的运动方向判定必须先用能量损失，再用磁偏转判电荷，不能倒过来预设电荷。
#block(breakable: false)[
#figure(
  image("pic/ch2/anderson-positron-cloud.png", width: 87%),
  caption: [课件的Anderson正电子照片，保留磁场、两段动量和铅板标记],
)
]

// 课后讲义PDF第100页。
#block(breakable: false)[
#figure(
  image("pic/ch2/blackett-occhialini-apparatus.png", width: 67%),
  caption: [Blackett–Occhialini计数器控制云室的装置结构；符合触发提高了有效事例率],
)
]

// 讲义第92至97页。
== 反质子 (The antiproton)

质子的反粒子具有相同质量和自旋，电荷及重子数相反：$Q_(overline(p))=-e$、$B_(overline(p))=-1$。

=== 质子加速器产生反质子

课件首先问：*既然存在正电子，是否也存在反质子？*

宇宙线中很难找到反质子。在质子固定靶实验中，满足重子数守恒的最轻产生过程为
$
  p+p -> p+p+p+overline(p)
$
初态$B=2$，末态$B=3-1=2$；只产生一个额外反质子而不补偿重子数是不允许的。

设靶质子静止，束流质子的*总能量*为$E_"beam"$，则
$
  s=2m_p^2+2m_p E_"beam"
$
阈值处四个末态粒子在质心系中没有相对运动，所以
$
  sqrt(s_"th")=4m_p, quad
  2m_p^2+2m_p E_"th"=16m_p^2
$
因此
$
  E_"th"=7m_p approx 6.57 "GeV", quad
  T_"th"=E_"th"-m_p=6m_p approx 5.63 "GeV"
$

// 课后讲义PDF第102页。
课件记阈能为$E_p^"thr"=7m_p approx 6.6 "GeV"$，并列出Berkeley于1954年建成标称约$7 "GeV"$的Bevatron。这里必须保留“总能量”与“动能”的区别，才能同阈值公式相比较。

=== 磁谱仪与质量鉴别

1955年Chamberlain、Segrè等在Berkeley的Bevatron上寻找反质子。难点是带负电的$π$介子本底远多于反质子，单凭负电荷不能确定粒子身份。

// 课后讲义PDF第103页。
课件列束流能量$7.2 "GeV"$，并给出数量对比：每产生约$100000$个π介子才有一个反质子。原页的质量鉴别公式恢复$c$后为
$
  m=p/v sqrt(1-v^2/c^2)
$
即必须在选定电荷、动量的同时测速度。若将课件的$7.2 "GeV"$理解为总能量，其对应动能约$6.3 "GeV"$；不能把这个数与上面的总能量阈值混用。
#block(breakable: false)[
#figure(
  image("pic/ch2/antiproton-momentum-stage1.png", width: 80%),
  caption: [谱仪第一步：靶、选择电荷的磁铁和动量狭缝],
)
]

// 课后讲义PDF第104页。
#block(breakable: false)[
#figure(
  image("pic/ch2/antiproton-focusing-analogy.png", width: 90%),
  caption: [课件的光学类比：只有狭缝时束流极弱，聚焦使源的像落到狭缝上],
)
]

// 课后讲义PDF第105–106页。
谱仪第二步再用相反的磁铁组合得到粒子源的第二个像点，从而获得指定电荷、近单能且强度较高的粒子束。课件先用两个像点与$S_1,S_2$说明飞行时间测量，再在同一图中加入$C_1,C_2$降低随机符合。

磁谱仪先利用偏转方向选择电荷符号，利用磁场及狭缝选择动量范围，再通过聚焦磁铁提高传输效率。聚焦的作用类似几何光学中形成源的像，避免仅靠窄狭缝筛选而丢失过多束流。

已知动量$p$并测得速度$beta$后，质量由
$
  beta=p/sqrt(p^2+m^2), quad
  m=p sqrt(1/beta^2-1)
$
确定。这里恢复单位时为$m c=p sqrt(1/beta^2-1)$。

#figure(
  image("pic/ch2/antiproton-spectrometer.png", width: 57%),
  caption: [反质子磁谱仪：磁偏转与聚焦选择动量，两闪烁体测飞行时间，切伦科夫探测器辅助鉴别],
)

#block(breakable: false)[
  #example(subname: [在1.19 GeV/c处分离π介子和反质子])[
    课件的$1.19 "GeV/c"$是谱仪第一步实际选择的*中心动量*。对这一动量，取$m_pi c^2=0.140 "GeV"$、$m_p c^2=0.938 "GeV"$，有
    $
      beta_pi=1.19/sqrt(1.19^2+0.140^2) approx 0.993 \
      beta_(overline(p))=1.19/sqrt(1.19^2+0.938^2) approx 0.785
    $
    两闪烁体间的路径长为$L=12 "m"$，则
    $
      t_pi=L/(beta_pi c) approx 40.3 "ns", quad
      t_(overline(p))=L/(beta_(overline(p)) c) approx 51.0 "ns"
    $
    时间差约$10.7 "ns"$，大于约$1 "ns"$的时间分辨，可以清晰地区分两个质量假设。
  ]
]
#newpara()

为减少偶然符合，还使用两个切伦科夫探测器：$C_1$的阈值约$beta=0.99$，可对高速π介子发光而对该动量下的反质子不发光；$C_2$利用合适介质、光学聚焦和角度选择，识别速度接近反质子预期值的粒子。

课件原页将$C_2$概括为“阈值低，加入聚焦镜之后仅能探测质子”。这里是在上述已选电荷、中心动量及光学接受角下选择（反）质子速度的信号，不是说一个低阈值切伦科夫介质在任意束流中都只对质子发光。

#figure(
  image("pic/ch2/antiproton-tof.png", width: 49%),
  caption: [结合切伦科夫条件后的飞行时间分布，较晚到达的峰对应反质子],
)

之后实验又发现反中子及反超子。反粒子并不只存在于电子系统；对于复合强子，电荷、重子数、奇异数等可加性量子数均按反粒子关系改变，而质量和自旋保持相同。

// 课后讲义PDF第107页。
课件给出的后续节点是：1956年Bevatron发现反中子；1959年Segrè与Chamberlain获Nobel物理学奖；1960年王淦昌在Dubna参与发现课件所称的“反$Sigma^-$超子”。原页并列Segrè、Chamberlain与王淦昌（1907–1998）的照片。

#block(breakable: false)[
#figure(
  grid(columns: (1fr, 1fr, 1fr), gutter: 1em,
    align(center)[#image("pic/ch2/portrait-segre.png", height: 2.4cm)

#text(size: 10pt)[Emilio Gino Segrè]],
    align(center)[#image("pic/ch2/portrait-chamberlain.png", height: 2.4cm)

#text(size: 10pt)[Owen Chamberlain]],
    align(center)[#image("pic/ch2/portrait-wang-ganchang.png", height: 2.4cm)

#text(size: 10pt)[王淦昌（1907–1998）]],
  ),
  caption: [课件第107页反粒子实验发展中的三位物理学家],
)
]

#block(sticky: true)[
== 本章小结 <chap2-summary>

=== 从实验信号到粒子身份
]

本章的主线是：*由径迹、能量、时间和反应道确定粒子性质，再用相互作用及量子数解释这些性质。* 一个新粒子的身份不能只凭质量或某一条径迹确定，需要多种观测相互检验。

#figure(
  three-line-table[
    | 性质 | 主要观测 | 判断要点 |
    | --- | --- | --- |
    | 电荷与质量 | 磁偏转、射程、能损、飞行时间 | 动量与速度或动能须联合 |
    | 固有寿命 | 停止延迟或飞行距离 | 时间膨胀及探测效率 |
    | 自旋 | 互逆反应的截面比 | 相空间、自旋与全同粒子计数 |
    | 内部量子数 | 产生、吸收及衰变道 | 守恒律与反应阈值 |
  ],
  caption: [第二章中从可测信号确定粒子性质的方法],
)

相应的运动学关系为
$
  m^2=E^2-vb(p)^2, quad
  m=p sqrt(beta^(-2)-1), quad
  ell=beta gamma c tau_0
$
前两式采用自然单位，最后一式恢复$c$。指数衰变谱确定的是寿命；质量、自旋和衰变道还需独立测量。

$mu$子与$pi$介子的区别说明了相互作用测量的重要性：$mu$子是自旋$1/2$、不参与强相互作用的轻子；$pi$介子是$J^P=0^-$的赝标量强子。Yukawa势中的$e^(-m r)/r$把有限作用距离与交换粒子质量联系起来，$L tilde hbar/(m c)$；π交换描述核力的长程部分，不表示π介子是QCD的基本规范玻色子。

奇异粒子的“强产生、慢衰变”则引出奇异数$S$：强、电磁过程守恒总$S$，弱过程可以改变$S$。例如
$
  pi^- p -> K^0 Lambda: quad 0=(+1)+(-1), quad
  Lambda -> p pi^-: quad -1 -> 0
$
协同产生要求总奇异数补偿，而不是要求恰好产生一对互为反粒子的强子。寿命还取决于允许的衰变道、耦合和相空间，不能仅按质量大小或是否参与强相互作用排序。例如π介子电子衰变道的相空间更大，却受到更强的螺旋度压低，因而远弱于$mu$子道。

#block(breakable: false)[
=== 三代轻子与中微子的证据

三代轻子按弱相互作用配对为$(e^-,nu_e)$、$(mu^-,nu_mu)$、$(tau^-,nu_tau)$，并各有相应反粒子。中微子的关键证据并不相同：连续$beta$能谱提示三体末态中的不可见粒子；反应堆逆$beta$衰变$overline(nu)_e p -> e^+ n$利用瞬发正电子与延迟中子俘获的符合降低本底；带电流反应产生哪一种带电轻子，则用来区分中微子的味。
]

非加速器源提供了互补样本：太阳主要产生$nu_e$，反应堆主要产生$overline(nu)_e$，大气中的$pi$和$mu$衰变链产生电子味及$mu$味中微子和反中微子，超新星则可产生各味。这些源覆盖不同的能区、时间尺度与传播距离。

$Z$的不可见宽度支持三种能够由$Z$产生、具有标准弱耦合的轻活性中微子，并不排除所有其他中性粒子。反应率还必须结合源能谱、截面、靶数和效率：
$
  R=N_"target" integral dd(E_nu)
  dv(Phi, E_nu) sigma(E_nu) epsilon(E_nu)
$
增加靶质量可以增加信号，屏蔽、地下覆盖、主动否决及时间空间符合则用于减少本底，两者承担不同的任务。截面与自由程相互联系，但比较时须统一“每核”或“每核子”的靶定义；讲义的$0.45 "eV"$质量上限则是β衰变有效质量$m_beta$的约束。

弱作用产生和探测的是*味态*，自由传播按*质量态*积累相位。两者的混合导致振荡，表明至少存在非零的质量平方差，也说明味轻子数不是普遍精确的守恒量。总轻子数是否守恒与味是否改变是两个问题；中微子的Dirac或Majorana性质不能只由电中性判断。

螺旋度是自旋沿动量的投影，手征性由$P_(L,R)=(1 minus.plus gamma^5)/2$定义。对有质量粒子二者不同；忽略中微子质量时，弱作用产生的中微子与反中微子分别具有左、右螺旋度。相关旋量与张量背景见#link(<app-tensor>)[附录一]。

#block(sticky: true)[
=== 相对论波动方程与旋量
]

将$E^2=vb(p)^2+m^2$量子化得到Klein-Gordon方程；要求对时空均为局域一阶微分，则引出Dirac方程及Clifford代数：
$
  (square+m^2)phi=0, quad
  (i gamma^mu partial_mu-m)psi=0 \
  gamma^mu gamma^nu+gamma^nu gamma^mu=2g^(mu nu)I
$
KG方程适用于标量场，复标量场的相位对称性给出的守恒流不能普遍当作单粒子的非负概率流；这与是否出现负频解需要区分。Dirac方程则有
$
  overline(psi)=psi^dagger gamma^0, quad
  j^mu=overline(psi)gamma^mu psi, quad
  partial_mu j^mu=0, quad j^0=psi^dagger psi>=0
$
Dirac共轭使双线性可以组成Lorentz标量、矢量和其他张量；$psi^dagger psi$是$j^0$，不是Lorentz标量。

四分量$psi$是*旋量*，不按四矢量的规则变换。其旋转结构给出自旋$1/2$，守恒的是总角动量$vb(J)=vb(L)+vb(S)$；最小电磁耦合在低速、树图近似下给出$g=2$，辐射修正可使其偏离。正、负频部分各有两个独立的自旋态，不能把四个分量在任意表象中逐项等同于四种粒子或四种物理状态。

#block(sticky: true)[
=== 反粒子：从理论分支到实验识别
]

KG和Dirac方程都保留正、负频解。空穴理论提供了正电子的历史解释；现代场论中，负频部分与反粒子产生算符相联系，粒子和反粒子的实际激发能量都为正。反粒子具有相同的质量、自旋以及相反的可加性量子数；中性粒子是否为自身反粒子，还要看其他量子数和场的结构。

正电子的云室证据需要先由铅板前后的能损、曲率确定运动方向，再由磁偏转确定电荷符号。反质子的识别则结合已选定的动量与飞行时间、切伦科夫条件测得速度，排除数量更多的负π介子本底。*负电荷本身不能证明一个候选者就是反质子。*

产生反质子还须满足重子数守恒和阈值条件。对静止质子靶，
$
  p p -> p p p overline(p), quad
  sqrt(s_"th")=4m_p, quad
  E_"beam,th"=7m_p, quad T_"beam,th"=6m_p
$
这里束流总能量与动能不同，固定靶实验室系中还必须保留整体运动的能量。由此可见，理论允许某个反应、束流达到产生阈值，以及探测器能从本底中识别它，是完成粒子发现时需要分别满足的条件。
