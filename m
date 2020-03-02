Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EB861176854
	for <lists+dm-devel@lfdr.de>; Tue,  3 Mar 2020 00:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583192355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iBtBVHaqdxdDt5r2Dws6ge9gVi1Fb7J2rQOacVAwhK4=;
	b=C5wrV+jhsLJV8LgBDgm9LUwPLKg7HXPAjLbuceaF79R4eX5ERS0qG1D0nTxfFmr+72rpBZ
	NBW1xQRFS85ZVXfGuCxOEZTeKUTxnG8/AbNh+/zsZ1qOP1roUKogylcqal7uDZKzzYAKe2
	nbac3ZZf63VfpPfQpPaDhndKxexd+2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-o3hgN6lCPTy111SE7JEuVw-1; Mon, 02 Mar 2020 18:39:12 -0500
X-MC-Unique: o3hgN6lCPTy111SE7JEuVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8D16107B267;
	Mon,  2 Mar 2020 23:39:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A1A319E9C;
	Mon,  2 Mar 2020 23:39:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC51618089CD;
	Mon,  2 Mar 2020 23:39:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022NcvQT007659 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 18:38:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C943ADBF37; Mon,  2 Mar 2020 23:38:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C503BDEEDF
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 23:38:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D82EF80030A
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 23:38:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-56-geQ8yqHdPrGEIV7lKLHvtQ-1; Mon, 02 Mar 2020 18:38:51 -0500
X-MC-Unique: geQ8yqHdPrGEIV7lKLHvtQ-1
X-Originating-IP: 209.85.166.177
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177]) (Authenticated sender: gmail@opensvc.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 348741C0004;
	Mon,  2 Mar 2020 23:38:49 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id x2so1075119ila.9;
	Mon, 02 Mar 2020 15:38:48 -0800 (PST)
X-Gm-Message-State: ANhLgQ2I9mJ4TThqQDpucEWJt2Z8X9pQVBjwEV9UdaEbs3C3XHHu1hql
	nOaoSvsvE76Y2GdjWBa1tUrecCdLtznIV7XLTcg=
X-Google-Smtp-Source: ADFU+vu/O93VD9mx7RZ2TKcKLqqvxYZ2NGcXziNqkQirMMQuBpwa4Y3+p+Di4ItemXXQ22j7uIHk0AEmY7+bHlkc6TE=
X-Received: by 2002:a92:8547:: with SMTP id f68mr2169486ilh.26.1583192327677; 
	Mon, 02 Mar 2020 15:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20200302222025.21022-1-mwilck@suse.com>
In-Reply-To: <20200302222025.21022-1-mwilck@suse.com>
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 3 Mar 2020 00:38:36 +0100
X-Gmail-Original-Message-ID: <CABr-GncoE2_XKUUTD3GPQfeGKAVnZdavpA2_W++tMz7L=1sHow@mail.gmail.com>
Message-ID: <CABr-GncoE2_XKUUTD3GPQfeGKAVnZdavpA2_W++tMz7L=1sHow@mail.gmail.com>
To: Martin Wilck <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/4] multipath-tools unit test fixups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3308716080341448728=="

--===============3308716080341448728==
Content-Type: multipart/alternative; boundary="0000000000004d6fdf059fe7b022"

--0000000000004d6fdf059fe7b022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ben,

take the time you need for review,
I'll wait for this patchset before tagging the next version.

Best,
Christophe.

On Mon, Mar 2, 2020 at 11:20 PM <mwilck@suse.com> wrote:

> From: Martin Wilck <mwilck@suse.com>
>
> Hi Christophe, hi Ben,
>
> as announced in my previous post, here's a set of minor fixups for the
> unit tests. The README.md should have been created long ago. My main
> issue is that I'd prefer not to have a file under git control that is
> likely to be customized in every developer's environment and needs
> to be stashed away before every serious git work.
>
> Martin Wilck (4):
>   Remove tests/directio_test_dev
>   tests/Makefile: allow setting DIO_TEST_DEV in the environment
>   tests/Makefile: add test_clean target
>   tests: add README.md
>
>  tests/Makefile          | 13 +++++---
>  tests/README.md         | 72 +++++++++++++++++++++++++++++++++++++++++
>  tests/directio_test_dev |  4 ---
>  3 files changed, 81 insertions(+), 8 deletions(-)
>  create mode 100644 tests/README.md
>  delete mode 100644 tests/directio_test_dev
>
> --
> 2.25.0
>
>

--0000000000004d6fdf059fe7b022
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ben,<div><br></div><div>take the time you=C2=A0need for re=
view,</div><div>I&#39;ll wait for this patchset before tagging the next ver=
sion.</div><div><br></div><div>Best,</div><div>Christophe.</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar=
 2, 2020 at 11:20 PM &lt;<a href=3D"mailto:mwilck@suse.com">mwilck@suse.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Martin Wilck &lt;<a href=3D"mailto:mwilck@suse.com" target=3D"_blank"=
>mwilck@suse.com</a>&gt;<br>
<br>
Hi Christophe, hi Ben,<br>
<br>
as announced in my previous post, here&#39;s a set of minor fixups for the<=
br>
unit tests. The README.md should have been created long ago. My main<br>
issue is that I&#39;d prefer not to have a file under git control that is<b=
r>
likely to be customized in every developer&#39;s environment and needs<br>
to be stashed away before every serious git work.<br>
<br>
Martin Wilck (4):<br>
=C2=A0 Remove tests/directio_test_dev<br>
=C2=A0 tests/Makefile: allow setting DIO_TEST_DEV in the environment<br>
=C2=A0 tests/Makefile: add test_clean target<br>
=C2=A0 tests: add README.md<br>
<br>
=C2=A0tests/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++---<br>
=C2=A0tests/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 72 +++++++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0tests/directio_test_dev |=C2=A0 4 ---<br>
=C2=A03 files changed, 81 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100644 tests/README.md<br>
=C2=A0delete mode 100644 tests/directio_test_dev<br>
<br>
-- <br>
2.25.0<br>
<br>
</blockquote></div>

--0000000000004d6fdf059fe7b022--

--===============3308716080341448728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3308716080341448728==--

