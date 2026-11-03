#import "@preview/scripst:1.1.3": *
#import "@preview/ratchet:0.0.4": ratchet
#let dif = math.upright("d")

#pagebreak(weak: true)
#counter(heading).update(0)
#set heading(numbering: (n, ..ns) => if ns.pos().len() == 0 {
  [附录#numbering("一", n)]
} else {
  numbering("A.1", n, ..ns)
})
#show heading.where(level: 2): it => block(sticky: true)[#it]
#show heading.where(level: 3): it => block(sticky: true)[#it]
// 附录沿用正文样式，首页只保留书名，后续页显示附录标题。
#set page(header: context {
  set text(font: font.header)
  let sec = query(<app-tensor>).first()
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
#show: ratchet.with(
  init: "reset",
  eq-depth: 3,
  eq-outline: "(A.1.1)",
  fig-depth: 2,
  fig-outline: "A.1",
  figure-groups: ((kinds: countblock-counter-names(cb), depth: 2, outline: "A.1", color: blue),),
)

= 矢量、张量与物理中的变换 <app-tensor>

矢量不只是三个数，张量也不只是多维数组。它们首先是线性空间上的几何对象；选定基底后，才用一组数表示。换坐标时分量怎样变化，体现了这些数表示的究竟是什么对象。本附录从线性代数出发，建立对偶空间、张量积、度量与外代数，再说明电动力学、相对论和量子场论为何采用这些语言。

以下先讨论有限维实向量空间；量子态和旋量涉及复空间时另作说明。拉丁指标$i,j,k=1,dots,n$，相对论的希腊指标$mu,nu=0,1,2,3$。一上一下的重复指标默认求和；自由指标在等式两侧必须相同。时空采用$g_(mu nu)="diag"(1,-1,-1,-1)$。涉及电磁学单位时保留$c$，旋量与场论部分取$hbar=c=1$。

#figure(
  three-line-table[
    | 要回答的问题 | 数学结构 | 物理中遇到的量 |
    | --- | --- | --- |
    | 如何相加和作线性组合？ | 向量空间及对偶空间 | 位移、动量、线性测量 |
    | 如何输入多个方向？ | 张量积、多重线性 | 电导率、应力、度量 |
    | 如何测长度和角度？ | 度量、升降指标 | 欧氏内积、时空间隔 |
    | 如何记录面积与定向？ | 外代数、体积形式、Hodge对偶 | 角动量、磁通、轴矢量 |
    | 如何比较不同位置的量？ | 张量场、联络与协变导数 | 曲线坐标、引力 |
    | 如何在变换下组织物理规律？ | 群的表示、协变方程 | 电磁张量、Dirac旋量 |
  ],
  caption: [本附录的数学脉络],
)

== 向量、基底与对偶空间

=== 先有向量，再有分量

一个实向量空间$V$由可以相加、可以乘实数的对象组成，并满足线性代数的公理。几何箭头是一个例子；多项式、函数和量子态也可以组成向量空间。*“向量”首先表达线性结构，不保证它一定是三维空间中的箭头。*

设$dim V=n$，选取一组基底$vb(e)_1,dots,vb(e)_n$，则每个向量唯一写为
$
  vb(v)=v^i vb(e)_i=sum_(i=1)^n v^i vb(e)_i
$
几何对象$vb(v)$与坐标列$v=(v^1,dots,v^n)^T$必须区分。同一个向量可以在不同基底下具有不同的坐标。

把基矢排成一行$B=(vb(e)_1,dots,vb(e)_n)$。约定换基为$B'=B M$，其中$M$可逆。保持向量不变时，
$
  vb(v)=B v=B'v'=B M v', quad v'=M^(-1)v
$
*基底乘$M$，向量的分量乘$M^(-1)$。* 分量与基底的变化相互补偿，这就是“逆变分量”（contravariant components）一词的来源。它不是说向量的方向与坐标轴相反。

主动变换与被动换基要分开。主动变换$L:V -> V$把$vb(v)$变成另一个向量$L vb(v)$；被动换基改变同一向量的表示。两者的矩阵可能互为逆矩阵，因而写变换公式前必须说明正在改变对象还是基底。

=== 对偶向量是线性函数

*对偶空间*（dual space）定义为
$
  V^*="Hom"(V,RR)
$
其中的元素$alpha$是一个把向量线性映成数的函数：
$
  alpha(a vb(u)+b vb(v))=a alpha(vb(u))+b alpha(vb(v))
$
这类对象称为*协向量*（covector）或*一形式*（one-form）。相对于基底$vb(e)_i$，定义对偶基底$theta^i$满足
$
  theta^i(vb(e)_j)=delta^i_(" "j)
$
于是
$
  alpha=alpha_i theta^i, quad
  alpha(vb(v))=alpha_i v^i
$
其中$alpha_i=alpha(vb(e)_i)$，$v^i=theta^i(vb(v))$。上下指标来自对象的类型，配对$alpha(vb(v))$不依赖基底。

由$B'=B M$可得
$
  theta'^i=(M^(-1))^i_(" "j)theta^j, quad
  alpha'_i=M^j_(" "i)alpha_j
$
若把$alpha$的分量排成行矩阵，则$alpha'=alpha M$；排成列矩阵则$alpha'=M^T alpha$。因此协向量并不等于“把一个列向量横过来”；行列只是表示方法，线性函数才是定义。

#block(breakable: false)[
#example(subname: [微分为什么是协向量])[
  对标量函数$f$，沿方向$vb(v)$的变化率是
  $
    dd(f)(vb(v))=v^i partial_i f, quad
    dd(f)=(partial_i f)theta^i
  $
  方向$vb(v)$是输入，方向导数是输出的数，故$dd(f)$属于对偶空间。写成通常的“梯度箭头”$nabla f$，还需要度量把一形式变成向量。
]
]
#newpara()

=== 坐标变换与雅可比

在有坐标$x^i$的空间中，切向量的自然基底是$vb(e)_i=partial/partial x^i$，其对偶是$theta^i=dd(x^i)$。设
$
  x'^i=x'^i(x), quad J^i_(" "j)=pdv(x'^i, x^j)
$
由链式法则，
$
  vb(e)'_i=(J^(-1))^j_(" "i)vb(e)_j, quad
  theta'^i=J^i_(" "j)theta^j
$
这对应上一节的$M=J^(-1)$，所以分量变换为
$
  v'^i=J^i_(" "j)v^j, quad
  alpha'_i=(J^(-1))^j_(" "i)alpha_j
$
向量的上指标乘雅可比，协向量的下指标乘逆雅可比。这里上指标与“基底乘什么矩阵”之间没有矛盾，因为坐标基底本身乘的是$J^(-1)$。

#example(subname: [把一个坐标数值放大两倍])[
  取$x'=2x$。沿曲线的切向量分量和标量函数的导数分别满足
  $
    v'^x=dv(x', lambda)=2v^x, quad
    pdv(f, x')=1/2 pdv(f, x)
  $
  所以
  $
    pdv(f, x')v'^x=pdv(f, x)v^x
  $
  一个乘2，一个除以2，使方向导数保持不变。这是协变与逆变分量相互配对的最简单例子。
]
#newpara()

=== 复空间中的bra与ket

在复空间上，线性对偶由复线性函数组成。Hilbert空间的内积进一步给出$ket(psi) -> bra(psi)$的对应；在物理学的内积约定下，它对$ket(psi)$是*反线性*的：$bra(a psi)=a^* bra(psi)$。这与实空间中由实双线性度量降指标的线性映射有所区别。

量子力学中的bra、ket和算符同样使用对偶与线性映射，但它们的指标首先标记Hilbert空间的基底，不能自动解释成空间坐标指标。自旋二分量、Dirac四分量与三维或四维几何矢量的分量，需要分别确定变换规则。

== 张量积、多重线性与指标运算

=== 从双线性关系引入张量

各向异性导电中，电流方向不一定与电场平行，关系应写成
$
  j^i=sigma^i_(" "j) E^j
$
电导率$sigma$是把一个向量映成另一个向量的线性映射。另一种二阶对象是双线性型$Q$，它输入两个向量而输出一个数：
$
  Q(vb(u),vb(v))=Q_(i j)u^i v^j
$
二者都能用矩阵表示，但输入、输出的类型不同，变换公式也不同。

先定义一个简单张量积$vb(u) ⊗ alpha$：它作为线性映射作用于$vb(v)$时，
$
  (vb(u) ⊗ alpha)(vb(v))=vb(u)alpha(vb(v))
$
所有这类对象的线性组合组成$V ⊗ V^*$，它自然同构于线性算符空间$"End"(V)$。例如
$
  I=vb(e)_i ⊗ theta^i, quad
  A=A^i_(" "j)vb(e)_i ⊗ theta^j
$
*一般张量是简单张量的和，不一定能写成一个简单张量积。* 例如二维单位算符$vb(e)_1 ⊗ theta^1+vb(e)_2 ⊗ theta^2$的矩阵秩为2，而单个$vb(u) ⊗ alpha$的矩阵秩至多为1。

=== 一般的$(r,s)$型张量

定义
$
  cal(T)^(r,s)(V)=V^(⊗ r) ⊗ (V^*)^(⊗ s)
$
其元素称为具有$r$个逆变指标、$s$个协变指标的张量。等价地，它是一个多重线性映射
$
  T:(V^*)^r times V^s -> RR
$
这里*r个上指标对应r个协向量输入，s个下指标对应s个向量输入*。这是因为每个$V$因子与一个$V^*$输入配对，每个$V^*$因子与一个$V$输入配对。

在基底下展开为
$
  T=T^(i_1 dots i_r)_(" "j_1 dots j_s)
  vb(e)_(i_1) ⊗ dots ⊗ vb(e)_(i_r)
  ⊗ theta^(j_1) ⊗ dots ⊗ theta^(j_s)
$
其分量空间维数是$n^(r+s)$。$r+s$称为*阶数*，与矩阵的秩不同。标量是$(0,0)$型，向量是$(1,0)$型，协向量是$(0,1)$型。

张量积的本质是把多重线性关系线性化：任意双线性映射$b:U times W -> Z$，都唯一对应一个线性映射$tilde(b):U ⊗ W -> Z$，使$tilde(b)(u ⊗ w)=b(u,w)$。因此张量积不仅是增加数组的维数，也是在组织“分别对各输入线性”的规律。

=== 每个指标分别变换

由基底展开，保持同一几何对象不变可推出
$
  T'^(i_1 dots i_r)_(" "j_1 dots j_s)
  =J^(i_1)_(" "a_1) dots J^(i_r)_(" "a_r)
  (J^(-1))^(b_1)_(" "j_1) dots (J^(-1))^(b_s)_(" "j_s)
  T^(a_1 dots a_r)_(" "b_1 dots b_s)
$
这不是对数组额外施加的装饰，而是同一多重线性对象换表示后必然满足的规则。反过来，若给定一组分量并规定它们总按此规则变换，就可以用它们定义张量。

二阶张量特别值得比较。用矩阵记法，
$
  T^i_(" "j): & quad T'=J T J^(-1) \
     T^(i j): & quad T'=J T J^T \
     T_(i j): & quad T'=J^(-T) T J^(-1)
$
第一种是*相似变换*，后两种是相应的*合同变换*。只有对正交矩阵$R$，$R^(-1)=R^T$，三种写法才都表现为$R T R^T$。正交归一坐标把本来不同的类型隐藏了。

=== 张量积、缩并与对称化

张量积把指标并列，例如
$
  (vb(u) ⊗ vb(v))^(i j)=u^i v^j, quad
  (A ⊗ B)^i_(" "j k)=A^i B_(j k)
$
*缩并*（contraction）用自然配对消去一个上指标和一个下指标，例如
$
  alpha_i v^i, quad A^i_(" "i)="tr"(A), quad
  C^i_(" "k)=A^i_(" "j)B^j_(" "k)
$
迹的坐标无关性由$"tr"(J A J^(-1))="tr"(A)$体现。两个上指标之间不能直接按爱因斯坦约定求和；如要构造内积，必须引入一个具有两个下指标的度量。

对同类型指标可以作对称化与反对称化：
$
  T_((i j))=1/2(T_(i j)+T_(j i)), quad
  T_([i j])=1/2(T_(i j)-T_(j i))
$
这里圆括号、方括号是“对指标作运算”的记号，不是额外指标。任何二阶协变张量都唯一分解为$T_(i j)=T_((i j))+T_([i j])$。两部分的独立分量数分别是$n(n+1)/2$和$n(n-1)/2$。

== 度量、长度与升降指标

=== 度量是非退化的对称双线性型

度量$g$把两个向量映成数，满足$g(vb(u),vb(v))=g(vb(v),vb(u))$，并且非退化。其分量和作用是
$
  g_(i j)=g(vb(e)_i,vb(e)_j), quad
  g(vb(u),vb(v))=g_(i j)u^i v^j
$
正定时可定义长度$sqrt(g(vb(v),vb(v)))$和角度；Minkowski度量不是正定的，非零向量也可能具有零的自身内积。

度量的非退化性使它给出同构
$
  flat:V -> V^*, quad vb(v)^flat=g(vb(v),dot), quad
  v_i=g_(i j)v^j
$
设$g^(i j)$是逆矩阵分量，则逆映射记为$sharp$：
$
  g^(i k)g_(k j)=delta^i_(" "j), quad
  alpha^sharp=g^(i j)alpha_j vb(e)_i
$
因此升降指标的本质是*借助度量在向量空间与对偶空间之间转换*。没有选定度量时，$V$和$V^*$虽同维，却没有这样的自然对应。

度量本身按$(0,2)$型张量变换：
$
  g'=J^(-T)g J^(-1), quad
  g'_(i j)v'^i w'^j=g_(i j)v^i w^j
$
坐标变了，度量分量也可能变；保持不变的是它给出的几何内积。正交变换仅仅是保持欧氏单位度量矩阵不变的那类变换。

=== 曲线坐标把上下指标的差别显露出来

二维欧氏平面上取$x=r cos theta$、$y=r sin theta$。直接微分得
$
  dd(s)^2=dd(x)^2+dd(y)^2=dd(r)^2+r^2 dd(theta)^2
$
故坐标基底下
$
  (g_(i j))=mat(1, 0; 0, r^2), quad
  v_r=v^r, quad v_theta=r^2 v^theta
$
对曲线$r(lambda),theta(lambda)$，$v^r=dot(r)$、$v^theta=dot(theta)$，实际速率为
$
  abs(vb(v))^2=dot(r)^2+r^2 dot(theta)^2
$
单位径向、切向基底下的物理分量则为$v^hat(r)=dot(r)$、$v^hat(theta)=r dot(theta)$，与坐标分量$v^theta$不同。不能混用“坐标基底”和“单位基底”。

同样，$dd(f)=pdv(f, r)dd(r)+pdv(f, theta)dd(theta)$，对应的梯度向量是
$
  "grad" f=pdv(f, r) partial/partial r
  +1/r^2 pdv(f, theta) partial/partial theta
  =pdv(f, r)vb(e)_hat(r)+1/r pdv(f, theta)vb(e)_hat(theta)
$
熟悉的极坐标梯度公式中的$1/r$，正是度量和单位基底共同产生的。

#block(breakable: false)[
#note(subname: [协向量、协变指标与Lorentz协变性])[
  “协向量”指$V^*$中的对象；“协变指标”指下指标的变换规律；“方程协变”指整个方程正确变换并保持相同的几何关系。这三个用法相关，但不能相互替代。赝矢量也可以升降指标；“赝”属于另一种分类。
]
]
#newpara()

== 定向、普通量与赝量

=== 旋转与反射不是同一类变换

保持欧氏内积的矩阵满足$R^T R=I$，组成正交群$"O"(n)$。取行列式得$(det R)^2=1$，所以分为两类：
$
  det R=+1: "保持定向", quad
  det R=-1: "翻转定向"
$
保持定向的正交变换组成$"SO"(n)$。定向是把有序基底分成两类的结构；三维中表现为右手系与左手系。选择度量以前也能讨论定向，因为可逆矩阵的行列式正负已经足够区分这两类。

在三维，宇称变换通常取$P=-I_3$，把所有空间坐标反号，且$det P=-1$。但在$n$维，
$
  det(-I_n)=(-1)^n
$
因此二维的全反演只是旋转$180 degree$，并不翻转定向。在任意维数中，单独反射一个坐标，如$"diag"(-1,1,dots,1)$，才总是翻转定向。

=== 六类量与宇称

暂用三维正交归一基底，把上下指标的数值差别隐藏起来。普通量和赝量的定义如下：

#figure(
  three-line-table[
    | 类型 | 正交变换$R$ | 全空间反演$P=-I_3$ |
    | --- | --- | --- |
    | 标量$s$ | $s'=s$ | $s'=s$ |
    | 赝标量$p$ | $p'=det(R)p$ | $p'=-p$ |
    | 极矢量$vb(v)$ | $vb(v)'=R vb(v)$ | $vb(v)'=-vb(v)$ |
    | 轴矢量$vb(a)$ | $vb(a)'=det(R)R vb(a)$ | $vb(a)'=vb(a)$ |
    | 普通二阶张量$T$ | $T'=R T R^T$ | $T'=T$ |
    | 赝二阶张量$tilde(T)$ | $tilde(T)'=det(R)R tilde(T)R^T$ | $tilde(T)'=-tilde(T)$ |
  ],
  caption: [在三维正交变换下，赝量比相应普通量多一个定向符号],
)

轴矢量（axial vector）也叫赝矢量（pseudovector），普通空间矢量也叫极矢量（polar vector）。“赝”并不表示不真实。*极矢量和轴矢量在普通旋转下相同，只在翻转定向时相差额外的负号。*

例如镜面反射$R="diag"(-1,1,1)$作用为
$
  (v_x,v_y,v_z) & -> (-v_x,v_y,v_z) \
  (a_x,a_y,a_z) & -> (a_x,-a_y,-a_z)
$
所以“轴矢量在反射下不变”不够准确；它只在三维全空间反演下三个分量都不变。电场$vb(E)$、位移$vb(r)$、动量$vb(p)$是极矢量，角动量$vb(L)$、自旋$vb(S)$、磁场$vb(B)$是轴矢量。

如果量是场，还必须变换自变量。对主动宇称变换，
$
  vb(E)'(t,vb(x))=-vb(E)(t,-vb(x)), quad
  vb(B)'(t,vb(x))=vb(B)(t,-vb(x))
$
这里把原配置映成新配置。只有具体配置满足$vb(B)'(t,vb(x))=vb(B)(t,vb(x))$时，才说明该配置具有宇称对称性。*变换类型*与*某个解是否对称*是不同的问题。

=== 一般坐标下的赝张量与张量密度

对于一般可逆雅可比$J$，行列式的大小和符号必须区分：
$
  det J="sgn"(det J) abs(det J)
$
定向扭曲张量，即这里所说的赝张量，相对于普通张量的规则额外带$"sgn"(det J)$。例如赝标量变为$p'="sgn"(det J)p$，赝向量的分量为
$
  a'^i="sgn"(det J)J^i_(" "j)a^j
$
*张量密度*（tensor density）还带雅可比大小的幂。明确约定权重为$w$的密度按$abs(det J)^(-w)$乘普通张量规则变换。标量密度$rho$的权重为1时，
$
  rho'=abs(det J)^(-1)rho, quad
  rho' dif^n x'=rho dif^n x
$
其中$dif^n x$是无定向的坐标体积元。于是$rho dif^n x$可以积分而与坐标无关。也可以同时带定向符号和密度权重；有些文献对“权重”的正负采用相反约定，需从具体变换公式判断。

正交变换中$abs(det R)=1$，且$det R="sgn"(det R)$，因此初等电磁学常直接写$det R$。一旦进入非正交坐标变换，这些概念就不能混用。

=== Levi-Civita符号与真正的体积形式

定义数值符号$[i_1 dots i_n]$：若指标有重复则为0；偶排列为$+1$，奇排列为$-1$，并规定$[1 dots n]=+1$。行列式恒等式给出
$
  J^(i_1)_(" "a_1) dots J^(i_n)_(" "a_n)[a_1 dots a_n]
  =(det J)[i_1 dots i_n]
$
如果每个坐标系里都强行把这组数重新取为$0,plus.minus 1$，它们就不按普通张量规则变换。*Levi-Civita数值符号并不是任意坐标下的普通张量。*

选定度量与一个固定定向后，可定义体积形式$omega$。在与所选定向一致的坐标中，
$
  omega=sqrt(abs(det g)) dd(x^1) ∧ dots ∧ dd(x^n)
$
它的分量为$omega_(i_1 dots i_n)=sqrt(abs(det g))[i_1 dots i_n]$。在反定向坐标中，表达式要加负号；这样$omega$才始终是同一个普通$n$形式。

另一方面，若约定在*每一套*坐标中都使用正的$sqrt(abs(det g))$乘数值符号，就得到带定向扭曲的对象。在讨论轴矢量时，“固定右手规则下的Levi-Civita赝张量”常采用这种语言。两种约定都可使用，关键是不能同时把$epsilon$看作永远不变的数值数组和普通体积张量。

度量行列式满足
$
  det g'=det g/(det J)^2, quad
  sqrt(abs(det g'))=abs(det J)^(-1)sqrt(abs(det g))
$
因此$sqrt(abs(det g))$本身是权重1的标量密度。把它乘进坐标积分元后，才得到几何体积。

== 外代数、Hodge对偶与叉乘

=== 楔积保留有向面积

两个向量的张量积$vb(u) ⊗ vb(v)$既有对称部分，也有反对称部分。定义双向量
$
  vb(u) ∧ vb(v)=vb(u) ⊗ vb(v)-vb(v) ⊗ vb(u)
$
其反对称分量为$W^(i j)=u^i v^j-u^j v^i$。它表示两个方向张成的有向面积，而非某个事先指定的法向箭头。交换两个向量时反号，平行时为零。

类似地，一形式的楔积满足
$
  (alpha ∧ beta)(vb(u),vb(v))
  =alpha(vb(u))beta(vb(v))-alpha(vb(v))beta(vb(u))
$
它是一个交替双线性函数，称为*二形式*。$k$形式是完全反对称的$k$阶协变张量，组成$Lambda^k V^*$。任意$k$形式可写成
$
  alpha=1/(k!)alpha_(i_1 dots i_k)
  theta^(i_1) ∧ dots ∧ theta^(i_k), quad
  dim Lambda^k V^*=binom(n, k)
$
前面的$1/k!$避免把每组不同指标的所有排列重复计数。例如$alpha=1/2 alpha_(i j)theta^i ∧ theta^j$，并且$alpha_(i j)=alpha(vb(e)_i, vb(e)_j)$。

楔积满足结合律及分次交换律：
$
  alpha ∧ beta=(-1)^(k l)beta ∧ alpha,
  quad alpha in Lambda^k V^*, quad beta in Lambda^l V^*
$
一形式与自身的楔积为零，但二形式与自身的楔积未必为零。张量积$⊗$、楔积$∧$和三维叉乘$times$是三种不同运算；中文“外积”有时也被用来指叉乘，使用时应看清符号。

=== Hodge对偶需要度量和定向

度量诱导$k$形式之间的内积：
$
  ⟨ alpha,beta ⟩=1/(k!)alpha_(i_1 dots i_k)beta^(i_1 dots i_k)
$
在$n$维有度量、定向的空间中，Hodge对偶$star$由下式唯一确定：
$
  alpha ∧ star beta=⟨ alpha,beta ⟩ omega,
  quad star:Lambda^k V^* -> Lambda^(n-k)V^*
$
它把一个有向$k$维对象对应到其互补方向上的$(n-k)$维对象。度量决定正交与大小，定向决定符号；缺少其中任何一个，通常都不能定义这里的$star$。

三维右手正交归一基底中，
$
  star theta^1=theta^2 ∧ theta^3, quad
  star(theta^1 ∧ theta^2)=theta^3, quad
  star 1=theta^1 ∧ theta^2 ∧ theta^3
$
若度量的负号数为$q$，则作用两次的结果为
$
  star star alpha=(-1)^(k(n-k)+q)alpha
$
三维欧氏空间$q=0$，一形式和二形式上的$star^2=+1$。四维Lorentz时空$q=3$，二形式上的$star^2=-1$；因此实二形式没有非零的$star F=plus.minus F$解，复化后相应本征值为$plus.minus i$。

=== 三维叉乘是对反对称二阶对象的特殊编码

在三维，$dim Lambda^2 V^*=binom(3, 2)=3$，与一形式空间同维。用度量和定向可定义
$
  (vb(a) times vb(b))^flat=star(vb(a)^flat ∧ vb(b)^flat)
$
三维正交归一基底下，令$ϵ^(1 2 3)=+1$，则
$
  c^i=1/2 ϵ^(i j k)W_(j k)
  =ϵ^(i j k)a_j b_k, quad
  W_(i j)=ϵ_(i j k)c^k
$
这就是通常的叉乘。*楔积给出有向平面；叉乘在此基础上借助右手规则，把它编码成法向轴矢量。*

为什么是轴矢量？对任意正交矩阵$R$，由行列式的几何意义，
$
  (R vb(u)) dot ((R vb(a)) times (R vb(b)))
  =det(R) vb(u) dot (vb(a) times vb(b))
$
由于内积不变且对任意$vb(u)$成立，得到
$
  (R vb(a)) times (R vb(b))
  =det(R)R(vb(a) times vb(b))
$
额外的$det R$正是把有向平面变成法向箭头时引入定向的结果。两个极矢量的叉乘是轴矢量；一个极矢量与一个轴矢量的叉乘是极矢量；两个轴矢量的叉乘仍为轴矢量。

#note(subname: [为什么不能把三维公式直接搬到一般线性变换])[
  若在同一固定欧氏空间中主动施加一般可逆变换$A$，则
  $
    (A vb(a)) times (A vb(b))=det(A) A^(-T)(vb(a) times vb(b))
  $
  只有$A=R$正交时，$A^(-T)=R$，才回到$det(R)R$的形式。例如均匀伸缩$A=lambda I$给出叉乘放大$lambda^2$，不是$lambda^4$。被动改变一般坐标时还需同时变换度量；不能把主动伸缩与被动换坐标混为一谈。
]
#newpara()

在不同维数中，二形式对偶到的阶数为
$
  n=2: Lambda^2 -> Lambda^0, quad
  n=3: Lambda^2 -> Lambda^1, quad
  n=4: Lambda^2 -> Lambda^2
$
所以二维的有向面积可编码为赝标量，三维可编码为轴矢量，四维对偶后仍是二形式。七维存在依赖额外代数结构的特殊二元叉乘；它不是仅凭度量与定向、用上述二形式Hodge对偶得到的三维构造。

=== 角动量首先对应旋转平面

任意维数中都可定义
$
  L^(i j)=r^i p^j-r^j p^i
$
它是普通的反对称二阶张量，具有$n(n-1)/2$个独立分量，正好对应旋转平面的数目。三维中才进一步写成
$
  L^k=1/2 ϵ^(k i j)L_(i j), quad vb(L)=vb(r) times vb(p)
$
宇称下$vb(r)$、$vb(p)$都变号，$L^(i j)$不变；把它编码成三维轴矢量后，$vb(L)$也不变。力矩、角速度以及自旋的空间旋转类型具有同样的轴矢量结构。自旋并不因此成为经典小球的自转。

== 从张量代数到张量分析

=== 张量场与外导数

以上首先是在一个点的线性空间中讨论代数。若每个点$x$都有切空间$T_x M$，并在各点连续或光滑地指定张量，就得到*张量场*。曲线坐标的基底随位置变化，不同点的向量不能只凭分量相同就认作相同。

对于微分形式，存在不需要度量的外导数$dif$。若$alpha=1/k! alpha_(i_1 dots i_k)dd(x^(i_1)) ∧ dots ∧ dd(x^(i_k))$，则
$
  dd(alpha)=1/(k!)partial_j alpha_(i_1 dots i_k)
  dd(x^j) ∧ dd(x^(i_1)) ∧ dots ∧ dd(x^(i_k))
$
它把$k$形式变成$k+1$形式，并满足
$
  dif^2=0, quad
  dif(alpha ∧ beta)=dd(alpha) ∧ beta+(-1)^k alpha ∧ dd(beta)
$
第一式来自混合偏导的对称性与楔积的反对称性。广义Stokes定理写成
$
  integral_(partial Omega) alpha=integral_Omega dd(alpha)
$
边界上的积分与内部的外导数积分相联系；通常的梯度定理、Stokes环路定理和Gauss散度定理是它在相应维数中的具体形式。

在三维欧氏空间中，常用运算可写为
$
  ("grad" f)^flat=dd(f), quad
  ("curl" vb(v))^flat=star dd(vb(v)^flat), quad
  "div" vb(v)=star dif star(vb(v)^flat)
$
所以$"curl" "grad" f=0$、$"div" "curl" vb(v)=0$都来自$dif^2=0$。这些公式也展示了为什么旋度带轴矢量性质：其中含有一次依赖定向的Hodge对偶。

=== 普通偏导为什么不总是张量

向量场满足$v'^i(x')=J^i_(" "k)(x)v^k(x)$。继续求导得
$
  partial'_j v'^i
  =(J^(-1))^l_(" "j)J^i_(" "k)partial_l v^k
  +(J^(-1))^l_(" "j)(partial_l J^i_(" "k))v^k
$
第一项是预期的$(1,1)$型变换，第二项却含有雅可比的导数。因此$partial_j v^i$在一般曲线坐标下不是张量。对标量的一阶导数$partial_i f$没有这项，已经是协向量；但普通二阶偏导$partial_i partial_j f$一般也需要修正。

引入*联络*后，定义
$
  nabla_j v^i=partial_j v^i+Gamma^i_(j k)v^k, quad
  nabla_i alpha_j=partial_i alpha_j-Gamma^k_(i j)alpha_k
$
每个上指标加一个联络项，每个下指标减一个联络项。例如
$
  nabla_k T^i_(" "j)=partial_k T^i_(" "j)
  +Gamma^i_(k l)T^l_(" "j)-Gamma^l_(k j)T^i_(" "l)
$
这些项计入基底的变化，使整体按张量变换。$Gamma$自身并不是张量；它的非齐次变换恰好抵消普通偏导中的额外项。

=== Levi-Civita联络与平直空间的例子

给定度量后，要求无挠且与度量相容，即$nabla_k g_(i j)=0$，唯一确定Levi-Civita联络：
$
  Gamma^i_(j k)=1/2 g^(i l)
  (partial_j g_(l k)+partial_k g_(l j)-partial_l g_(j k))
$
二维平面的极坐标中，非零系数为
$
  Gamma^r_(theta theta)=-r, quad
  Gamma^theta_(r theta)=Gamma^theta_(theta r)=1/r
$
沿曲线的协变加速度于是给出熟悉的径向、切向物理分量：
$
  a^r=dot.double(r)-r dot(theta)^2, quad
  a^hat(theta)=r dot.double(theta)+2dot(r)dot(theta)
$
平面仍然没有曲率；非零联络系数只反映所选极坐标基底随位置变化。真正检测曲率的是协变导数的非对易性及其对应的Riemann张量：
$
  [nabla_i,nabla_j]v^k=R^k_(" "l i j)v^l
$
这里采用无挠联络及由该式确定的曲率符号约定。联络系数可以因换坐标而改变，曲率是否为零则是几何事实。

标量方程中的曲线坐标散度与Laplace算符可统一写成
$
  nabla_i v^i=1/sqrt(abs(det g))partial_i(sqrt(abs(det g))v^i) \
  nabla_i nabla^i f=1/sqrt(abs(det g))partial_i
  (sqrt(abs(det g))g^(i j)partial_j f)
$
极坐标代入后一式即得$partial_r^2 f+(1/r)partial_r f+(1/r^2)partial_theta^2 f$。这些因子来自几何结构，而不需要为每种坐标重新记一套独立规则。

== 变换群、相对论与Lorentz协变性

=== 张量是变换群的一类表示

如果一组变换$G$作用于线性空间$W$，并且每个变换由线性算符$D(g)$表示，满足
$
  D(g_1 g_2)=D(g_1)D(g_2)
$
就称$D$是$G$的一个表示。空间矢量给出旋转的三维表示；对偶向量给出对偶表示；张量积给出更大的表示。赝量相对于普通量多出的定向符号本身也是一个一维表示。

只考虑$"SO"(3)$时，极矢量和轴矢量按相同规则变换，标量和赝标量也无法区分。必须把反射纳入$"O"(3)$，它们的差别才出现。因此谈“标量”时，总要问清是对哪个变换群而言。

笛卡尔张量的阶数也不直接等于量子角动量。三维二阶张量在旋转下可分成
$
  T_(i j)=1/3 delta_(i j)T_(k k)
  +1/2(T_(i j)-T_(j i))
  +[1/2(T_(i j)+T_(j i))-1/3 delta_(i j)T_(k k)]
$
三项分别为迹、反对称部分、对称无迹部分，独立分量数是$1+3+5=9$，对应角动量表示$j=0,1,2$。量子力学中的“秩$k$球张量算符”指按角动量$k$的不可约表示变换的$2k+1$个算符；它与“有$k$个笛卡尔指标”不完全是同一个用法。

=== Minkowski度量与Lorentz群

取$x^mu=(c t,x,y,z)$，度量为$g="diag"(1,-1,-1,-1)$。保持时空间隔的线性变换满足
$
  x'^mu=Lambda^mu_(" "nu)x^nu, quad Lambda^T g Lambda=g
$
这些变换组成Lorentz群$"O"(1,3)$。四矢量与四协向量的规则为
$
  V'^mu=Lambda^mu_(" "nu)V^nu, quad
  A'_mu=(Lambda^(-1))^nu_(" "mu)A_nu
$
取行列式得$det Lambda=plus.minus 1$；保持定向与保持时间方向是两个独立条件。与恒等变换连续相连的分支为*正常正时Lorentz群*$"SO"^+(1,3)$，其中$det Lambda=+1$且$Lambda^0_(" "0)>=1$。通常的旋转和连续boost属于该分支。

空间反演$P="diag"(1,-1,-1,-1)$保持时间方向而翻转空间定向。时间反演还涉及时间方向的改变；在量子力学中其实现通常是反幺正的，不能只把后面的宇称公式中$det Lambda$换一个符号就照搬。

降指标意味着
$
  p^mu=(E/c,vb(p)), quad p_mu=(E/c,-vb(p)), quad
  p_mu p^mu=E^2/c^2-vb(p)^2=m^2 c^2
$
由于度量不正定，空间分量降指标时出现负号。四维中的$g_(mu nu)$与三维欧氏内积的$delta_(i j)$用途不同；不能把时空空间指标的升降与三维欧氏箭头的分量符号混为一谈。

沿$x$方向、相对速度为$v$的惯性系变换可写为
$
  Lambda=mat(
    gamma, -gamma beta, 0, 0;
    -gamma beta, gamma, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1
  ),
  quad beta=v/c
$
这里$x'^0=gamma(x^0-beta x^1)$、$x'^1=gamma(x^1-beta x^0)$。四动量也使用同一矩阵，所以$E'=gamma(E-v p_x)$、$p'_x=gamma(p_x-v E/c^2)$。不变量是$p_mu p^mu$，不是每一个分量。

=== “协变”与“不变”分别要求什么

标量不变性要求一个量在变换前后取相同数值，例如$p_mu p^mu$。方程协变性则要求两侧按相容规则变换，因而仍表达同一关系；并不要求每个分量数值都不变。

对常数Lorentz矩阵，
$
  partial'_mu=(Lambda^(-1))^alpha_(" "mu)partial_alpha
$
考虑四矢量方程$partial_mu F^(mu nu)=mu_0 j^nu$，其中$F$为$(2,0)$型张量。变换后
$
  partial'_mu F'^(mu nu) & =(Lambda^(-1))^alpha_(" "mu)
                           Lambda^mu_(" "rho)Lambda^nu_(" "sigma)partial_alpha F^(rho sigma) \
                         & =Lambda^nu_(" "sigma)partial_rho F^(rho sigma) \
                         & =mu_0 Lambda^nu_(" "sigma)j^sigma=mu_0 j'^nu
$
一上一下的变换因子缩并消去，留下与右侧相同的自由指标$nu$。这就是方程保持Lorentz协变性的具体机制。写成全上指标的方程也能协变；“协变”不意味着必须全部使用下指标。

标量波动算符同样满足
$
  square=g^(mu nu)partial_mu partial_nu
  =1/c^2 pdv(, t, 2)-nabla^2
$
所以$(square+m^2)phi=0$在自然单位制中是Lorentz协变方程。这里$phi'(x')=phi(x)$，既变换分量也变换自变量。

=== 形式协变与物理对称性

“把公式写成张量形式”保证其坐标描述相容，但并不能独自证明物理体系具有某种主动对称性。例如介质存在一个四速度$u^mu$，方程中保留它就可以写得Lorentz协变；一个具体介质状态仍选出了自身静止系。

若在固定物理背景下主动变换全部动力学场，而作用量及边界条件保持不变，才得到相应的物理对称性。若外加场、介质速度或边界也必须一起改变，变换往往联系的是不同背景下的体系。因而“坐标无关”“方程协变”“某个解不变”应分别判断。

== 电动力学中的矢量与张量

=== 为什么磁场强度H和磁感应强度B是轴矢量

在通常的三维电磁学约定中，$vb(E)$、$vb(D)$、电流密度$vb(j)$和电极化强度$vb(P)$是极矢量；$vb(B)$、$vb(H)$和磁化强度$vb(M)$是轴矢量。这里的$vb(P)$是极化强度，不是宇称变换矩阵。

对局域稳恒电流分布，磁矩为
$
  vb(mu)=1/2 integral vb(r) times vb(j)(vb(r)) dif^3 r
$
位置和电流密度都是极矢量，故磁矩是轴矢量。磁化强度是单位体积的磁矩，也按轴矢量变换。宏观定义
$
  vb(D)=epsilon_0 vb(E)+vb(P), quad
  vb(H)=vb(B)/mu_0-vb(M)
$
表明$vb(H)$与$vb(B)$具有相同的空间变换类型。这个结论不依赖把所有材料都近似为$vb(B)=mu vb(H)$；各向异性、磁电耦合介质的本构关系更复杂。

Lorentz力提供直接检查：
$
  vb(F)=q(vb(E)+vb(v) times vb(B))
$
宇称下$vb(v)$变号、$vb(B)$不变，使磁力变号，与力的极矢量类型一致。Poynting矢量$vb(S)=vb(E) times vb(H)$是极矢量；$vb(E) dot vb(B)$则为赝标量。

更一般地，两个极矢量的点积是标量，两个轴矢量的点积也是标量，极矢量与轴矢量的点积是赝标量。结果只有一个分量，并不意味着它必然是普通标量。

=== 本构关系为什么需要二阶及更高阶张量

线性各向异性介质中，可以写
$
  D^i=epsilon^i_(" "j)E^j, quad
  B^i=mu^i_(" "j)H^j, quad
  j^i=sigma^i_(" "j)E^j
$
介电、磁导和电导张量描述一个输入方向对各输出方向的响应。在正交坐标旋转中，$epsilon'=R epsilon R^T$；其本征方向对应介质的主轴。具有磁电耦合时，极矢量与轴矢量之间的响应系数还带赝张量类型，不能一律看作普通标量常数。

电磁应力也是二阶张量。真空中三维Maxwell应力张量为
$
  sigma_(i j)=epsilon_0(E_i E_j-1/2 delta_(i j)vb(E)^2)
  +1/mu_0(B_i B_j-1/2 delta_(i j)vb(B)^2)
$
曲面单位法向为$n^j$时，单位面积上的牵引力为$t_i=sigma_(i j)n^j$。两个轴矢量的张量积带两个定向符号，它们相乘抵消，所以磁场项仍是普通二阶张量。张量在这里具体表达“不同取向的面上受到什么方向的力”。

=== 四维电磁场是一个反对称张量

取四势$A^mu=(phi/c,vb(A))$，定义
$
  F_(mu nu)=partial_mu A_nu-partial_nu A_mu
$
由$vb(E)=-nabla phi-pdv(vb(A), t)$和$vb(B)=nabla times vb(A)$，得到
$
  F^(0 i)=-E_i/c, quad F^(i j)=-ϵ^(i j k)B_k
$
矩阵明确写为
$
  (F^(mu nu))=mat(
    0, -E_x/c, -E_y/c, -E_z/c;
    E_x/c, 0, -B_z, B_y;
    E_y/c, B_z, 0, -B_x;
    E_z/c, -B_y, B_x, 0
  )
$
它有$binom(4, 2)=6$个独立分量。电场和磁场依赖所选时间方向；不同惯性观察者把同一个$F$分解成不同的$vb(E)$和$vb(B)$。所以三维$vb(B)$不是某个普通轴四矢量的三个空间分量。

由$F'=Lambda F Lambda^T$，沿前节约定的$x$方向boost得到
$
               E'_x=E_x, quad & B'_x=B_x \
  E'_y=gamma(E_y-v B_z), quad & B'_y=gamma(B_y+v E_z/c^2) \
  E'_z=gamma(E_z+v B_y), quad & B'_z=gamma(B_z-v E_y/c^2)
$
空间反演则直接给出$F'^(0 i)=-F^(0 i)$、$F'^(i j)=F^(i j)$，从而恢复$vb(E)'=-vb(E)$、$vb(B)'=vb(B)$。*四维普通反对称张量的纯空间部分，经三维对偶编码后可以表现为轴矢量。*

=== 对偶电磁张量与两个不变量

本节使用四维约定
$
  epsilon^(0 1 2 3)=+1, quad epsilon_(0 1 2 3)=-1
$
第二式由$(+---)$度量降四个指标得出。若把它解释为固定体积形式的分量，相应定向取$omega=-dd(x^0) ∧ dd(x^1) ∧ dd(x^2) ∧ dd(x^3)$。也可以选相反定向并把上下两式同时反号，但不能同时令上下分量都为$+1$。三维$ϵ^(1 2 3)=+1$单独定义，不作未经说明的四维指标升降。

定义对偶
$
  tilde(F)^(mu nu)=1/2 epsilon^(mu nu rho sigma)F_(rho sigma)
$
在固定Levi-Civita数值约定并比较包含反射的变换时，$tilde(F)$为赝二阶张量：
$
  tilde(F)'^(mu nu)=det(Lambda)
  Lambda^mu_(" "rho)Lambda^nu_(" "sigma)tilde(F)^(rho sigma)
$
在正常正时Lorentz群中$det Lambda=1$，其行为与普通二阶张量相同。固定定向的几何Hodge对偶与这种赝张量语言的区别，正是反射是否同时作用于所选定向。

直接代入分量可得
$
  tilde(F)^(0 i)=-B_i, quad
  tilde(F)^(i j)=ϵ^(i j k)E_k/c \
  F_(mu nu)F^(mu nu)=2(vb(B)^2-vb(E)^2/c^2) \
  F_(mu nu)tilde(F)^(mu nu)=-4/c vb(E) dot vb(B)
$
第一个缩并是普通Lorentz标量，第二个是赝标量。第二个在boost和普通旋转下也不变，只在空间反射下变号。量的“赝”性质必须相对于包含定向翻转的变换群讨论。

=== Maxwell方程、守恒流与微分形式

四电流$j^mu=(c rho,vb(j))$。真空中的Maxwell方程统一为
$
  partial_mu F^(mu nu)=mu_0 j^nu, quad
  partial_mu tilde(F)^(mu nu)=0
$
第一式取$nu=0$给出$nabla dot vb(E)=rho/epsilon_0$，取空间指标给出$nabla times vb(B)-(1/c^2)pdv(vb(E), t)=mu_0 vb(j)$。第二式给出$nabla dot vb(B)=0$和$nabla times vb(E)+pdv(vb(B), t)=0$。

反对称性还自动蕴含电荷守恒：
$
  mu_0 partial_nu j^nu=partial_nu partial_mu F^(mu nu)=0
$
两个偏导的对称性与$F$的反对称性缩并为零，因此$pdv(rho, t)+nabla dot vb(j)=0$。这说明张量结构不只是简写，也把相容条件直接显露出来。

把四势看成一形式$cal(A)=A_mu dd(x^mu)$，场强看成二形式
$
  cal(F)=1/2 F_(mu nu)dd(x^mu) ∧ dd(x^nu)=dd(cal(A))
$
则齐次Maxwell方程就是$dd(cal(F))=0$。规范变换$cal(A) -> cal(A)+dd(chi)$不改变$cal(F)$，原因仍为$dif^2=0$。在无源真空中，另一组方程可写为$dd(star cal(F))=0$；有源时右侧是与电荷流对应的三形式。

这套语言自然解释了为什么电场沿路径积分、磁场穿过曲面积分：积分对象的次数与路径、曲面的维数匹配。宏观介质中的激发场及本构关系还需指定材料响应；把所有电磁对象都简单当作同一种三维箭头，会掩盖这些区别。

== 旋量、Clifford代数与手征性

=== 旋量是哪个空间中的向量

考虑自旋$1/2$的归一化二分量态
$
  chi=mat(a;b), quad abs(a)^2+abs(b)^2=1
$
它就是*Pauli旋量*。$a,b$是两个自旋基态的复概率振幅，不是物理空间中两个方向的坐标。

在线性代数意义上，旋量当然也是向量，因为它属于复线性空间，可以相加、乘复数。但物理学中把它与“矢量”区分时，后者通常特指位置、动量、四速度这类物理空间或时空的向量。*旋量是旋量空间中的向量，按旋量表示变换。*

三维空间中的Pauli旋量属于$CC^2$，四维Dirac旋量属于$CC^4$；这两个复空间并不是物理空间$RR^3$或Minkowski时空。同一次空间旋转，分别作用为
$
  s'=s, quad v'^i=R^i_(" "j)v^j, quad
  T'^(i j)=R^i_(" "k)R^j_(" "l)T^(k l), quad chi'=U chi
$
$R$是$3 times 3$实旋转矩阵，$U$是$2 times 2$复旋量矩阵。分量的数量、实数还是复数，都不能单独决定一个对象的几何类型；变换规则才决定它们分别表示什么。

=== 从角动量生成元推导半角

角动量是旋转的生成元。取$vb(S)=vb(sigma)/2$，绕单位轴$vb(n)$主动旋转$theta$的算符为
$
  U(vb(n),theta)=exp(-i theta vb(n) dot vb(S))
    =exp(-i theta vb(n) dot vb(sigma)/2)
$
由Pauli恒等式$sigma_i sigma_j=delta_(i j)I+i ϵ_(i j k)sigma_k$，可得$(vb(n) dot vb(sigma))^2=I$。将指数级数的奇偶项分开，得到
$
  U(vb(n),theta)=I cos(theta/2)-i(vb(n) dot vb(sigma))sin(theta/2)
$
因此绕$z$轴时，
$
  U_z(theta)=mat(e^(-i theta/2),0;0,e^(i theta/2)), quad
  mat(a;b) -> mat(e^(-i theta/2)a;e^(i theta/2)b)
$
特别地
$
  U(vb(n),2pi)=-I_2, quad U(vb(n),4pi)=I_2
$
普通空间矢量转$2pi$后由$R(2pi)=I_3$保持原分量，旋量却变号。任何由普通空间向量及其对偶作有限次张量积构成的张量，在这次旋转下也都恢复；赝张量同样如此，因为这里$det R=+1$。所以增加普通空间指标的数目，不能得到单个旋量的变换规律。

半角不是说“自旋箭头只转了半圈”。它首先描述态振幅怎样变换；可观测的自旋平均方向是旋量的二次组合，下面会看到它旋转的是完整角度$theta$。

=== SU(2)为何是SO(3)的双覆盖

给一个三维实矢量$vb(v)$，用Pauli矩阵把它编码成无迹Hermitian矩阵
$
  X(vb(v))=vb(v) dot vb(sigma)
   =mat(v_z,v_x-i v_y;v_x+i v_y,-v_z), quad
  X(vb(v))^2=abs(vb(v))^2 I_2
$
取$U^dagger U=I_2$、$det U=1$，这样的矩阵组成$"SU"(2)$。变换$X'=U X U^dagger$保持无迹、Hermitian和$X^2$，所以对应一个保持长度的实矢量变换。由于$"SU"(2)$与恒等元连通，这个变换保持定向，属于$"SO"(3)$。

具体地，
$
  U(vb(v) dot vb(sigma))U^dagger=(R vb(v)) dot vb(sigma), quad
  R_(i j)=1/2 "tr"(sigma_i U sigma_j U^dagger)
$
代入上一节的$U$并使用Pauli乘法关系，可得Rodrigues公式
$
  R vb(v)=vb(v)cos theta+(vb(n) times vb(v))sin theta
    +vb(n)(vb(n) dot vb(v))(1-cos theta)
$
这确实是绕$vb(n)$旋转完整角度$theta$的三维旋转。任意三维旋转都能写为某个轴和角度，因此都可以找到对应的$U$。

但是$U$与$-U$给出相同的$U X U^dagger$。反过来，若$U$对所有$X(vb(v))$都没有作用，它必与所有Pauli矩阵对易，从而为标量矩阵；结合$det U=1$，只能是$plus.minus I_2$。因此
$
  "SU"(2)/{plus.minus I_2} ≅ "SO"(3)
$
即$"SU"(2)$到$"SO"(3)$是*二对一的双覆盖*。普通矢量只接受投影后的$R$作用，旋量接受$U$作用，能区分这两个提升。

也可写$U=a_0 I-i vb(a) dot vb(sigma)$，其中$a_0,vb(a)$为实数且$a_0^2+abs(vb(a))^2=1$。所以$"SU"(2)$作为空间是三维球面$S^3$，相反点$U,-U$对应同一空间旋转。这说明“双覆盖”具有群与全局拓扑意义，并非人为在指数中放入一个$1/2$。

=== 自旋态、Bloch球与自旋平均值

对归一化$chi=(a,b)^T$，定义
$
  n_i=chi^dagger sigma_i chi, quad
  vb(n)=mat(2"Re"(a^*b);2"Im"(a^*b);abs(a)^2-abs(b)^2)
$
直接计算得
$
  abs(vb(n))^2=4abs(a)^2 abs(b)^2+(abs(a)^2-abs(b)^2)^2=1
$
所以$vb(n)$位于单位球面上，且$⟨vb(S)⟩=vb(n)/2$。去掉整体相位的归一化二分量纯态，可用Bloch球面上的一点表示：
$
  chi=e^(i alpha)mat(cos(theta/2);e^(i phi)sin(theta/2)), quad
  vb(n)=(sin theta cos phi,sin theta sin phi,cos theta)
$
自旋态是旋量，$vb(S)$是矢量算符，自旋平均值$⟨vb(S)⟩$是三维轴矢量，三者不是同一个对象。在旋转下，$chi'=U chi$导致$vb(n)'=R vb(n)$；单凭旋转律只能判定其三维矢量行为，轴矢量性质还需结合宇称。

#example(subname: [半角振幅如何给出完整角度])[
  从$chi_0=(1,0)^T$出发，绕$y$轴旋转$theta$，有
  $
    chi(theta)=e^(-i theta sigma_y/2)chi_0
      =mat(cos(theta/2);sin(theta/2))
  $
  因而
  $
    vb(n)(theta) &=(2cos(theta/2)sin(theta/2),0,
        cos^2(theta/2)-sin^2(theta/2)) \
      &=(sin theta,0,cos theta)
  $
  自旋平均方向转过$theta$，而非$theta/2$。这来自旋量的二次组合；“旋量像矢量的平方根”只能作为这种关系的比喻，不能理解成逐分量开平方。
]
#newpara()

密度算符也把这一点写得很清楚：
$
  rho=chi chi^dagger=1/2(I+vb(n) dot vb(sigma))
$
它在$chi -> e^(i alpha)chi$下不变。因此$chi$与$-chi$作为一个独立纯态给出相同的自旋方向和测量概率。对混合态仍有$rho=(I+vb(n) dot vb(sigma))/2$，但$abs(vb(n))<=1$，不再必须落在球面上。

如果干涉仪只对一条路径施加$2pi$的自旋旋转，
$
  (ket(A)+ket(B))/sqrt(2) ⊗ chi
    -> (-ket(A)+ket(B))/sqrt(2) ⊗ chi
$
产生的是两条路径的相对负号，可以改变干涉。故“旋量转两圈才恢复”指旋量及提升后的旋转算符的数学行为；不能据此声称所有可观测量都要转两圈才恢复。

=== 从SU(2)到SL(2,C)：四矢量与Weyl旋量

四维中，把一个实四矢量编码成Hermitian矩阵
$
  X=x^0 I+vb(x) dot vb(sigma)
   =mat(x^0+x^3,x^1-i x^2;x^1+i x^2,x^0-x^3)
$
它的行列式正好是Minkowski范数：
$
  det X=(x^0)^2-abs(vb(x))^2=g_(mu nu)x^mu x^nu
$
现在取$M in "SL"(2,CC)$，即任意行列式为1的复$2 times 2$矩阵，令$X'=M X M^dagger$。该变换保持Hermitian性质和行列式，因而诱导Lorentz变换。它保持未来指向的正定Hermitian矩阵，并覆盖正常正时Lorentz群；$M,-M$再次对应同一四矢量变换：
$
  "SL"(2,CC)/{plus.minus I_2} ≅ "SO"^+(1,3)
$
若$M=U$幺正，就退回空间旋转。若
$
  M=exp(-eta vb(n) dot vb(sigma)/2), quad beta=tanh eta
$
则得到沿$vb(n)$方向、与前节约定一致的boost。这个$M$通常不幺正，因而不再保持$X$的迹，也就可以混合时间与空间分量。

存在两种不等价的二分量复旋量表示：一种按$xi'=M xi$变换，另一种可写为$zeta'=(M^dagger)^(-1)zeta$。纯旋转时$(U^dagger)^(-1)=U$，两者完全相同；boost时则不同。这正是只学习非相对论自旋时，看不出两种Weyl旋量区别的原因。

在与本文$gamma^5$约定相容的手性基底中，可写
$
  psi=mat(psi_L;psi_R), quad
  S(M)=mat((M^dagger)^(-1),0;0,M)
$
其中每块为$2 times 2$。表示的通常标签为
$
  "Dirac":(1/2,0) ⊕ (0,1/2), quad
  "四矢量":(1/2,1/2)
$
两者都有四个复化后的分量，但表示不同。对空间旋转，四矢量按$"diag"(1,R)$变换，Dirac旋量按$"diag"(U,U)$变换；转$2pi$时，前者为$+I_4$，后者为$-I_4$，任何换基都不能把它们变成相同表示。Dirac的四个分量应在手性基底中理解为两组Weyl分量；它们不能在任意表象中被逐项标成“两个粒子分量、两个反粒子分量”。

这里有限分量的boost矩阵不幺正，并不违反量子理论对物理态变换的幺正性。场的有限维分量表示与完整单粒子Hilbert空间上的Lorentz变换是不同对象；概率及内积还需结合动量、归一化与空间超曲面上的积分，不能只把$psi^dagger psi$当作Lorentz标量。

=== 旋量指标也有对偶，但不是时空指标

本节用$alpha,beta=1,2$标记二分量旋量。设$xi^alpha$按$M$变换。行列式为1的二阶矩阵保留反对称形式
$
  E=mat(0,1;-1,0), quad M^T E M=E
$
因此可以定义
$
  xi_alpha=E_(alpha beta)xi^beta, quad
  xi^alpha=E^(alpha beta)xi_beta, quad
  (E^(alpha beta))=E^(-1)=-E
$
这里特意把上下两组分量写清：$xi_1=xi^2$、$xi_2=-xi^1$，而升指标使用逆矩阵，不能把两组$E$都取成同一个数值数组。

对两个都按$M$变换的旋量$xi$和$chi$，标量配对为
$
  E_(alpha beta)xi^alpha chi^beta=xi^1 chi^2-xi^2 chi^1
$
它在$M$同时作用于两个旋量时不变。旋量指标的升降依赖这个反对称形式，与时空指标使用对称Minkowski度量$g_(mu nu)$升降不同；它也不等于Hermitian共轭$xi^dagger$。

二分量记号中常用带点指标标记复共轭表示，它与原表示在一般Lorentz boost下不等价；只在空间旋转子群上可以借助不变结构联系。一个时空四矢量也可编码为带一对不同旋量指标的$X$矩阵，说明*旋量的双线性组合能够构成张量*。例如在旋转群下，两个自旋$1/2$表示的张量积分解为$2 ⊗ 2=3 ⊕ 1$。但从普通空间张量的线性子表示中，不能反向得到单个自旋$1/2$旋量。

到这里，“有上下指标”仍然只说明存在向量与对偶的关系。辨认一个指标时，首先要问它属于空间、时空、旋量还是内部对称空间，不能只看它写在字母的上方或下方。

四维Dirac旋量也可记为$psi_a$，$a=1,dots,4$；对$x'=Lambda x$有$psi'(x')=S(Lambda)psi(x)$。下面的$gamma$矩阵把这个旋量变换与时空变换具体联系起来。

=== gamma矩阵把矢量结构与旋量结构联系起来

Clifford代数定义为
$
  gamma^mu gamma^nu+gamma^nu gamma^mu=2g^(mu nu)I
$
抽象地，它由时空向量生成，要求$Gamma(v)Gamma(w)+Gamma(w)Gamma(v)=2g(v,w)I$。选取这些生成元在复线性空间$S$上的矩阵表示，就得到承载Dirac旋量的空间；旋量是$S$中的元素，$gamma$矩阵则是作用在$S$上的算符，二者不能混同。

偶数个Clifford向量的适当乘积可实现保持定向的正交变换，形成相应的*Spin群*。在这里，$"Spin"(3)≅"SU"(2)$，而$"Spin"^+(1,3)≅"SL"(2,CC)$；前面遇到的两个双覆盖正是它们的低维具体形式。旋量接受覆盖群的表示，普通张量则通过投影后的正交或Lorentz群变换。这也把“半角”和“Clifford代数”放进了同一条数学脉络。

同时选取通常的Hermitian共轭约定
$
  (gamma^0)^dagger=gamma^0, quad (gamma^i)^dagger=-gamma^i
$
它等价于$(gamma^mu)^dagger=gamma^0 gamma^mu gamma^0$，也是后面Dirac共轭公式的前提；仅有Clifford反对易关系并不能确定这些共轭性质。
这里每个$gamma^mu$还有被省略的两个旋量矩阵指标。它们满足
$
  S^(-1)gamma^mu S=Lambda^mu_(" "nu)gamma^nu
$
这使$i gamma^mu partial_mu psi$与$psi$按相同的旋量规则变换，从而保证Dirac方程$(i gamma^mu partial_mu-m)psi=0$协变。$gamma^mu$的上指标不是说“四个矩阵条目就是一个普通四矢量”；它描述的是矢量表示与旋量表示之间的相容关系。

定义
$
  sigma^(mu nu)=i/2[gamma^mu,gamma^nu], quad
  gamma^5=i gamma^0 gamma^1 gamma^2 gamma^3
$
由Clifford关系及上述共轭约定，可以直接得到
$
  (gamma^5)^2=I, quad (gamma^5)^dagger=gamma^5, quad
  gamma^5 gamma^mu=-gamma^mu gamma^5
$
$gamma^5$是四个独立方向的最高阶乘积，并不是“第五个时空方向”。在本附录的定向约定下，
$
  gamma^5=-i/(4!)epsilon_(mu nu rho sigma)
  gamma^mu gamma^nu gamma^rho gamma^sigma
$
它与体积形式、Levi-Civita张量一样涉及定向，但它是作用在旋量空间上的矩阵。

例如前面使用的手性基底可具体取
$
  gamma^0=mat(0,I_2;I_2,0), quad
  gamma^i=mat(0,sigma_i;-sigma_i,0), quad
  gamma^5=mat(-I_2,0;0,I_2)
$
每个条目代表一个$2 times 2$块。由此可直接验证前面的$S(M)$满足$S^(-1)gamma^mu S=Lambda^mu_(" "nu)gamma^nu$，并看清上、下两个Weyl子空间为何具有相反的$gamma^5$本征值。更换$gamma$矩阵表象只是在旋量空间换基，不改变这种表示结构。

=== 左、右手Weyl旋量

因为$(gamma^5)^2=I$，可以定义投影算符
$
  P_L=(I-gamma^5)/2, quad P_R=(I+gamma^5)/2
$
它们满足
$
  P_L^2=P_L, quad P_R^2=P_R, quad
  P_L P_R=0, quad P_L+P_R=I
$
因此$psi=psi_L+psi_R$，其中$psi_L=P_L psi$、$psi_R=P_R psi$分别具有$gamma^5$本征值$-1,+1$。在$3+1$维，每个子空间有两个复分量，称为左、右手Weyl旋量。

Lorentz旋量生成元由两个$gamma$的反对称乘积构成。$gamma^5$与每个$gamma^mu$反对易，却与两个$gamma$的乘积对易，因而
$
  [gamma^5,sigma^(mu nu)]=0, quad
  [gamma^5,S(Lambda)]=0
$
第二式适用于与恒等变换相连的Lorentz变换。故$P_L S psi=S P_L psi$：普通旋转和boost各自保持左、右手表示的子空间。

空间反射则不同。忽略整体宇称相位，主动变换为
$
  psi'(t,vb(x))=gamma^0 psi(t, -vb(x))
$
由$gamma^0 gamma^5 gamma^0=-gamma^5$得
$
  P_L gamma^0=gamma^0 P_R, quad
  psi'_L(t,vb(x))=gamma^0 psi_R(t,-vb(x))
$
所以宇称交换左右手。*手征性是Lorentz表示的分类，同时对定向翻转敏感。*

=== 质量、手征性与螺旋度

手征性由$gamma^5$定义；螺旋度是自旋在动量方向的投影。为与正文一致，在$hbar=1$时定义
$
  hat(h)=2vb(S) dot vb(p)/abs(vb(p))
$
自旋$1/2$粒子的本征值为$plus.minus 1$。有些文献把它除以2，使本征值为$plus.minus 1/2$；比较公式时先核对归一化。

自旋是轴矢量、动量是极矢量，所以螺旋度在空间反射下变号。有质量粒子可以被另一惯性观察者“超过”，使动量方向反转而改变螺旋度；这不意味着该boost把左手Lorentz表示变成了右手表示。

将Dirac方程投影到两个子空间，得到
$
  i gamma^mu partial_mu psi_L=m psi_R, quad
  i gamma^mu partial_mu psi_R=m psi_L
$
无质量时两种手征性各自独立传播；质量项把两者耦合。因而有质量Dirac粒子的定能解一般不是纯手征态。在无质量正能粒子旋量解上，才有$gamma^5 u=hat(h)u$的简单对应。反粒子还要区分场分量与它创建的物理态：左手Weyl场可描述负螺旋度粒子及正螺旋度反粒子。

=== 三种“手性”及其维数条件

*几何手性*是构型与其镜像能否通过允许的平移、保持定向旋转重合的性质。它不局限于三维。例如有固定标签的三个三维方向，可用
$
  chi=vb(a) dot (vb(b) times vb(c))
$
记录其定向；$chi$在旋转下不变，在镜像下变号。它可作为这类标记构型的手性指标，却不是任意复杂物体的完整手性判据。二维中也可讨论手性，但须限制只能在平面内运动；允许拿到三维翻面会改变问题。

*旋量手征性*则由Clifford代数决定。设总时空维数为$D$，定义最高阶乘积
$
  Gamma_*=c_D Gamma^0 Gamma^1 dots Gamma^(D-1)
$
相位$c_D$选到$Gamma_*^2=I$。把一个$Gamma^mu$穿过其余$D-1$个不同方向的矩阵，得到
$
  Gamma_* Gamma^mu=(-1)^(D-1)Gamma^mu Gamma_*
$
所以偶数$D$时，它与每个$Gamma^mu$反对易，又与Lorentz生成元对易，可用$(I plus.minus Gamma_*)/2$作Weyl手征分解。奇数$D$时，该乘积与所有$Gamma^mu$对易，在不可约复Clifford表示中只是单位矩阵的标量倍数，不能用它再分成两个独立的Weyl子空间。

#figure(
  three-line-table[
    | 时空维数 | 总维数$D$ | 通常的Weyl手征分解 |
    | --- | --- | --- |
    | $1+1$ | $2$ | 有 |
    | $2+1$ | $3$ | 不可约表示中无同样分解 |
    | $3+1$ | $4$ | 有，使用$gamma^5$ |
    | $5+1$ | $6$ | 有，使用相应$Gamma_*$ |
  ],
  caption: [手征分解取决于总时空维数的奇偶，而非只数空间维数],
)

奇数维仍可以讨论宇称、不同Clifford表示或加倍的旋量空间；上述结论仅指不可约复表示内通常的Weyl分解。Majorana实条件是另一种结构，还受时空符号与维数模周期的限制，不能只凭“总维数偶数”判断。

*螺旋度*则需要动量方向，是给定粒子态上的自旋投影。几何手性、旋量手征性和螺旋度都与“左右”有关，却分别属于构型几何、群表示和动量态的分类。

三维叉乘的特殊性来自$star:Lambda^2 -> Lambda^1$，偶数维手征性的条件来自最高阶Clifford乘积的反对易性。它们都涉及定向，维数条件的来源却不同。

== 量子场论中的张量与赝张量

=== Dirac双线性为什么回到标量与张量

旋量本身不是普通张量，但两个旋量可以组合出普通的时空变换类型。定义Dirac共轭
$
  overline(psi)=psi^dagger gamma^0
$
对正常正时Lorentz变换，有$S^dagger gamma^0=gamma^0 S^(-1)$，因此
$
  overline(psi)'(x')=overline(psi)(x)S^(-1)
$
例如
$
  overline(psi)'psi'=overline(psi)S^(-1)S psi=overline(psi)psi \
  overline(psi)'gamma^mu psi'
  =Lambda^mu_(" "nu)overline(psi)gamma^nu psi
$
这分别给出标量和四矢量。它们的变换类型由旋量矩阵$S$如何与中间的$gamma$结构组合决定。

#figure(
  three-line-table[
    | 类型 | 双线性组合 | 分量数 |
    | --- | --- | --- |
    | 标量 | $S=overline(psi)psi$ | $1$ |
    | 赝标量 | $P=i overline(psi)gamma^5 psi$ | $1$ |
    | 四矢量 | $V^mu=overline(psi)gamma^mu psi$ | $4$ |
    | 轴四矢量 | $A^mu=overline(psi)gamma^mu gamma^5 psi$ | $4$ |
    | 反对称二阶张量 | $T^(mu nu)=overline(psi)sigma^(mu nu)psi$ | $6$ |
  ],
  caption: [Dirac双线性的五类变换结构],
)

它们总计$1+1+4+4+6=16$个矩阵结构，张成复$4 times 4$矩阵空间。分量数是在计数Clifford矩阵基，不表示一个固定旋量产生的所有双线性数值都可任意独立选择；这些数值之间还存在代数恒等式。

对宇称，$overline(psi)'(t,vb(x))=overline(psi)(t,-vb(x))gamma^0$。因此
$
  i overline(psi)'gamma^5 psi'
  =i overline(psi)gamma^0 gamma^5 gamma^0 psi
  =-i overline(psi)gamma^5 psi
$
这里右侧的场均在反射后的点取值，写式时省略了该共同自变量。$gamma^5$使赝标量多出负号。类似地，四矢量宇称为$(V^0,vb(V)) -> (V^0,-vb(V))$，轴四矢量则为
$
  (A^0,vb(A)) -> (-A^0,vb(A))
$
所以轴四矢量并不是“四个分量在反射下都不变”。它的空间分量表现为三维轴矢量，时间分量表现为三维赝标量。

=== 赝二阶张量与gamma5对偶恒等式

赝张量当然存在，例如
$
  T_5^(mu nu)=overline(psi)sigma^(mu nu)gamma^5 psi
$
它未在上述16个结构之外再增加6个独立结构，因为Clifford代数给出
$
  sigma^(mu nu)gamma^5
  =i/2 epsilon^(mu nu rho sigma)sigma_(rho sigma)
$
本式与本附录的$gamma^5=+i gamma^0 gamma^1 gamma^2 gamma^3$及$epsilon^(0 1 2 3)=+1$配套。例取$mu nu=01$，两侧都等于$-gamma^2 gamma^3$，可以快速检查符号。

这就是$gamma^5$与反对称张量对偶的直接联系：对二阶Clifford结构乘$gamma^5$，等价于用四维Levi-Civita结构取其互补指标。在三维，二形式对偶成一形式，便于写成叉乘；在四维，二形式对偶仍为二形式，表现为上述张量与赝张量的关系。

因此不能把“$gamma^5$就是叉乘”作为定义。它们分属Clifford代数与外代数，但共同使用最高阶乘积及定向；上述恒等式把两种结构具体联系起来。

=== 作用量中的指标配对与宇称

采用有理化自然单位，典型自由场Lagrange密度为
$
  cal(L)_phi=1/2 partial_mu phi partial^mu phi-1/2 m^2 phi^2 \
  cal(L)_psi=overline(psi)(i gamma^mu partial_mu-m)psi \
  cal(L)_"em"=-1/4 F_(mu nu)F^(mu nu)
$
每项的时空指标和旋量指标全部配对，得到Lorentz标量。平直时空的作用量$cal(S)=integral dif^4 x cal(L)$因$abs(det Lambda)=1$而保持不变。在一般曲线坐标中，积分测度应写$sqrt(abs(det g))dif^4 x$。

常见相互作用$q overline(psi)gamma^mu psi A_mu$是四矢量流与四协向量的缩并。轴流则出现在
$
  j_L^mu=overline(psi)gamma^mu P_L psi=1/2(V^mu-A^mu)
$
这样的左手弱流中。宇称把左手流变成右手流，因此只选择左手结构的相互作用一般不具有宇称对称性。*Lorentz协变性并不要求宇称对称性*，因为正常正时Lorentz群不包含空间反射。

同样，$F_(mu nu)tilde(F)^(mu nu)$在正常正时Lorentz群下不变，却在宇称下变号。若$a$是赝标量场，
$
  cal(L)_"int"=g_a a F_(mu nu)tilde(F)^(mu nu)
$
两个赝符号相乘，使该乘积成为宇称偶的普通标量。这类结构说明“标量/赝标量”的分类会直接限制可写出的耦合项。常数系数乘$F tilde(F)$还涉及全导数及边界、拓扑问题；上述分类首先是在判断局域密度的宇称。

=== 能量动量也是张量

实标量场的对称能量动量张量可写为
$
  T^(mu nu)=partial^mu phi partial^nu phi-g^(mu nu)cal(L)_phi
$
在运动方程成立、无外源的条件下满足$partial_mu T^(mu nu)=0$，即
$
  partial_t T^(0 0)+partial_i T^(i 0)=0, quad
  partial_t T^(0 j)+partial_i T^(i j)=0
$
所以在本节的自然单位制中，$T^(0 0)$是能量密度，$T^(i 0)$是能流，$T^(0 j)$是动量密度，$T^(i j)$是动量通量和应力。本例张量对称，能流和动量密度的相应分量数值相同。不同观察者会混合这些分量，正如他们混合电场和磁场。

四矢量电荷流的守恒给出一个标量方程$partial_mu j^mu=0$；能量动量守恒留下自由指标$nu$，给出四个方程。这再次体现了：自由指标记录方程还有多少独立的几何分量，缩并指标记录已完成的自然配对。

== 类型辨认与参考资料

=== 遇到一个新量时怎样判断

首先确定它属于哪个空间，以及讨论的是换坐标、旋转、Lorentz变换还是包含反射的群；再确定输入、输出和指标类型。最后才考虑度量、定向及具体物理意义。

#figure(
  three-line-table[
    | 分类维度 | 需要辨认的内容 | 典型例子 |
    | --- | --- | --- |
    | 张量型与阶数 | 上、下指标数$(r,s)$ | $v^i$、$alpha_i$、$T^i_(" "j)$ |
    | 普通或赝 | 是否额外带定向符号 | $vb(E)$与$vb(B)$、$F^2$与$F tilde(F)$ |
    | 密度权重 | 是否额外带$abs(det J)$的幂 | $sqrt(abs(det g))$ |
    | 代数对称性 | 对称、反对称、无迹等 | 度量、场强、四极矩 |
    | 群的表示 | 矢量、旋量或其他表示 | $Lambda V$与$S psi$ |
    | 物理对称性 | 具体作用量、背景或解是否保持 | 真空、介质、外场中的规律 |
  ],
  caption: [这些分类可以同时存在，不能用其中一种代替另一种],
)

从数学结构看，不需要度量就可以定义向量、对偶、张量积、缩并和楔积；有了度量才可测长、作内积和升降指标；再加定向才可定义带符号的体积形式与Hodge对偶；讨论场的变化还需微分结构，而比较一般张量在不同点的变化需要联络。这样逐层添加结构，便能看清每条公式用了哪些前提。

电磁学中首次遇到的$vb(H)$，沿着“电流形成磁矩—磁矩关联有向平面—三维对偶编码成轴矢量”这条线理解；相对论用普通二形式$F$统一电与磁；量子场论再通过旋量双线性及$gamma^5$把定向、对偶和表示结构联系起来。上下指标不是赝量的标志，方程协变也不要求每个量保持不变。

=== 进一步阅读与约定

以下资料可用于核对定义和继续学习；本附录的推导统一采用开头声明的约定，比较不同教材时应先核对度规、定向和$gamma^5$的整体符号。

三维叉乘、四维电磁对偶和$gamma^5$恒等式对符号约定尤其敏感。本文固定$ϵ^(1 2 3)=+1$、$epsilon^(0 1 2 3)=+1$、$epsilon_(0 1 2 3)=-1$和$gamma^5=+i gamma^0 gamma^1 gamma^2 gamma^3$；若改变其中一项，应重新核对所有相关对偶公式。

+ David Tong, #link("https://www.damtp.cam.ac.uk/user/tong/gr/grhtml/S2.html")[General Relativity, §2: Introducing Differential Geometry]。对偶、张量、微分形式与外导数的系统入口。
+ David Tong, #link("https://www.damtp.cam.ac.uk/user/tong/gr/grhtml/S3.html")[General Relativity, §3: Introducing Riemannian Geometry]。度量、体积形式、Hodge对偶及联络。该讲义时空度规采用$(-+++)$，与本文不同。
+ David Tong, #link("https://davidtong.org/pdfs/teaching/electromagnetism/electro4.pdf")[Electromagnetism and Relativity]。电磁张量、boost下的电磁场、协变Maxwell方程与不变量。
+ David Tong, #link("https://www.damtp.cam.ac.uk/user/tong/relativity/dynrel.pdf")[Dynamics and Relativity, §7.6: Spinors]。通过Hermitian矩阵构造旋转与Lorentz双覆盖，并讨论旋量到空间方向的映射。比较旋转指数时须区分主动、被动约定。
+ H. K. Dreiner, H. E. Haber and S. P. Martin, #link("https://arxiv.org/pdf/0812.1594")[Two-component spinor techniques and Feynman rules for quantum field theory and supersymmetry, §2]。二分量旋量、点与不点指标、Weyl和Dirac表示。该文的反对称指标数组取$epsilon^(1 2)=+1$、$epsilon_(1 2)=-1$，与本文$E$的整体符号相反；升降指标须成套采用。
+ David Tong, #link("https://www.damtp.cam.ac.uk/user/tong/qft/qfthtml/S4.html")[Quantum Field Theory, §4: The Dirac Equation]。旋量、双线性和宇称。该讲义取$gamma^5=-i gamma^0 gamma^1 gamma^2 gamma^3$，左右投影标签与本文需一起调整。
+ David B. Kaplan, #link("https://arxiv.org/abs/0912.2560")[Chiral Symmetry and Lattice Fermions]。特别参见偶数维Clifford代数、手征表示与奇数维宇称的讨论。

