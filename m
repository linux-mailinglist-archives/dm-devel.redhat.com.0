Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0B3175DCD
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 16:03:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583161428;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+2+Se3UNnBYWN6yzYrrKmC66gFtONIt84YA6H0DpMNY=;
	b=gu+v8I86yBiTOEEPiFHsNqN138tJddHWB96tzjpfW8nnMw4yxNkVCmesAbVw+qcb1Ei15N
	kugiBfbgwPxp2lASyvhzw/L4X+V+gyeCndLS8p4CqhiBNFhUt9EqXml+HtQEq4cVGJ7CFm
	4Fg4uT6pSntNCjJnc5zgp+c/c8b5p7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-ULF05Z_YPLCEl5EHYnKDxw-1; Mon, 02 Mar 2020 10:03:45 -0500
X-MC-Unique: ULF05Z_YPLCEl5EHYnKDxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D40711895F30;
	Mon,  2 Mar 2020 15:03:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCC285D9C9;
	Mon,  2 Mar 2020 15:03:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CD24182B00F;
	Mon,  2 Mar 2020 15:03:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022F3R0Q008596 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 10:03:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 01F22C690A; Mon,  2 Mar 2020 15:03:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1341D0B48
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 15:03:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B402101A55E
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 15:03:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-180-x4iX3MirM0qa3bI2iJSofA-1; Mon, 02 Mar 2020 10:03:21 -0500
X-MC-Unique: x4iX3MirM0qa3bI2iJSofA-1
X-Originating-IP: 209.85.166.173
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173]) (Authenticated sender: gmail@opensvc.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AEF701C0010
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 15:03:19 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id r4so8213318iln.0
	for <dm-devel@redhat.com>; Mon, 02 Mar 2020 07:03:19 -0800 (PST)
X-Gm-Message-State: ANhLgQ1CwgWHE5GK6d2LT/Cx8tt6AZ4flbwQZwLAakDDLwpWmyELF/9M
	NyIHkKJx9Nd+AeaWM+K1huzNaFqet9bA5A3eJ14=
X-Google-Smtp-Source: ADFU+vv84YznzU7Q1JzDVQRqVH6uYHT+p9msU8vwsRX8qJ9P0U31VD5lTVDWBsoPg1H4t6pIGMGu4Hey6eUObyC6sNA=
X-Received: by 2002:a05:6e02:eb4:: with SMTP id u20mr37471ilj.57.1583161398295;
	Mon, 02 Mar 2020 07:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20200302145354.1352-1-xose.vazquez@gmail.com>
In-Reply-To: <20200302145354.1352-1-xose.vazquez@gmail.com>
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 2 Mar 2020 16:03:06 +0100
X-Gmail-Original-Message-ID: <CABr-Gnc6kgT3jbZysKkU12dyS9_xReXmo8wW4_EX329CT3Oneg@mail.gmail.com>
Message-ID: <CABr-Gnc6kgT3jbZysKkU12dyS9_xReXmo8wW4_EX329CT3Oneg@mail.gmail.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3341276955627513961=="

--===============3341276955627513961==
Content-Type: multipart/alternative; boundary="000000000000c480e2059fe07c7e"

--000000000000c480e2059fe07c7e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Applied,
thanks.

On Mon, Mar 2, 2020 at 3:53 PM Xose Vazquez Perez <xose.vazquez@gmail.com>
wrote:

> From: Brian Bunker <brian@purestorage.com>
>
> Hello all,
>
> It has been some time since we updated our PURE FlashArray
> configuration. The Linux vendors that we had been seeing in the field
> were using very old versions of multipath-tools, so we haven=E2=80=99t ne=
eded to
> change anything for some time. With the release of RHEL8, some of our
> earlier values have been lost by upstream changes.
>
> In addition we have our Active Cluster feature which leverages ALUA
> since our last patch. The ALUA confguration will work for all
> FlashArrays with or without Active Cluster.
>
> We are changing 3 things.
>
> 1. ALUA support
> 2. Fast fail timeout from the default of 5 seconds to 10 seconds (We
>    need this for our FC NPIV port migration).
> 3. Maximum sector size of 4MB. Some Linux vendors don=E2=80=99t honor the=
 block
>    limits VPD page of INQUIRY).
>
> Thanks,
> Brian
>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> Signed-off-by: Brian Bunker <brian@purestorage.com>
> ---
>  libmultipath/hwtable.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> index 16627ec..9bc59f1 100644
> --- a/libmultipath/hwtable.c
> +++ b/libmultipath/hwtable.c
> @@ -1039,7 +1039,12 @@ static struct hwentry default_hw[] =3D {
>                 /* FlashArray */
>                 .vendor        =3D "PURE",
>                 .product       =3D "FlashArray",
> -               .pgpolicy      =3D MULTIBUS,
> +               .pgpolicy      =3D GROUP_BY_PRIO,
> +               .pgfailback    =3D -FAILBACK_IMMEDIATE,
> +               .hwhandler     =3D "1 alua",
> +               .prio_name     =3D PRIO_ALUA,
> +               .fast_io_fail  =3D 10,
> +               .max_sectors_kb =3D 4096,
>         },
>         /*
>          * Huawei
> --
> 2.24.1
>
> Brian Bunker
> SW Eng
> brian@purestorage.com
>

--000000000000c480e2059fe07c7e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Applied,<div>thanks.</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2, 2020 at 3:53 PM X=
ose Vazquez Perez &lt;<a href=3D"mailto:xose.vazquez@gmail.com">xose.vazque=
z@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Brian Bunker &lt;<a href=3D"mailto:brian@purestorage.com" =
target=3D"_blank">brian@purestorage.com</a>&gt;<br>
<br>
Hello all,<br>
<br>
It has been some time since we updated our PURE FlashArray<br>
configuration. The Linux vendors that we had been seeing in the field<br>
were using very old versions of multipath-tools, so we haven=E2=80=99t need=
ed to<br>
change anything for some time. With the release of RHEL8, some of our<br>
earlier values have been lost by upstream changes.<br>
<br>
In addition we have our Active Cluster feature which leverages ALUA<br>
since our last patch. The ALUA confguration will work for all<br>
FlashArrays with or without Active Cluster.<br>
<br>
We are changing 3 things.<br>
<br>
1. ALUA support<br>
2. Fast fail timeout from the default of 5 seconds to 10 seconds (We<br>
=C2=A0 =C2=A0need this for our FC NPIV port migration).<br>
3. Maximum sector size of 4MB. Some Linux vendors don=E2=80=99t honor the b=
lock<br>
=C2=A0 =C2=A0limits VPD page of INQUIRY).<br>
<br>
Thanks,<br>
Brian<br>
<br>
Cc: Christophe Varoqui &lt;<a href=3D"mailto:christophe.varoqui@opensvc.com=
" target=3D"_blank">christophe.varoqui@opensvc.com</a>&gt;<br>
Cc: DM-DEVEL ML &lt;<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank=
">dm-devel@redhat.com</a>&gt;<br>
Signed-off-by: Xose Vazquez Perez &lt;<a href=3D"mailto:xose.vazquez@gmail.=
com" target=3D"_blank">xose.vazquez@gmail.com</a>&gt;<br>
Signed-off-by: Brian Bunker &lt;<a href=3D"mailto:brian@purestorage.com" ta=
rget=3D"_blank">brian@purestorage.com</a>&gt;<br>
---<br>
=C2=A0libmultipath/hwtable.c | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c<br>
index 16627ec..9bc59f1 100644<br>
--- a/libmultipath/hwtable.c<br>
+++ b/libmultipath/hwtable.c<br>
@@ -1039,7 +1039,12 @@ static struct hwentry default_hw[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FlashArray */<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .vendor=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;PURE&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .product=C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;FlashArray&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pgpolicy=C2=A0 =C2=
=A0 =C2=A0 =3D MULTIBUS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pgpolicy=C2=A0 =C2=
=A0 =C2=A0 =3D GROUP_BY_PRIO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pgfailback=C2=A0 =
=C2=A0 =3D -FAILBACK_IMMEDIATE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hwhandler=C2=A0 =
=C2=A0 =C2=A0=3D &quot;1 alua&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.prio_name=C2=A0 =
=C2=A0 =C2=A0=3D PRIO_ALUA,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fast_io_fail=C2=A0=
 =3D 10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_sectors_kb =3D=
 4096,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Huawei<br>
-- <br>
2.24.1<br>
<br>
Brian Bunker<br>
SW Eng<br>
<a href=3D"mailto:brian@purestorage.com" target=3D"_blank">brian@purestorag=
e.com</a><br>
</blockquote></div>

--000000000000c480e2059fe07c7e--

--===============3341276955627513961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3341276955627513961==--

