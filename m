Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CEAD5D16
	for <lists+dm-devel@lfdr.de>; Mon, 14 Oct 2019 10:05:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F7AC10CC1F7;
	Mon, 14 Oct 2019 08:05:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FFC55C1D4;
	Mon, 14 Oct 2019 08:05:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BED554E58A;
	Mon, 14 Oct 2019 08:05:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9C92EpV005588 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 05:02:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C156A60BF4; Sat, 12 Oct 2019 09:02:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA2D260BF1
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 09:02:12 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AA7010DCCA6
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 09:02:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y19so14306857wrd.3
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ev-en-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1qB6mMB9vHA7aEtb67S66Ip9D63t+iUaxDTFhjESP1M=;
	b=paYlCG7gCS7AOga1nUgWe3awzzKJ3jn33pdODQlNSX+23gowqEbuJJS9lFIljjI6Ca
	bWFc0RxO4Yu1xzmHI1TxiRRiWIVU9tdnPAt2H63AKgM40PMMqVWfQDEeXECWgnCS92zH
	26kMXnw8/ahR/oGFMWifKlFUcnsEEodsk9eG/gJpapvibKh0gnno/hA0zcGaz160+SX/
	FAeKFObWSZbp3B+urt4+b7gimkLCBWRvScYPw6wNS4atbfMWgPsaSx4zML0a/X9L0Tdn
	Np6RC3h/NU9G0VhVdkb8mX4Hsa6wnUa2YdItTsp0Xxayzrji2hsDoJjD20xU+KqBOlie
	GvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1qB6mMB9vHA7aEtb67S66Ip9D63t+iUaxDTFhjESP1M=;
	b=YR6ZCLFCZvkoYmc+CUXBiNaVTOwzglmnPMPdDsERr6GEonRr6pO6ZHUY3ERnhoFhSD
	LTIp1QNZdXUv6GK2x2hk1pLz6GvQVDZjQcHSUF2WzeN8Vje8RUKoKgO235fuIWDOhJPJ
	2M8PbL0IJNxoTs8kkmVna0bDAa8X1QjWNUDiwfX22w07YsGtIfmlb1Nhrwq2a5jw8b5Y
	hai3KZETBlOJtbeaY34/1NFDdxQOS6iNq0+TOD9kF+f5e3V8PDhDQzLu0WRdYhhziJUo
	jdRfIr+db6YFakEgP1wnJ+JGt1PnHHeRhoNmZe2Mz1g9QzfsNChFg1ITfOWZhT7UzOQJ
	FIvQ==
X-Gm-Message-State: APjAAAWuo/F1UADPawQZ7DA+2yVKeio/wJsYTEydbBiL7L0fX+FJGa8j
	2OtH3vGVum4aT6tP2N1HjyCJjnKgMBj5rHVVdcl6xA==
X-Google-Smtp-Source: APXvYqx5Z/KO+NW6d2gKlUmA5OkvJY/M31QAgLPgBGVbyeFGfr0P/9wdUqNTmzEvve/vbkU80HSQDIZBmueaI3ZP77g=
X-Received: by 2002:adf:ed43:: with SMTP id u3mr16659663wro.236.1570870929050; 
	Sat, 12 Oct 2019 02:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190708213551.26349-1-petr.vorel@gmail.com>
	<20190709024742.GA22293@infradead.org>
	<20190709080204.GA12875@dell5510> <20190709133436.GA2231@infradead.org>
	<20191002060508.GA16684@x230> <20191007165732.GA4805@infradead.org>
	<20191008081831.GA29132@dell5510>
In-Reply-To: <20191008081831.GA29132@dell5510>
From: Baruch Even <baruch@ev-en.org>
Date: Sat, 12 Oct 2019 12:01:28 +0300
Message-ID: <CAC9+an+8SgNnR7Sr=Q8MKEN9ykPwL2q4LvSTE3C9OisDrN=pKg@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Sat, 12 Oct 2019 09:02:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Sat, 12 Oct 2019 09:02:11 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'baruch@ev-en.org' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <baruch@ev-en.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Oct 2019 04:04:23 -0400
Cc: Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/1] kpartx: Use __kernel_daddr_t for
	solaris_x86_slice.s_start
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
Content-Type: multipart/mixed; boundary="===============7664436705670947077=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Mon, 14 Oct 2019 08:05:25 +0000 (UTC)

--===============7664436705670947077==
Content-Type: multipart/alternative; boundary="000000000000b6e5590594b2e3c3"

--000000000000b6e5590594b2e3c3
Content-Type: text/plain; charset="UTF-8"

Hi,

The patch looks good to me, as for gpart, I needed it so I've taken the
bits and pieces that floated around and merged them all into one place from
all distributions that I could find.   As for users, in Debian the number
of users is around 250 so it's a very low usage program but I guess that
would always be unless very many people lost their partitions every day :-)

https://qa.debian.org/popcon-graph.php?packages=gpart

Cheers,
Baruch

P.S. While I'm sort of maintaining the program, it's only maintenance, no
active development is going on with it and very rarely do I get a patch or
an issue reported.

On Tue, Oct 8, 2019 at 11:18 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> Hi Christoph,
>
> > On Wed, Oct 02, 2019 at 08:05:09AM +0200, Petr Vorel wrote:
> > > I tried to search in [1], with not much success, I don't know the
> original name
> > > of the struct and struct members are quite similar. Do you have a tip,
> where it
> > > could be or would you dare to search?
>
> > No, I don't know Solaris very well.
>
> > > Christophe already merged my patch as
> > > 129e6fe6 ("kpartx: Use __kernel_daddr_t for solaris_x86_slice.s_start")
>
> > > But, according to your comments it looks to me better to use the exact
> structure
> > > kernel uses. So, if we don't find anything, I'd be for using kernel
> struct.
>
> > Thanks, that would be great.
> I've sent a patch, as RFC, Cc also Baruch Even, the gpart maintainer.
> I wonder, if there is anybody actually using this code nowadays.
>
> Kind regards,
> Petr
>

--000000000000b6e5590594b2e3c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>The patch looks good to =
me, as for gpart, I needed it so I&#39;ve taken the bits and pieces that fl=
oated around and merged them all into one place from all distributions that=
 I could find.=C2=A0=C2=A0 As for users, in Debian the number of users is a=
round 250 so it&#39;s a very low usage program but I guess that would alway=
s be unless very many people lost their partitions every day :-)</div><div>=
<br></div><div><a href=3D"https://qa.debian.org/popcon-graph.php?packages=
=3Dgpart">https://qa.debian.org/popcon-graph.php?packages=3Dgpart</a></div>=
<div><br></div><div>Cheers,</div><div>Baruch<br></div><div><br></div><div>P=
.S. While I&#39;m sort of maintaining the program, it&#39;s only maintenanc=
e, no active development is going on with it and very rarely do I get a pat=
ch or an issue reported.<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 8, 2019 at 11:18 AM Petr Vore=
l &lt;<a href=3D"mailto:petr.vorel@gmail.com">petr.vorel@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Christ=
oph,<br>
<br>
&gt; On Wed, Oct 02, 2019 at 08:05:09AM +0200, Petr Vorel wrote:<br>
&gt; &gt; I tried to search in [1], with not much success, I don&#39;t know=
 the original name<br>
&gt; &gt; of the struct and struct members are quite similar. Do you have a=
 tip, where it<br>
&gt; &gt; could be or would you dare to search?<br>
<br>
&gt; No, I don&#39;t know Solaris very well.<br>
<br>
&gt; &gt; Christophe already merged my patch as<br>
&gt; &gt; 129e6fe6 (&quot;kpartx: Use __kernel_daddr_t for solaris_x86_slic=
e.s_start&quot;)<br>
<br>
&gt; &gt; But, according to your comments it looks to me better to use the =
exact structure<br>
&gt; &gt; kernel uses. So, if we don&#39;t find anything, I&#39;d be for us=
ing kernel struct.<br>
<br>
&gt; Thanks, that would be great.<br>
I&#39;ve sent a patch, as RFC, Cc also Baruch Even, the gpart maintainer.<b=
r>
I wonder, if there is anybody actually using this code nowadays.<br>
<br>
Kind regards,<br>
Petr<br>
</blockquote></div>

--000000000000b6e5590594b2e3c3--


--===============7664436705670947077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============7664436705670947077==--

