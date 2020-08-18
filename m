Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CF88D248FF1
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 23:13:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-pshhJ2gsNAuX2PK4IegIJw-1; Tue, 18 Aug 2020 17:13:19 -0400
X-MC-Unique: pshhJ2gsNAuX2PK4IegIJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E624E801AAE;
	Tue, 18 Aug 2020 21:13:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 477C95D6BD;
	Tue, 18 Aug 2020 21:13:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F13761832FC2;
	Tue, 18 Aug 2020 21:13:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ILCvCl015696 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 17:12:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 428A66379A; Tue, 18 Aug 2020 21:12:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D56C7D283
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 21:12:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4165984BAB
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 21:12:54 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
	[209.85.166.179]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-471-qcbtwP0kN927t9dxNt-a9A-1; Tue, 18 Aug 2020 17:12:51 -0400
X-MC-Unique: qcbtwP0kN927t9dxNt-a9A-1
Received: by mail-il1-f179.google.com with SMTP id r13so14478616iln.0
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 14:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EzpebzozPFXf5RUEBA/xi5CHzYCVft1FgBn2gI1yMY0=;
	b=Cq/GzSuB7yIiD3A1iq6zklk7zJdX2Dm4eAnYZUCTJD5I4/9cxuAWukGTyHoiooYfmg
	TAOXLTOZCM4zr+len4rWRG5mISbOapkGw7F7HGKVLV/oJxF6bvxutacSbiikHsrsY7sb
	r+9dq5PNfdFkKgk27bgvQeqn4yhh0I0VMaui+28zqm8qcaYBo6NsYb/pbhRxANx5eUdV
	huCbdcfQMypBL+JduMfOA9i65QgsbfrC7tEDym25lZOX0IFckEL2QQfNX5B6hngwNWs2
	IooWR1mwW5CRl9wnCsB4W3amnYg55mneNj0XNKbEiLFKmeW4hgOr1uS232+tZIwPMIeQ
	gjHg==
X-Gm-Message-State: AOAM533yebo1o0DTLav/P9fdRVRuHFJuFTIay/8hoDTangaLRdlLnIR6
	Tq1XbxGhMYlUMVvGYph2X7Zg45ZeWEka2tCz1uvCsQ==
X-Google-Smtp-Source: ABdhPJxkGsqQt8h52eXmuFSsrprQM33cbScCYS6gLAB8cMuCfY6me24T4DDyhSUtg7CwDNTGEaGPCXeQNBJqnt1LnHA=
X-Received: by 2002:a92:b74a:: with SMTP id c10mr19978249ilm.231.1597785171030;
	Tue, 18 Aug 2020 14:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200807160327.GA977@redhat.com>
	<CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
	<20200807204015.GA2178@redhat.com>
	<CAMeeMh_=M3Z7bLPN3_SD+VxNbosZjXgC_H2mZq1eCeZG0kUx1w@mail.gmail.com>
In-Reply-To: <CAMeeMh_=M3Z7bLPN3_SD+VxNbosZjXgC_H2mZq1eCeZG0kUx1w@mail.gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 18 Aug 2020 22:12:40 +0100
Message-ID: <CALrw=nHD81X4YCpuk-Pp9_FSFba6LZEVUwo-YkYh1nL9pEbzpA@mail.gmail.com>
To: John Dorminy <jdorminy@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>,
	Damien Le Moal <damien.lemoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.9
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2725516365737605119=="

--===============2725516365737605119==
Content-Type: multipart/alternative; boundary="0000000000008c11df05ad2d59e9"

--0000000000008c11df05ad2d59e9
Content-Type: text/plain; charset="UTF-8"

Just to bring in some more context: the primary trigger that made us look
into it was high p99 read latency on a random read workflow on modern-ish
SATA SSD and NVME disks. That is, on average things looked fine, but some
portions of requests, which required a small chunk of data to be fetched
from the disk fast were stalled for an unreasonable amount of time.

Most modern IO intensive workflows probably have good provisions to deal
with slow writes and usually when we write the data we care more about the
average throughput, that is we have enough throughput to write all the
incoming data to disk without losing it. On the contrary, there are many
modern IO workflows which require small chunks of data to be fetched fast
(distributed key-value stores, caching systems etc), thus the
emphasis there is on latency of reads (vs throughput of writes). And this
is where we think the synchronous behaviour provides most benefit.

Additionally if one cares about latency they will not use HDDs for the
workflow and HDDs have much higher IO latency than CPU scheduling. Thus it
does not make much sense to do any benchmarks on HDDs as the HDD latency
will likely hide any improvement/degradation of the synchronous IO handling
in dm-crypt.

But, even latency wise, in our testing on larger block sizes (>2M) the
synchronous IO (read/writes) may show worse performance and without fully
understanding why? we're probably not ready yet to recommend something as a
default.

Regards,
Ignat

On Tue, Aug 18, 2020 at 9:40 PM John Dorminy <jdorminy@redhat.com> wrote:

> For what it's worth, I just ran two tests on a machine with dm-crypt
> using the cipher_null:ecb cipher. Results are mixed; not offloading IO
> submission can result in -27% to +23% change in throughput, in a
> selection of three IO patterns HDDs and SSDs.
>
> (Note that the IO submission thread also reorders IO to attempt to
> submit it in sector order, so that is an additional difference between
> the two modes -- it's not just "offload writes to another thread" vs
> "don't offload writes".) The summary (for my FIO workloads focused on
> parallelism) is that offloading is useful for high IO depth random
> writes on SSDs, and for long sequential small writes on HDDs.
> Offloading reduced throughput for immensely high IO depths on SSDs,
> where I would guess lock contention is reducing effective IO depth to
> the disk; and for low IO depths of sequential writes on HDDs, where I
> would guess (as it would for a zoned device) preserving submission order
> is better than attempting to reorder before submission.
>
> Two test regimes: randwrite on 7xSamsung SSD 850 PRO 128G, somewhat
> aged, behind a LSI MegaRAID card providing raid0. 6 processors
> (Intel(R) Xeon(R) CPU E5-1650 v2 @ 3.50GHz); 128G RAM; and seqwrite,
> on a software raid0 (512k chunk size) of 4 HDDs on the same machine
> specs. Scheduler 'none' for both. LSI card in writethrough cache mode.
> All data in MB/s.
>
>
> depth    jobs    bs    dflt    no_wq    %chg    raw disk
> ----------------randwrite, SSD--------------
> 128    1    4k    282    282    0    285
> 256    4    4k    251    183    -27    283
> 2048    4    4k    266    283    +6    284
> 1    4    1m    433    414    -4    403
> ----------------seqwrite, HDD---------------
> 128    1    4k    87    107    +23    86
> 256    4    4k    101    90     -11    91
> 2048    4    4k    273    233    -15    249
> 1    4    1m    144    146    +1    146
>
>

--0000000000008c11df05ad2d59e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just to bring in some more context: the primary trigger th=
at made us look into it was high p99 read latency on a random read workflow=
 on modern-ish SATA SSD and NVME disks. That is, on average things looked f=
ine, but some portions of requests, which required a small chunk of data to=
 be fetched from the disk fast were stalled for an unreasonable amount of t=
ime.<div><br></div><div>Most modern IO intensive workflows probably have go=
od provisions to deal with slow writes and usually when we write the data w=
e care more about the average throughput, that is we have enough throughput=
 to write all the incoming data to disk without losing it. On the contrary,=
 there are many modern IO workflows which require small chunks of data to b=
e fetched fast (distributed key-value stores, caching systems etc), thus th=
e emphasis=C2=A0there is on latency of reads (vs throughput of writes). And=
 this is where we think the synchronous behaviour provides most benefit.</d=
iv><div><br></div><div>Additionally if one cares about latency they will no=
t use HDDs for the workflow and HDDs have much higher IO latency than CPU s=
cheduling. Thus it does not make much sense to do any benchmarks on HDDs as=
 the HDD latency will likely hide any improvement/degradation of the synchr=
onous IO handling in dm-crypt.<br></div><div><br></div><div>But, even laten=
cy wise, in our testing on larger block sizes (&gt;2M) the synchronous IO (=
read/writes) may show worse performance and without fully understanding why=
? we&#39;re probably not ready yet to recommend something as a default.</di=
v><div><br></div><div>Regards,</div><div>Ignat</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 18, 2020 at=
 9:40 PM John Dorminy &lt;<a href=3D"mailto:jdorminy@redhat.com">jdorminy@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">For what it&#39;s worth, I just ran two tests on a machine with =
dm-crypt<br>
using the cipher_null:ecb cipher. Results are mixed; not offloading IO<br>
submission can result in -27% to +23% change in throughput, in a<br>
selection of three IO patterns HDDs and SSDs.<br>
<br>
(Note that the IO submission thread also reorders IO to attempt to<br>
submit it in sector order, so that is an additional difference between<br>
the two modes -- it&#39;s not just &quot;offload writes to another thread&q=
uot; vs<br>
&quot;don&#39;t offload writes&quot;.) The summary (for my FIO workloads fo=
cused on<br>
parallelism) is that offloading is useful for high IO depth random<br>
writes on SSDs, and for long sequential small writes on HDDs.<br>
Offloading reduced throughput for immensely high IO depths on SSDs,<br>
where I would guess lock contention is reducing effective IO depth to<br>
the disk; and for low IO depths of sequential writes on HDDs, where I<br>
would guess (as it would for a zoned device) preserving submission order<br=
>
is better than attempting to reorder before submission.<br>
<br>
Two test regimes: randwrite on 7xSamsung SSD 850 PRO 128G, somewhat<br>
aged, behind a LSI MegaRAID card providing raid0. 6 processors<br>
(Intel(R) Xeon(R) CPU E5-1650 v2 @ 3.50GHz); 128G RAM; and seqwrite,<br>
on a software raid0 (512k chunk size) of 4 HDDs on the same machine<br>
specs. Scheduler &#39;none&#39; for both. LSI card in writethrough cache mo=
de.<br>
All data in MB/s.<br>
<br>
<br>
depth=C2=A0 =C2=A0 jobs=C2=A0 =C2=A0 bs=C2=A0 =C2=A0 dflt=C2=A0 =C2=A0 no_w=
q=C2=A0 =C2=A0 %chg=C2=A0 =C2=A0 raw disk<br>
----------------randwrite, SSD--------------<br>
128=C2=A0 =C2=A0 1=C2=A0 =C2=A0 4k=C2=A0 =C2=A0 282=C2=A0 =C2=A0 282=C2=A0 =
=C2=A0 0=C2=A0 =C2=A0 285<br>
256=C2=A0 =C2=A0 4=C2=A0 =C2=A0 4k=C2=A0 =C2=A0 251=C2=A0 =C2=A0 183=C2=A0 =
=C2=A0 -27=C2=A0 =C2=A0 283<br>
2048=C2=A0 =C2=A0 4=C2=A0 =C2=A0 4k=C2=A0 =C2=A0 266=C2=A0 =C2=A0 283=C2=A0=
 =C2=A0 +6=C2=A0 =C2=A0 284<br>
1=C2=A0 =C2=A0 4=C2=A0 =C2=A0 1m=C2=A0 =C2=A0 433=C2=A0 =C2=A0 414=C2=A0 =
=C2=A0 -4=C2=A0 =C2=A0 403<br>
----------------seqwrite, HDD---------------<br>
128=C2=A0 =C2=A0 1=C2=A0 =C2=A0 4k=C2=A0 =C2=A0 87=C2=A0 =C2=A0 107=C2=A0 =
=C2=A0 +23=C2=A0 =C2=A0 86<br>
256=C2=A0 =C2=A0 4=C2=A0 =C2=A0 4k=C2=A0 =C2=A0 101=C2=A0 =C2=A0 90=C2=A0 =
=C2=A0 =C2=A0-11=C2=A0 =C2=A0 91<br>
2048=C2=A0 =C2=A0 4=C2=A0 =C2=A0 4k=C2=A0 =C2=A0 273=C2=A0 =C2=A0 233=C2=A0=
 =C2=A0 -15=C2=A0 =C2=A0 249<br>
1=C2=A0 =C2=A0 4=C2=A0 =C2=A0 1m=C2=A0 =C2=A0 144=C2=A0 =C2=A0 146=C2=A0 =
=C2=A0 +1=C2=A0 =C2=A0 146<br>
<br>
</blockquote></div>

--0000000000008c11df05ad2d59e9--

--===============2725516365737605119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2725516365737605119==--

