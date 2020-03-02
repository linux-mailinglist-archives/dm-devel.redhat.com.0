Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB9B175CCF
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 15:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583158857;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GkHl+eEuNZOzutLOq1NB6Px0Rmr1aw2oloCHJH4muDU=;
	b=L9YZVrAfUR4TAfpca8YpVCHiA2KqKYHeIKDQAxz1Nz1XxFieeCdnQyAZmYdATyLFelJ+1r
	0P5OtFjOQ1L3KtMOiqBYFniRwVDltjDBpSyaxTtV+9GzJzNIRSnRJURB7olEOhSEgmzLh0
	HFozl/tzaa2Yar4UOLyr/Al5Khh4GQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-8TRl0tuyPG2JRLySaCrKZQ-1; Mon, 02 Mar 2020 09:20:54 -0500
X-MC-Unique: 8TRl0tuyPG2JRLySaCrKZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3ED7800D5C;
	Mon,  2 Mar 2020 14:20:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE060610B0;
	Mon,  2 Mar 2020 14:20:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 406BC84479;
	Mon,  2 Mar 2020 14:20:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022EJTpq005204 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 09:19:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 25CC310EE6D8; Mon,  2 Mar 2020 14:19:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2107E10EE6D2
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 14:19:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 420BA185A78F
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 14:19:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-286-CUX-aSG2NzKSp0OIpl91cA-1; Mon, 02 Mar 2020 09:19:24 -0500
X-MC-Unique: CUX-aSG2NzKSp0OIpl91cA-1
X-Originating-IP: 209.85.166.170
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170]) (Authenticated sender: gmail@opensvc.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E061F1C000D
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 14:19:21 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id q13so3279868ile.8
	for <dm-devel@redhat.com>; Mon, 02 Mar 2020 06:19:21 -0800 (PST)
X-Gm-Message-State: APjAAAXChvAaHe9cSokYbAnwAlHE2ki58l/M5dg9bHWXUFrL/558Pvyg
	IWu1itgBAwUpaEIlURh/LSeRlvDwP0iYRSORzjQ=
X-Google-Smtp-Source: APXvYqwUWo9hIiiKvjZCVzpdXrrfiAVxInpqPJJWGhXZtbAjHCuO7pdOfRn3Wq6bsglnvxGPtLY5JibRdeU+Dx8Cra0=
X-Received: by 2002:a92:798d:: with SMTP id u135mr17461041ilc.49.1583158760333;
	Mon, 02 Mar 2020 06:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20191228002451.9536-1-xose.vazquez@gmail.com>
	<f4b9152e-bce3-5ad8-7f2d-8b0220c2b472@gmail.com>
In-Reply-To: <f4b9152e-bce3-5ad8-7f2d-8b0220c2b472@gmail.com>
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 2 Mar 2020 15:19:09 +0100
X-Gmail-Original-Message-ID: <CABr-GnefEO7EXDsyi9uko0gn_qO_puMkmVHRT03DE=_o23Q4+Q@mail.gmail.com>
Message-ID: <CABr-GnefEO7EXDsyi9uko0gn_qO_puMkmVHRT03DE=_o23Q4+Q@mail.gmail.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>, Brian Bunker <brian@purestorage.com>
Subject: Re: [dm-devel] [PATCH resend] ALUA support for PURE FlashArray
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6670449704200536647=="

--===============6670449704200536647==
Content-Type: multipart/alternative; boundary="000000000000886ce9059fdfdfe7"

--000000000000886ce9059fdfdfe7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Xose, Brian,

I don't have the original patch in my mailbox, ... only Xose's
notifications.
Brian, please resend to: me, cc: list

Best,
Christophe.

On Mon, Mar 2, 2020 at 3:10 PM Xose Vazquez Perez <xose.vazquez@gmail.com>
wrote:

> On 12/28/19 1:24 AM, Xose Vazquez Perez wrote:
>
> Hi Christophe,
>
> This one is missing.
>
> Thank you.
>
> > From: Brian Bunker <brian@purestorage.com>
> >
> > Hello all,
> >
> > It has been some time since we updated our PURE FlashArray
> > configuration. The Linux vendors that we had been seeing in the field
> > were using very old versions of multipath-tools, so we haven=E2=80=99t =
needed to
> > change anything for some time. With the release of RHEL8, some of our
> > earlier values have been lost by upstream changes.
> >
> > In addition we have our Active Cluster feature which leverages ALUA
> > since our last patch. The ALUA confguration will work for all
> > FlashArrays with or without Active Cluster.
> >
> > We are changing 3 things.
> >
> > 1. ALUA support
> > 2. Fast fail timeout from the default of 5 seconds to 10 seconds (We
> >     need this for our FC NPIV port migration).
> > 3. Maximum sector size of 4MB. Some Linux vendors don=E2=80=99t honor t=
he block
> >     limits VPD page of INQUIRY).
> >
> > Thanks,
> > Brian
> >
> > Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> > Cc: DM-DEVEL ML <dm-devel@redhat.com>
> > Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> > Signed-off-by: Brian Bunker <brian@purestorage.com>
> > ---
> >   libmultipath/hwtable.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> > index 16627ec..9bc59f1 100644
> > --- a/libmultipath/hwtable.c
> > +++ b/libmultipath/hwtable.c
> > @@ -1039,7 +1039,12 @@ static struct hwentry default_hw[] =3D {
> >               /* FlashArray */
> >               .vendor        =3D "PURE",
> >               .product       =3D "FlashArray",
> > -             .pgpolicy      =3D MULTIBUS,
> > +             .pgpolicy      =3D GROUP_BY_PRIO,
> > +             .pgfailback    =3D -FAILBACK_IMMEDIATE,
> > +             .hwhandler     =3D "1 alua",
> > +             .prio_name     =3D PRIO_ALUA,
> > +             .fast_io_fail  =3D 10,
> > +             .max_sectors_kb =3D 4096,
> >       },
> >       /*
> >        * Huawei
> >
>
>

--000000000000886ce9059fdfdfe7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Xose, Brian,<div><br></div><div>I don&#39;t have t=
he original patch in my mailbox, ... only Xose&#39;s notifications.</div><d=
iv>Brian, please resend to: me, cc: list</div><div><br></div><div>Best,</di=
v><div>Christophe.</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 2, 2020 at 3:10 PM Xose Vazquez Perez &=
lt;<a href=3D"mailto:xose.vazquez@gmail.com">xose.vazquez@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/28=
/19 1:24 AM, Xose Vazquez Perez wrote:<br>
<br>
Hi Christophe,<br>
<br>
This one is missing.<br>
<br>
Thank you.<br>
<br>
&gt; From: Brian Bunker &lt;<a href=3D"mailto:brian@purestorage.com" target=
=3D"_blank">brian@purestorage.com</a>&gt;<br>
&gt; <br>
&gt; Hello all,<br>
&gt; <br>
&gt; It has been some time since we updated our PURE FlashArray<br>
&gt; configuration. The Linux vendors that we had been seeing in the field<=
br>
&gt; were using very old versions of multipath-tools, so we haven=E2=80=99t=
 needed to<br>
&gt; change anything for some time. With the release of RHEL8, some of our<=
br>
&gt; earlier values have been lost by upstream changes.<br>
&gt; <br>
&gt; In addition we have our Active Cluster feature which leverages ALUA<br=
>
&gt; since our last patch. The ALUA confguration will work for all<br>
&gt; FlashArrays with or without Active Cluster.<br>
&gt; <br>
&gt; We are changing 3 things.<br>
&gt; <br>
&gt; 1. ALUA support<br>
&gt; 2. Fast fail timeout from the default of 5 seconds to 10 seconds (We<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0need this for our FC NPIV port migration).<br>
&gt; 3. Maximum sector size of 4MB. Some Linux vendors don=E2=80=99t honor =
the block<br>
&gt;=C2=A0 =C2=A0 =C2=A0limits VPD page of INQUIRY).<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Brian<br>
&gt; <br>
&gt; Cc: Christophe Varoqui &lt;<a href=3D"mailto:christophe.varoqui@opensv=
c.com" target=3D"_blank">christophe.varoqui@opensvc.com</a>&gt;<br>
&gt; Cc: DM-DEVEL ML &lt;<a href=3D"mailto:dm-devel@redhat.com" target=3D"_=
blank">dm-devel@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Xose Vazquez Perez &lt;<a href=3D"mailto:xose.vazquez@g=
mail.com" target=3D"_blank">xose.vazquez@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Brian Bunker &lt;<a href=3D"mailto:brian@purestorage.co=
m" target=3D"_blank">brian@purestorage.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0libmultipath/hwtable.c | 7 ++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c<br>
&gt; index 16627ec..9bc59f1 100644<br>
&gt; --- a/libmultipath/hwtable.c<br>
&gt; +++ b/libmultipath/hwtable.c<br>
&gt; @@ -1039,7 +1039,12 @@ static struct hwentry default_hw[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FlashArray */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.vendor=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;PURE&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.product=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D &quot;FlashArray&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pgpolicy=C2=A0 =C2=
=A0 =C2=A0 =3D MULTIBUS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pgpolicy=C2=A0 =C2=
=A0 =C2=A0 =3D GROUP_BY_PRIO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pgfailback=C2=A0 =C2=
=A0 =3D -FAILBACK_IMMEDIATE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hwhandler=C2=A0 =C2=
=A0 =C2=A0=3D &quot;1 alua&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.prio_name=C2=A0 =C2=
=A0 =C2=A0=3D PRIO_ALUA,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fast_io_fail=C2=A0 =
=3D 10,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_sectors_kb =3D 4=
096,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Huawei<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000886ce9059fdfdfe7--

--===============6670449704200536647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============6670449704200536647==--

