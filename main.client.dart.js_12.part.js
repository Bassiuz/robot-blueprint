((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,H,A={
aT(d){var x=$.jl.n(0,d)
if(x==null){x=new A.dn(d,B.d([],y.C))
$.jl.j(0,d,x)}return x},
dp:function dp(d,e){this.a=d
this.b=e},
c4:function c4(d,e){this.c=d
this.a=e},
er:function er(d,e,f,g,h,i,j){var _=this
_.d$=d
_.e$=e
_.f$=f
_.cy=null
_.db=g
_.c=_.b=_.a=null
_.d=h
_.e=null
_.f=i
_.w=_.r=null
_.x=j
_.Q=_.z=_.y=null
_.as=!1
_.at=!0
_.ax=!1
_.CW=null
_.cx=!1},
at:function at(d,e,f){var _=this
_.w=d
_.x=e
_.y=null
_.z=f
_.d=$
_.c=_.b=_.a=null},
dn:function dn(d,e){var _=this
_.a=d
_.e=_.d=_.c=_.b=$
_.f=e
_.r=!0},
fi:function fi(){},
kD(d,e){return new A.fc(e,d,null)},
f3:function f3(d,e,f,g,h){var _=this
_.c=d
_.d=e
_.e=f
_.at=g
_.a=h},
fc:function fc(d,e,f){this.e=d
this.w=e
this.a=f},
fm:function fm(d,e){this.a=d
this.b=e},
dQ:function dQ(d,e){this.c=d
this.a=e},
eg:function eg(d,e){this.c=d
this.a=e},
m0(){return new A.aF(null)},
aF:function aF(d){this.a=d},
ej:function ej(){this.d=!1
this.c=this.a=null},
fZ:function fZ(d){this.a=d},
fY:function fY(d){this.a=d},
lJ(d){var x,w,v=y.w,u=B.M(v,v)
for(x=0;x<B.K(d.length);++x){w=B.q(d.item(x))
u.j(0,B.D(w.name),B.D(w.value))}return u}},E,F,I,K,D,G
B=c[0]
C=c[2]
H=c[11]
A=a.updateHolder(c[6],A)
E=c[18]
F=c[12]
I=c[13]
K=c[14]
D=c[8]
G=c[10]
A.dp.prototype={
a3(){return"AttachTarget."+this.b}}
A.c4.prototype={
M(){var x=B.bd(y.b),w=($.G+1)%16777215
$.G=w
return new A.er(null,!1,!1,x,w,this,C.d)}}
A.er.prototype={
a4(){var x=this.f
x.toString
y.h.a(x)
return E.a9},
S(){var x,w,v=this.f
v.toString
y.h.a(v)
x=this.e
x.toString
x=new A.at(B.d([],y.k),E.l,x)
x.aD("")
w=A.aT(x.x)
C.a.l(w.f,x)
w.r=!0
x.sc0(v.c)
return x},
O(d){var x
y.n.a(d)
x=this.f
x.toString
y.h.a(x)
d.sdQ(E.l)
d.sc0(x.c)},
aj(){var x,w
this.bx()
x=this.d$
x.toString
y.n.a(x)
w=this.e
w.toString
x.sd9(w)},
Z(){var x,w
this.ct()
x=this.d$
x.toString
y.n.a(x)
w=A.aT(x.x)
C.a.u(w.f,x)
w.aa()}}
A.at.prototype={
sdQ(d){var x=this,w=x.x
if(w===d)return
w=A.aT(w)
C.a.u(w.f,x)
w.aa()
x.x=d
w=A.aT(d)
C.a.l(w.f,x)
w.r=!0
A.aT(x.x).aa()},
sc0(d){y.f.a(d)
if(this.y===d)return
this.y=d
A.aT(this.x).aa()},
sd9(d){if(this.z===d)return
this.z=d
A.aT(this.x).ca(!0)},
T(d,e){var x,w,v,u,t=this
d.a=t
try{x=d.gv()
w=e==null?null:e.gv()
if(w==null&&C.a.U(t.w,x))return
if(w!=null&&!C.a.U(t.w,w))w=null
v=t.w
C.a.u(v,x)
u=w!=null?C.a.bl(v,w)+1:0
C.a.dl(v,u,x)
A.aT(t.x).aa()}finally{d.a_()}},
u(d,e){C.a.u(this.w,e.gv())
e.a=null
A.aT(this.x).aa()}}
A.dn.prototype={
gc4(){var x,w=this,v=w.b
if(v===$){x=B.q(B.c(b.G.document).querySelector(w.a.b))
x.toString
w.b!==$&&B.iz()
w.b=x
v=x}return v},
ca(d){var x,w,v,u,t,s,r,q,p,o,n,m=this
if(d||m.r){C.a.au(m.f,new A.fi())
m.r=!1}x=m.c
if(x===$){w=A.lJ(B.c(m.gc4().attributes))
m.c!==$&&B.iz()
m.c=w
x=w}for(v=m.f,u=v.length,t=0;t<v.length;v.length===u||(0,B.ar)(v),++t){s=v[t].y
if(s!=null)x.E(0,s)}r=B.iL(y.w)
for(q=0;v=m.gc4(),q<B.K(B.c(v.attributes).length);++q)r.l(0,B.D(B.q(B.c(v.attributes).item(q)).name))
if(x.a!==0)for(u=new B.aC(x,B.j(x).h("aC<1,2>")).gt(0);u.k();){p=u.d
o=p.a
B.dq(v,o,p.b)
r.u(0,o)}if(r.a!==0)for(u=B.jV(r,r.r,r.$ti.c),o=u.$ti.c;u.k();){n=u.d
if(n==null)n=o.a(n)
v.removeAttribute(n)}},
aa(){return this.ca(!1)}}
A.f3.prototype={
B(d){var x=this,w=null,v=y.w
v=B.M(v,v)
v.j(0,"cx",x.c)
v.j(0,"cy",x.d)
v.j(0,"r",x.e)
return new B.P("circle",w,w,w,v,w,x.at,w)}}
A.fc.prototype={
B(d){var x=null
return new B.P("span",x,x,this.e,x,x,this.w,x)}}
A.fm.prototype={
a3(){return"Display."+this.b}}
A.dQ.prototype={
B(d){var x=y.F
return new D.bm(this.c,B.d([D.ax(B.d([],x),"M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z")],x),null)}}
A.eg.prototype={
B(d){var x=y.F
return new D.bm(this.c,B.d([new A.f3("12","12","4",B.d([],x),null),D.ax(B.d([],x),"M12 4h.01"),D.ax(B.d([],x),"M20 12h.01"),D.ax(B.d([],x),"M12 20h.01"),D.ax(B.d([],x),"M4 12h.01"),D.ax(B.d([],x),"M17.657 6.343h.01"),D.ax(B.d([],x),"M17.657 17.657h.01"),D.ax(B.d([],x),"M6.343 17.657h.01"),D.ax(B.d([],x),"M6.343 6.343h.01")],x),null)}}
A.aF.prototype={
aJ(){return new A.ej()}}
A.ej.prototype={
aN(){this.bC()
this.d=B.av(B.q(B.c(b.G.document).documentElement).getAttribute("data-theme"))==="dark"},
B(d){var x,w=this,v=null,u=y.F,t=B.d([],u),s=w.d?"dark":"light",r=y.w
t.push(new A.c4(B.aZ(["data-theme",s],r,r),v))
r=B.aZ(["aria-label","Theme Toggle"],r,r)
s=G.hx(w.d?E.q:v,v,v,v,v,v,v)
s=A.kD(B.d([new A.dQ(20,v)],u),s)
x=G.hx(w.d?v:E.q,v,v,v,v,v,v)
t.push(I.j6(B.d([s,A.kD(B.d([new A.eg(20,v)],u),x)],u),r,"theme-toggle",v,new A.fZ(w),v))
return new H.bb(t,v)}}
var z=a.updateTypes(["b(at,at)"])
A.fi.prototype={
$2(d,e){var x=y.n
x.a(d)
x.a(e)
return d.z-e.z},
$S:z+0}
A.fZ.prototype={
$0(){var x,w=this.a
w.W(new A.fY(w))
x=B.c(B.c(b.G.window).localStorage)
w=w.d?"dark":"light"
x.setItem("jaspr:theme",w)},
$S:0}
A.fY.prototype={
$0(){var x=this.a
x.d=!x.d},
$S:0};(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.bO,[A.dp,A.fm])
w(A.c4,B.i)
w(A.er,B.b_)
w(A.at,B.cc)
w(A.dn,B.m)
w(A.fi,B.bw)
x(K.C,[A.f3,A.fc,A.dQ,A.eg])
w(A.aF,F.a0)
w(A.ej,F.O)
x(B.ay,[A.fZ,A.fY])})()
B.aN(b.typeUniverse,JSON.parse('{"at":{"V":[],"iP":[],"b0":[]},"c4":{"i":[]},"er":{"Q":[],"f":[],"I":[]},"f3":{"C":[],"i":[]},"fc":{"C":[],"i":[]},"dQ":{"C":[],"i":[]},"eg":{"C":[],"i":[]},"aF":{"a0":[],"i":[]},"ej":{"O":["aF"],"O.T":"aF"}}'))
var y={h:B.r("c4"),n:B.r("at"),b:B.r("f"),C:B.r("t<at>"),F:B.r("t<i>"),k:B.r("t<k>"),w:B.r("a"),f:B.r("w<a,a>?")};(function constants(){var x=a.makeConstList
E.l=new A.dp(0,"html")
E.q=new A.fm(0,"none")
E.a9=x([],y.F)})();(function staticFields(){$.jl=B.M(B.r("dp"),B.r("dn"))})()};
(a=>{a["MqkCBxNTRg55sRi8XPvHqhomIa0="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.client.dart.js_12.part.js.map
