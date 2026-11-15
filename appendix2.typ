#import "@preview/scripst:1.1.3": *
#import "@preview/ratchet:0.0.4": ratchet
#let dif = math.upright("d")

#pagebreak(weak: true)
#show heading.where(level: 2): it => block(sticky: true)[#it]
#show heading.where(level: 3): it => block(sticky: true)[#it]
#counter(heading).update(1)
#set heading(numbering: (n, ..ns) => if ns.pos().len() == 0 {
  [附录#numbering("一", n)]
} else {
  numbering("A.1", n, ..ns)
})
#let appendix-numbering = (..ns) => numbering("A.1", 2, ..ns.pos().slice(1))
#show: ratchet.with(
  init: "reset",
  eq-depth: 3,
  eq-outline: (..ns) => numbering("(A.1.1)", 2, ..ns.pos().slice(1)),
  fig-depth: 2,
  fig-outline: appendix-numbering,
  figure-groups: ((kinds: countblock-counter-names(cb), depth: 2, outline: appendix-numbering, color: blue),),
)

// 源第四章课件第124–147页。
= 群论简介 <app-group>

本附录给出同位旋、味$"SU"(3)$及多重态分类所用的数学语言。张量积、对偶空间和旋量的几何背景可结合@app-tensor 阅读。这里的表示空间是有限维复线性空间；群的维数、表示的维数和群的阶是不同的概念。

// PDF 124–125。
== 群、群运算与物理变换

在集合$G$上定义“乘法”运算。如果满足以下四条，就称$G$为一个*群*（group）：

+ *封闭性*：对任意$a,b in G$，有$a b in G$。
+ *结合律*：对任意$a,b,c in G$，有$(a b)c=a(b c)$。
+ *单位元*：存在$e in G$，对任意$a in G$有$e a=a$。
+ *逆元*：对任意$a in G$，存在$a^(-1) in G$，有$a^(-1)a=e$。

也可以以左单位元、左逆元写出后两条；这些群公理同时给出$a e=a$与$a a^(-1)=e$。单位元及每个元素的逆元都是唯一的。群中元素的个数称为群的*阶*，有限群的阶是有限整数，连续群通常有无限多个元素。如果任意$a,b in G$都满足$a b=b a$，则称为*Abel群*，即交换群。

#figure(
  three-line-table[
    | 抽象群的对象 | 在物理变换中的意义 |
    | --- | --- |
    | $G$ | 对称变换的集合 |
    | $a$ | 一次变换$a$ |
    | $a b$ | 相继变换，先$b$后$a$ |
    | $e$ | 恒等变换 |
    | $a^(-1)$ | 变换$a$的逆变换 |
  ],
  caption: [群运算与物理变换的对应],
)


群公理还没有说明一个抽象变换怎样作用于具体物理对象。例如，同一次空间旋转在坐标、矢量、自旋态上分别怎样表现，需要进一步给出*群的表示*。

// PDF 126–127。
== 表示、忠实表示与表示空间

若群$G$的每个元素$g_k$都对应线性空间$L$上的一个线性变换矩阵$A_k$，并且保持乘法对应
$
  g_1 g_2 -> A_1 A_2,
  quad D(g_1 g_2)=D(g_1)D(g_2)
$
就称$D$是$G$在$L$上的一个*表示*（representation）。$dim L$称为*表示的维数*。更完整地说，$D:G -> "GL"(L)$是一个群同态，满足
$
  D(e)=1, quad D(g^(-1))=D(g)^(-1), quad det D(g) != 0
$
表示把*变换之间的运算法则*变成了*矩阵之间的运算法则*。对应不必一一成立；若它在群与其像之间为同构，即核只有单位元，就称为*忠实表示*（faithful representation）。若所有元素都映为单位矩阵，称为*显然表示*，通常也称平凡表示（trivial representation）。

*同一个群通常有许多不同表示，分别给出不同对象在同一种变换下的变换方式*。例如，$"SU"(2)$的二维表示作用在$J=1/2$粒子的自旋态空间，三维表示作用在$J=1$粒子的自旋态空间；更高自旋对应更高维表示。

// PDF 128–130。
== 等价、可约与不可约表示

对同一维数的可逆矩阵$X$，若
$
  det X != 0, quad A'_k=X A_k X^(-1)
$
则$A'_k$仍保持群乘法，因而也是一个表示。$A_k$与$A'_k$称为*等价表示*：它们描述同一个抽象作用，只是基底不同。

如果表示空间存在一个非零、又不等于整个空间的子空间，并且所有群元素的作用都使这个子空间保持封闭，就称该表示*可约*；没有这种真不变子空间时称为*不可约表示*（irreducible representation）。如果可以选取同一个基底，使所有表示矩阵同时写成
$
  C_k=mat(A_k, 0; 0, B_k)
$
则$A_k$与$B_k$各自构成表示，$C_k$分解为两个表示的直和。这种分块对角形式给出可约表示；能完全分解为不可约分量的表示称为完全可约表示。

// #block(breakable: false)[
//   #note(subname: [补注：可约与完全可约的术语])[
//     上面的分块对角形式表明*完全可约*，不表示不可约。“既约”有时被用作“不可约”的同义词，但不能据此把课件这里的分块矩阵理解成不可约表示。一般可约表示只保证不变子空间，在适当基底下可呈分块三角形；能否同时找到不变补空间，是完全可约的额外要求。
//   ]
// ]

如果所有$D(g)$均为幺正矩阵，就称为*幺正表示*。*对有限维幺正表示，不变子空间的正交补也不变，因此可约就意味着完全可约*。粒子物理主要使用这类表示，此后不再区分两种可约性。有限群及紧群（如$"SU"(n)$）的有限维复表示可以通过选择适当内积化为幺正表示。

矩阵的*直和*定义为
$
  A ⊕ B equiv mat(A, 0; 0, B)
$
一个完全可约表示等价于若干不可约表示的直和。

矩阵的*直积*（张量积）定义为
$
  C=A ⊗ B, quad C_(i j;k l)=A_(i k)B_(j l)
$
复合指标$(i,j)$为行，$(k,l)$为列。若$A_k$和$B_k$是$G$的表示，则
$
  (A(g_1) ⊗ B(g_1))(A(g_2) ⊗ B(g_2))
  =A(g_1 g_2) ⊗ B(g_1 g_2)
$
所以$A_k ⊗ B_k$也是表示。即使两个因子各自不可约，直积一般也可约；可以把它分解成若干不可约表示，其分量可以与原来两个表示都不同。由已知不可约表示的直积构造新不可约表示，是群表示理论的常用方法。

// PDF 131。
== 对称性、简并与多重态

若Hamiltonian在群$G$的每个变换下均不变，
$
  forall g in G, quad D(g)H D(g)^(-1)=H
$
就称$G$为体系的对称性群。考虑一个$n_j$重简并的能级
$
  H psi_j^nu=E_j psi_j^nu, quad nu=1,2,dots,n_j
$
由于
$
  H D(g)psi_j^mu=D(g)H psi_j^mu=E_j D(g)psi_j^mu
$
变换后的态仍处于这个能级的本征空间，所以可以展开为
$
  D(g)psi_j^mu=sum_(nu=1)^(n_j) D_j^(nu mu)(g)psi_j^nu
$
这$n_j$个态张成在$G$下封闭的Hilbert子空间，矩阵$D_j (g)$构成$n_j$维表示。这是*$n_j$维（不可约）表示*，简并态可以称为群的一个表示。

#note(subname: [补充：不变子空间未必不可约])[
  对称性保证能量本征空间构成表示，却不自动保证其不可约；偶然简并可以使多个不可约表示共享同一能量。反过来，若一个有限维复不可约空间内$H$与所有$D(g)$对易，Schur引理给出$H=E 1$，因此这一不可约多重态内的能量相同。应先分解不变空间，再用不可约表示标记受对称性保护的简并。#footnote[J. Mason，#link("https://www.maths.dur.ac.uk/users/jamie.j.mason/RepresentationTheoryNotes-michaelmas/Ch1.S4.html")[Representation Theory, Lecture 4：Schur引理]。]
]


// PDF 132–134。
== 酉群、特殊酉群与生成元；$"SU"(2)$群

$n$维幺正矩阵在矩阵乘法下构成群$"U"(n)$：
$
  A A^dagger=1, quad
  det(A A^dagger)=abs(det A)^2=1
$
$"U"(n)$有$n^2$个独立实参数；再要求$det A=1$，得到特殊酉群$"SU"(n)$，独立实参数数目为$n^2-1$。群中有无限多个元素，这个参数数目不是群的阶。

=== $"SU"(2)$群

$"SU"(2)$有三个独立实参数，群元素可写成
$
  A(alpha_1,alpha_2,alpha_3)
  =exp(i alpha_1 I_1+i alpha_2 I_2+i alpha_3 I_3),
  quad I_i=1/2 sigma_i
$
其中$alpha_i$为实数，$sigma_i$为Pauli矩阵，满足
$
  [I_i,I_j]=i epsilon_(i j k)I_k
$
生成元由单位元附近的导数给出：
$
  I_i= i evaluated(pdv(A, alpha_i))_(alpha_1=alpha_2=alpha_3=0)
$
#newpara()
满足一定对易关系的生成元构成*李代数*。李群的单位元邻域由李代数控制；对这里单连通的$"SU"(2)$，有限维李代数表示可以积分为群表示。一般群的全局拓扑还需另行指定，不能只凭局部对易关系区分$"SU"(2)$与$"SO"(3)$。

任意线性空间上的三个Hermitian矩阵，只要满足同样的对易关系，就是$"SU"(2)$李代数的一个表示，可用指数构造相应$"SU"(2)$群表示。若作对应
$
  I_i -> J_i, quad
  I^2 equiv I_1^2+I_2^2+I_3^2 -> J^2
$
就联系到角动量与空间旋转。可以称其为“空间转动群”；严格地说，$"SU"(2)$是三维旋转群$"SO"(3)$的双覆盖，半整数自旋须用前者。

// PDF 135–137。
=== 用最高权态构造$"SU"(2)$不可约表示

可以从升降算符得到$2I+1$维表示的各步。首先对角化Hermitian矩阵$I_3$。设其最大本征值为$I$，若有简并，用$alpha$标记：
$
  I_3 ket(I","alpha)=I ket(I","alpha),
  quad braket(I","alpha, I","beta)=delta_(alpha beta)
$
定义
$
  I_+ equiv I_1+i I_2, quad I_- equiv I_1-i I_2,
  quad [I_3,I_±]=±I_±, quad [I_+,I_-]=2I_3
$
对任意$I_3$本征态，
$
  I_3 ket(m)=m ket(m),
  quad I_3 I_± ket(m)=(m±1)I_± ket(m)
$
可见$I_±$将本征值升高或降低1。最大本征值态必须满足
$
  I_+ ket(I","alpha)=0,
  quad I_- ket(I","alpha)=N_I (alpha)ket(I-1","alpha)
$
计算两降阶态的内积：
$
  & N_I^* (beta)N_I (alpha)braket(I-1","beta, I-1","alpha) \
  & =bra(I","beta)I_+ I_- ket(I","alpha) \
  & =bra(I","beta)[I_+,I_-]ket(I","alpha) \
  & =bra(I","beta)2I_3 ket(I","alpha)=2I delta_(alpha beta)
$
当$I>0$时，$ket(I-1","alpha)$仍相互正交；可以选取相位，使$N_I (alpha)=sqrt(2I)$；它们与最高态具有相同的简并标签数。若$I=0$，下降系数为零，构造在最高态即终止，给出一维平凡表示。重复操作，得到本征值$m=I-k$的态，以及一般升降公式
$
  I_± ket(m","alpha)
  =sqrt((I∓m)(I±m+1))ket(m±1","alpha)
$
有限维空间中下降链必终止：存在非负整数$l$，使$m_0=I-l$，并且
$
  I_- ket(I-l","alpha)=0
$
由一般系数得
$
  (I+m_0)(I-m_0+1)=0,
  quad m_0=-I, quad l=2I
$
于是
$
  I=l/2, quad l=0,1,2,dots,
  quad m=-I,-I+1,dots,I
$
由于升降算符不改变$alpha$，每个$alpha$对应一个不变子空间；不可约表示只需一条这样的链，故最高态不能有额外重数。表示维数为
$
  dim D^I=2I+1
$
定义二次Casimir算符
$
  I^2 equiv I_1^2+I_2^2+I_3^2,
  quad I^2 ket(I","m)=I(I+1)ket(I","m)
$
这正是角动量量子化的代数结构。物理自旋与同位旋可以使用相同的李代数，但作用于不同的空间，其物理意义应分别说明。

// PDF 138–139。
=== 角动量合成、Clebsch–Gordan系数

总角动量为
$
  vb(J)=vb(J)_A+vb(J)_B,
  quad j=abs(j_A-j_B),abs(j_A-j_B)+1,dots,j_A+j_B
$
耦合基底与直积基底之间的变换为
$
  ket(j","m)=sum_(m_A,m_B)
  C(m_A,m_B;j,m)ket(j_A","m_A)ket(j_B","m_B)
$
其中$C$是Clebsch–Gordan（CG）系数，隐含给定的$j_A,j_B$。它们在$m_A+m_B != m$时为零。用群表示语言，角动量合成就是表示直积的分解，例如
$
  bold(2) ⊗ bold(2)=bold(3) ⊕ bold(1)
$
以及
$
  (bold(2) ⊗ bold(2)) ⊗ bold(2) & =(bold(3) ⊕ bold(1)) ⊗ bold(2) \
                                & =(bold(3) ⊗ bold(2)) ⊕ (bold(1) ⊗ bold(2)) \
                                & =bold(4) ⊕ bold(2) ⊕ bold(2)
$
这里的数字指表示维数；两个二维表示拥有相同的自旋$1/2$，但分别嵌入三粒子空间的不同耦合子空间。


#figure(
  image("pic/ch4/group-cg-pdg-reference.png", width: 100%),
  placement: top,
  caption: [Clebsch–Gordan系数、球谐函数与$d$函数参考表],
)

// PDF 140–141。
=== 角动量态的转动与Wigner函数

将旋转后的态在相同$j$子空间中展开：
$
  R(theta,vb(n))ket(j","m) & =sum_(m') ket(j","m')bra(j","m')R(theta,vb(n))ket(j","m) \
                           & =sum_(m')D^j_(m' m)(theta,vb(n))ket(j","m')
$
用Euler角表示主动转动，采用$z$–$y$–$z$次序
$
  R(alpha,beta,gamma)
  =exp(-i alpha J_z)exp(-i beta J_y)exp(-i gamma J_z)
$
因此
$
  D^j_(m' m)(alpha,beta,gamma) & =e^(-i m' alpha)bra(j","m')e^(-i beta J_y)ket(j","m)e^(-i m gamma) \
                               & =e^(-i m' alpha)d^j_(m' m)(beta)e^(-i m gamma)
$
其中
$
  d^j_(m' m)(beta)=bra(j","m')e^(-i beta J_y)ket(j","m)
$
称为Wigner小$d$函数。角动量态的转动由此归结为计算$d$函数。

#figure(
  image("pic/ch4/group-euler-angles.png", width: 39%),
  caption: [Euler角与坐标轴示意],
)

五条$d$函数关系为
$
     d^j_(m' m)(beta) & =d^j_(m m')(-beta) \
    d^j_(m' m)(-beta) & =(-1)^(m'-m)d^j_(m' m)(beta) \
     d^j_(m' m)(beta) & =(-1)^(m'-m)d^j_(-m' -m)(beta) \
      d^j_(m' m)(±pi) & =(-1)^(j±m')delta_(m',-m) \
  d^j_(m' m)(pi±beta) & =(-1)^(j+m')d^j_(∓m' ±m)(beta)
$
符号与前述Euler角、基底相位及指标顺序共同组成约定；换成另一套转动约定时，应整体变换这些关系。

// PDF 142–144。
== $"SU"(3)$李代数与共轭表示

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

群元素及生成元满足
$
  g({xi_i})=exp(i sum_(i=1)^8 xi_i I_i),
  quad [I_i,I_j]=i sum_k f_(i j k) I_k
$
$f_(i j k)$完全反对称，非零独立值为
$
  f_(1 2 3)=1, quad f_(4 5 8)=f_(6 7 8)=sqrt(3)/2 \
  f_(1 4 7)=f_(1 6 5)=f_(2 4 6)=f_(2 5 7)
  =f_(3 4 5)=f_(3 7 6)=1/2
$
一组满足这些对易关系的八个Hermitian矩阵构成$frak("su")(3)$李代数的表示，由指数映射构造群表示。在*三维基础表示*中，还有
$
  {I_i,I_j}=sum_k d_(i j k)I_k+1/3 delta_(i j)1_3
$
$d_(i j k)$完全对称；反对易式中的单位矩阵不能省略。此特定系数恒等式不是任意维不可约表示中都具有相同形式的普遍李代数关系。

这里以$tilde(I)_i$表示矩阵$I_i$的转置。由于生成元Hermitian，$I_i^*=tilde(I)_i$。对原关系取复共轭并将生成元定义为
$
  I_i^C equiv -I_i^*=-tilde(I)_i
$
得到
$
  [I_i^C,I_j^C]
  =[I_i^*,I_j^*]
  =-i sum_k f_(i j k)I_k^*
  =i sum_k f_(i j k)I_k^C
$
它仍满足相同李代数，因此给出*复共轭表示*。在群矩阵层面
$
  D^*(g)=exp(-i sum_i xi_i I_i^*)
$
与其复共轭表示等价的表示称为自共轭表示，还须进一步区分实表示与赝实表示。

#note(subname: [补充：实、赝实与复表示])[
  更严格地，若$D$与$D^*$等价，还要区分实表示和赝实表示：实表示可在适当基底下取全实矩阵，赝实表示虽然等价于共轭表示，却没有这样的实基底。$"SU"(2)$的二维基础表示是*赝实*的；$"SU"(3)$的三维基础表示则与其共轭表示不等价，是复表示。#footnote[M. Dine，#link("https://scipp-legacy.pbsci.ucsc.edu/~dine/ph222/group_theory_primer.pdf")[Physics 222, Group Theory Primer, §1]。]
]


// PDF 145–147。
== 正反粒子、共轭表示与同位旋二重态

设一组粒子态按某不可约表示变换，写作列阵
$
  cal(A)=mat(A_1; A_2; dots; A_m),
  quad cal(A)'=exp(i sum_i xi_i I_i)cal(A)
$
共同的$C$变换相位可以提出并约去。将粒子态变成反粒子态后，变换关系为
$
  overline(cal(A))' & =C exp(i sum_i xi_i I_i)C^(-1) overline(cal(A)) \
                    & =exp(i sum_i xi_i C I_i C^(-1))overline(cal(A))
$
对于反粒子，相加性荷的本征值应反号。相应地有
$
  C I_i C^(-1)=-tilde(I)_i
$
因而反粒子态按复共轭表示变换。这里的矩阵关系连接粒子与反粒子两个表示空间；不应把它理解成在同一不可约空间内用一个普通矩阵把所有非Abel生成元同时变为负自身。

以核子同位旋二重态为例，粒子与反粒子列阵分别满足
$
  mat(p'; n')=exp(i sum_i xi_i sigma_i/2)mat(p; n)
$
以及
$
  mat(overline(p)'; overline(n)')
  =exp(i sum_i xi_i (-tilde(sigma)_i)/2)mat(overline(p); overline(n))
$
利用Pauli矩阵恒等式
$
  sigma_2 sigma_i sigma_2^(-1)=-tilde(sigma)_i
$
可以得到
$
  -i sigma_2 mat(overline(p)'; overline(n)')
  =exp(i sum_i xi_i sigma_i/2)
  (-i sigma_2)mat(overline(p); overline(n))
$
所以
$
  (-i sigma_2)mat(overline(p); overline(n))
  =mat(-overline(n); overline(p))
$
与$mat(p; n)$具有相同的同位旋变换方式。这解释了第三章在核子和反核子多重态中引入相对负号的来源：它由表示等价关系与所选相位约定联系起来。$"SU"(2)$二重态与其共轭表示等价，严格分类为赝实；$"SU"(3)$的基础表示不是自共轭的，不存在把$bold(3)$与$overline(bold(3))$以固定换基矩阵等同的类似关系。

