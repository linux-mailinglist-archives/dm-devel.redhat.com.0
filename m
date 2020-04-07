Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6041A1173
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 18:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586277246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nKENZs8kpbDf/tqKMqi8+yd5EiX65VOZfNZoOGNFOeE=;
	b=HejJgcAkXw2oIOXdUVUGibC8p5ZLz/WrokS/aIkpVZwoL7i9atsFqjSTi47BoqeIMr9pBN
	shTi7V8zcVlV48NSdkiVYCGdFUx6ggYPKQNiIP8AFmiGYuOK6gidVkJ7OCPIYDMyQPFpAc
	z7+uca3V4rJBij2gKXvqzeA47s+CPeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114--clRbOegOfam8ndneerSTw-1; Tue, 07 Apr 2020 12:34:03 -0400
X-MC-Unique: -clRbOegOfam8ndneerSTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B64668017FC;
	Tue,  7 Apr 2020 16:33:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C01B60C18;
	Tue,  7 Apr 2020 16:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7E1E93A61;
	Tue,  7 Apr 2020 16:33:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037GXbxj030308 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 12:33:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C82C10027A4; Tue,  7 Apr 2020 16:33:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44E7E10021B3;
	Tue,  7 Apr 2020 16:33:34 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 037GXXVk011116; Tue, 7 Apr 2020 12:33:33 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 037GXWKg011107; Tue, 7 Apr 2020 12:33:33 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 7 Apr 2020 12:33:32 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Andy Lutomirski <luto@amacapital.net>
In-Reply-To: <583AD128-5B10-4414-A35B-FEACF30B7C5A@amacapital.net>
Message-ID: <alpine.LRH.2.02.2004071223130.7791@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<583AD128-5B10-4414-A35B-FEACF30B7C5A@amacapital.net>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dm-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [dm-devel] [PATCH] memcpy_flushcache: use cache flusing for
 larger lengths
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
Content-Type: MULTIPART/MIXED; BOUNDARY="185206533-410240676-1586277213=:7791"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--185206533-410240676-1586277213=:7791
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On Tue, 7 Apr 2020, Andy Lutomirski wrote:

>=20
> > On Apr 7, 2020, at 8:01 AM, Mikulas Patocka <mpatocka@redhat.com> wrote=
:
> >=20
> > =EF=BB=BF[ resending this to x86 maintainers ]
> >=20
> > Hi
> >=20
> > I tested performance of various methods how to write to optane-based
> > persistent memory, and found out that non-temporal stores achieve=20
> > throughput 1.3 GB/s. 8 cached stores immediatelly followed by clflushop=
t=20
> > or clwb achieve throughput 1.6 GB/s.
> >=20
> > memcpy_flushcache uses non-temporal stores, I modified it to use cached=
=20
> > stores + clflushopt and it improved performance of the dm-writecache=20
> > target significantly:
> >=20
> > dm-writecache throughput:
> > (dd if=3D/dev/zero of=3D/dev/mapper/wc bs=3D64k oflag=3Ddirect)
> > writecache block size   512             1024            2048           =
 4096
> > movnti                  496 MB/s        642 MB/s        725 MB/s       =
 744 MB/s
> > clflushopt              373 MB/s        688 MB/s        1.1 GB/s       =
 1.2 GB/s
> >=20
> > For block size 512, movnti works better, for larger block sizes,=20
> > clflushopt is better.
> >=20
> > I was also testing the novafs filesystem, it is not upstream, but it=20
> > benefitted from similar change in __memcpy_flushcache and=20
> > __copy_user_nocache:
> > write throughput on big files - movnti: 662 MB/s, clwb: 1323 MB/s
> > write throughput on small files - movnti: 621 MB/s, clwb: 1013 MB/s
> >=20
> >=20
> > I submit this patch for __memcpy_flushcache that improves dm-writecache=
=20
> > performance.
> >=20
> > Other ideas - should we introduce memcpy_to_pmem instead of modifying=
=20
> > memcpy_flushcache and move this logic there? Or should I modify the=20
> > dm-writecache target directly to use clflushopt with no change to the=
=20
> > architecture-specific code?
> >=20
> > Mikulas
> >=20
> >=20
> >=20
> >=20
> > From: Mikulas Patocka <mpatocka@redhat.com>
> >=20
> > I tested dm-writecache performance on a machine with Optane nvdimm and =
it
> > turned out that for larger writes, cached stores + cache flushing perfo=
rm
> > better than non-temporal stores. This is the throughput of dm-writecach=
e
> > measured with this command:
> > dd if=3D/dev/zero of=3D/dev/mapper/wc bs=3D64 oflag=3Ddirect
> >=20
> > block size    512        1024        2048        4096
> > movnti        496 MB/s    642 MB/s    725 MB/s    744 MB/s
> > clflushopt    373 MB/s    688 MB/s    1.1 GB/s    1.2 GB/s
> >=20
> > We can see that for smaller block, movnti performs better, but for larg=
er
> > blocks, clflushopt has better performance.
> >=20
> > This patch changes the function __memcpy_flushcache accordingly, so tha=
t
> > with size >=3D 768 it performs cached stores and cache flushing. Note t=
hat
> > we must not use the new branch if the CPU doesn't have clflushopt - in
> > that case, the kernel would use inefficient "clflush" instruction that =
has
> > very bad performance.
> >=20
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> >=20
> > ---
> > arch/x86/lib/usercopy_64.c |   36 ++++++++++++++++++++++++++++++++++++
> > 1 file changed, 36 insertions(+)
> >=20
> > Index: linux-2.6/arch/x86/lib/usercopy_64.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- linux-2.6.orig/arch/x86/lib/usercopy_64.c    2020-03-24 15:15:36.64=
4945091 -0400
> > +++ linux-2.6/arch/x86/lib/usercopy_64.c    2020-03-30 07:17:51.4502900=
07 -0400
> > @@ -152,6 +152,42 @@ void __memcpy_flushcache(void *_dst, con
> >            return;
> >    }
> >=20
> > +    if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) && size >=3D 768 && lik=
ely(boot_cpu_data.x86_clflush_size =3D=3D 64)) {
> > +        while (!IS_ALIGNED(dest, 64)) {
> > +            asm("movq    (%0), %%r8\n"
> > +                "movnti  %%r8,   (%1)\n"
> > +                :: "r" (source), "r" (dest)
> > +                : "memory", "r8");
> > +            dest +=3D 8;
> > +            source +=3D 8;
> > +            size -=3D 8;
> > +        }
> > +        do {
> > +            asm("movq    (%0), %%r8\n"
> > +                "movq   8(%0), %%r9\n"
> > +                "movq  16(%0), %%r10\n"
> > +                "movq  24(%0), %%r11\n"
> > +                "movq    %%r8,   (%1)\n"
> > +                "movq    %%r9,  8(%1)\n"
> > +                "movq   %%r10, 16(%1)\n"
> > +                "movq   %%r11, 24(%1)\n"
> > +                "movq  32(%0), %%r8\n"
> > +                "movq  40(%0), %%r9\n"
> > +                "movq  48(%0), %%r10\n"
> > +                "movq  56(%0), %%r11\n"
> > +                "movq    %%r8, 32(%1)\n"
> > +                "movq    %%r9, 40(%1)\n"
> > +                "movq   %%r10, 48(%1)\n"
> > +                "movq   %%r11, 56(%1)\n"
> > +                :: "r" (source), "r" (dest)
> > +                : "memory", "r8", "r9", "r10", "r11");
>=20
> Does this actually work better than the corresponding C code?
>=20
> Also, that memory clobber probably isn=E2=80=99t doing your code generati=
on any=20
> favors.  Experimentally, you have the constraints wrong. An =E2=80=9Cr=E2=
=80=9D=20

The existing "movnti" loop uses exactly the same constraints (and the=20
"memory" clobber).

> constraint doesn=E2=80=99t tell GCC that you are dereferencing the pointe=
r. =20
> You need to use =E2=80=9Cm=E2=80=9D with a correctly-sized type.

But you would use
=09"=3Dm"(*(char *)dest),"=3Dm"(*((char *)dest + 8)),"=3Dm"((char *)dest + =
16))...
and so on, until you run out of argument numbers.

> But I bet plain C is at least as good.

I tried to replace it with
=09memcpy((void *)dest, (void *)src, 64);

The compiler inlined the memcpy function into 8 loads and 8 stores.=20
However, the whole function __memcpy_flushcache consumed one more saved=20
register and the machine code was a few bytes longer.

Mikulas
--185206533-410240676-1586277213=:7791
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--185206533-410240676-1586277213=:7791--

