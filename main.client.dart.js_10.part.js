((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,E,B={
n9(d){var x,w,v=d.CW
if(v==null)x=null
else{v=v.d$
v.toString
x=v}while(x instanceof A.V){w=x.gv()
v=w instanceof $.iA()
if(v)return w
x=x.a}return null},
na(d,e){var x,w
if(e!=null){x=A.c(A.c(b.G.document).createRange())
x.selectNodeContents(e)
return A.e_(A.c(A.c(x.createContextualFragment(d)).childNodes))}w=A.c(A.c(b.G.document).createElement("template"))
w.innerHTML=d
return A.e_(A.c(A.c(w.content).childNodes))},
e4:function e4(d,e){this.c=d
this.a=e},
d2:function d2(d,e){this.b=d
this.a=e},
eL:function eL(d,e,f,g,h,i){var _=this
_.d$=d
_.e$=e
_.f$=f
_.c=_.b=_.a=null
_.d=g
_.e=null
_.f=h
_.w=_.r=null
_.x=i
_.Q=_.z=_.y=null
_.as=!1
_.at=!0
_.ax=!1
_.CW=null
_.cx=!1},
eB:function eB(d){var _=this
_.d=d
_.c=_.b=_.a=null},
dP:function dP(){},
cJ:function cJ(d,e){this.a=d
this.$ti=e},
lX(){return new B.bj(null)},
bj:function bj(d){this.a=d},
fS:function fS(){},
fT:function fT(d){this.a=d}},C,D,F,G,H
J=c[1]
A=c[0]
E=c[2]
B=a.updateHolder(c[5],B)
C=c[17]
D=c[11]
F=c[13]
G=c[14]
H=c[9]
B.e4.prototype={
B(d){var x,w,v,u,t=A.d([],y.p)
for(x=B.na(this.c,B.n9(d)),w=x.$ti,x=new A.aM(x.a(),w.h("aM<1>")),v=y.g,w=w.c;x.k();){u=x.b
if(u==null)u=w.a(u)
t.push(new B.d2(u,new B.cJ(u,v)))}return new D.bb(t,null)}}
B.d2.prototype={
M(){var x=($.G+1)%16777215
$.G=x
return new B.eL(null,!1,!1,x,this,E.d)}}
B.eL.prototype={
gm(){return y.k.a(A.f.prototype.gm.call(this))},
N(d){this.cq(y.k.a(d))},
S(){var x,w=this.CW.d$
w.toString
x=new B.eB(y.k.a(A.f.prototype.gm.call(this)).b)
x.a=w
return x},
O(d){}}
B.eB.prototype={
T(d,e){throw A.e(A.ai("Raw nodes cannot have children attached to them."))},
u(d,e){throw A.e(A.ai("Text nodes cannot have children removed from them."))},
a_(){},
aT(d){y.b.a(d)
return null},
gv(){return this.d}}
B.dP.prototype={}
B.cJ.prototype={
G(d,e){if(e==null)return!1
return J.iC(e)===A.aw(this)&&this.$ti.b(e)&&e.a===this.a},
gC(d){return A.jB([A.aw(this),this.a])},
i(d){var x=this.$ti,w=x.c,v=this.a,u=A.ad(w)===C.as?"<'"+A.n(v)+"'>":"<"+A.n(v)+">"
if(A.aw(this)===A.ad(x))return"["+u+"]"
return"["+A.ad(w).i(0)+" "+u+"]"}}
B.bj.prototype={
B(d){var x=null,w=y.p,v=A.d([],w)
v.push(F.j6(A.d([new B.e4('<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="4" x2="20" y1="12" y2="12"></line><line x1="4" x2="20" y1="6" y2="6"></line><line x1="4" x2="20" y1="18" y2="18"></line></svg>\n',x)],w),x,"sidebar-toggle-button",x,new B.fS(),x))
return new D.bb(v,x)}}
var z=a.updateTypes([])
B.fS.prototype={
$0(){var x,w,v,u,t,s,r={}
r.a=r.b=null
x=new B.fT(r)
w=b.G
v=A.q(A.c(A.c(w.window).document).querySelector(".sidebar-close"))
if(v==null)u=null
else{t=y.f
u=A.cT(v,"click",t.h("~(1)?").a(x),!1,t.c)}r.b=u
v=A.q(A.c(A.c(w.window).document).querySelector(".sidebar-barrier"))
if(v==null)s=null
else{t=y.f
s=A.cT(v,"click",t.h("~(1)?").a(x),!1,t.c)}r.a=s
r=A.q(A.c(A.c(w.window).document).querySelector(".sidebar-container"))
if(r!=null)A.c(r.classList).add("open")},
$S:0}
B.fT.prototype={
$1(d){var x=this.a,w=x.b
if(w!=null)w.X()
x=x.a
if(x!=null)x.X()
x=A.q(A.c(A.c(b.G.window).document).querySelector(".sidebar-container"))
if(x!=null)A.c(x.classList).remove("open")},
$S:42};(function inheritance(){var x=a.inheritMany,w=a.inherit
x(G.C,[B.e4,B.bj])
w(B.d2,A.i)
w(B.eL,A.bf)
w(B.eB,A.V)
w(B.dP,H.am)
w(B.cJ,B.dP)
w(B.fS,A.ay)
w(B.fT,A.ae)})()
A.aN(b.typeUniverse,JSON.parse('{"e4":{"C":[],"i":[]},"d2":{"i":[]},"eL":{"Q":[],"f":[],"I":[]},"eB":{"V":[],"b0":[]},"dP":{"am":[]},"cJ":{"am":[]},"bj":{"C":[],"i":[]}}'))
var y={p:A.r("t<i>"),g:A.r("cJ<k>"),f:A.r("cQ<k>"),k:A.r("d2"),b:A.r("ak(k)")};(function constants(){C.as=A.Y("a")})()};
(a=>{a["9Jo3K1c6BkEaCMlYpJaTI0XCIkM="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.client.dart.js_10.part.js.map
