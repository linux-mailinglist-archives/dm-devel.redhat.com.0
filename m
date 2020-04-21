Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E1D101B2F64
	for <lists+dm-devel@lfdr.de>; Tue, 21 Apr 2020 20:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587494641;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=67BrHm31wfBFVQTUou2cYKmW25EMlu0wd7X4yL5wUs4=;
	b=QDb3+vhOQL11V/EGXgOGI4qNTMdP/HCie9CzEoJVveC8hO8ZxlcHobcqfVPRGLkNwanH2C
	yzZAvL2Ftw/bHz+gOTfhuV1IWn7ef6cGWEPmAzsg1ToRp0CwdeDb1DdowCp+uoEIHcAhXW
	SukHk3HAiTqTqoKTBV3V0Ho5MLRx3Ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-Q8un6UvHPF22-k7oGHVcyQ-1; Tue, 21 Apr 2020 14:43:59 -0400
X-MC-Unique: Q8un6UvHPF22-k7oGHVcyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A815E6124F;
	Tue, 21 Apr 2020 18:43:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ABCD19C70;
	Tue, 21 Apr 2020 18:43:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A07B918089C8;
	Tue, 21 Apr 2020 18:43:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LIhaww029791 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 14:43:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BF95BA15B; Tue, 21 Apr 2020 18:43:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57BF5F101F
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 18:43:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CB9686BCCF
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 18:43:33 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-453-onPFwVoYNaeiUbA2PaBNcw-1; Tue, 21 Apr 2020 14:43:29 -0400
X-MC-Unique: onPFwVoYNaeiUbA2PaBNcw-1
Received: by mail-ed1-f67.google.com with SMTP id p16so6384834edm.10
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 11:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mgaHL2sx7zxJvPNm/GGEyVochO7NmV1sPRGglJA26tQ=;
	b=M3bygECTmnvfxkRbXL3OSGcIqfAqlpumnftYQlfGSYiXOluaIsgjwgkwV0S36djVOF
	ct5f838JcSwGDtFIKnP5wWhJgNVafUtLpSEdbojtE9RtBqc34yP136++5YLMhJzNZNJl
	K1UBr6Fr2A0ePxbZhc7gyvvEl2PuR8jHkAMSW81R34DUHNFIzOoWTm0wpYazomulf5fN
	3IL3KHDfHG2Avadgst4O/MsdOSJXXWzCIjbzJpLYZDfI2GgWdeXlsBgDl/ZECWXmFLCe
	t1HM5PsSOV91wxiCRqo4g+YbVeiWKmGmUc18BD4UpobefNoPjpyBkpZ1ZsSuFuiJ2d3S
	UGow==
X-Gm-Message-State: AGi0PuYPbYiosqimSAntlpqtMKPQUZpPST51ZH3VrXfNFSElACIwAcdO
	r7KHdit2jPQ1OsyOupk6nPpcXWjUPe40/u1Buw22bg==
X-Google-Smtp-Source: APiQypLU/YHpkxy/jF9ecqh0L87Vc2+KGYUzSn5UrWJCn82iidwfngTJ2+X9JWrvIeGyBcVyj4W3pVnNCdFleUstH9Q=
X-Received: by 2002:a50:c3c2:: with SMTP id i2mr19412349edf.93.1587494608406; 
	Tue, 21 Apr 2020 11:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
	<alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4gpe8u=zNrRhvd9ioVNGbOJfRUXzFZuV--be6Hbj0xXtQ@mail.gmail.com>
	<alpine.LRH.2.02.2004170831530.16047@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4jjJ_SZuAjdhdQKGWh6qiP1O4kFyzP9BcBgbb2oanc=yQ@mail.gmail.com>
	<87a739zvrg.fsf@nanos.tec.linutronix.de>
	<alpine.LRH.2.02.2004200943160.4909@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2004200943160.4909@file01.intranet.prod.int.rdu2.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 21 Apr 2020 11:43:17 -0700
Message-ID: <CAPcyv4g22VFhDgwb6JN4M63ey8Jm1cc2OFwOW1AOJwmoxki_DA@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LIhaww029791
X-loop: dm-devel@redhat.com
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [dm-devel] [PATCH v2] x86: introduce memcpy_flushcache_single
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 20, 2020 at 6:48 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Fri, 17 Apr 2020, Thomas Gleixner wrote:
>
> > Dan Williams <dan.j.williams@intel.com> writes:
> >
> > > The goal of naming it _inatomic() was specifically for the observation
> > > that your driver coordinates atomic access and does not benefit from
> > > the cache friendliness that non-temporal stores afford. That said
> > > _inatomic() is arguably not a good choice either because that refers
> > > to whether the copy is prepared to take a fault or not. What about
> > > _exclusive() or _single()? Anything but _clflushopt() that conveys no
> > > contextual information.
>
> OK. I renamed it to memcpy_flushcache_single
>
> > > Other than quibbling with the name, and one more comment below, this
> > > looks ok to me.
> > >
> > >> Index: linux-2.6/drivers/md/dm-writecache.c
> > >> ===================================================================
> > >> --- linux-2.6.orig/drivers/md/dm-writecache.c   2020-04-17 14:06:35.139999000 +0200
> > >> +++ linux-2.6/drivers/md/dm-writecache.c        2020-04-17 14:06:35.129999000 +0200
> > >> @@ -1166,7 +1166,10 @@ static void bio_copy_block(struct dm_wri
> > >>                         }
> > >>                 } else {
> > >>                         flush_dcache_page(bio_page(bio));
> > >> -                       memcpy_flushcache(data, buf, size);
> > >> +                       if (likely(size > 512))
> > >
> > > This needs some reference to how this magic number is chosen and how a
> > > future developer might determine whether the value needs to be
> > > adjusted.
> >
> > I don't think it's a good idea to make this decision in generic code as
> > architectures or even CPU models might have different constraints on the
> > size.
> >
> > So I'd rather let the architecture implementation decide and make this
> >
> >                          flush_dcache_page(bio_page(bio));
> >  -                       memcpy_flushcache(data, buf, size);
> >  +                       memcpy_flushcache_bikesheddedname(data, buf, size);
> >
> > and have the default fallback memcpy_flushcache() and let the
> > architecture sort the size limit and the underlying technology out.
> >
> > So x86 can use clflushopt or implement it with movdir64b and any other
> > architecture can provide their own magic soup without changing the
> > callsite.
> >
> > Thanks,
> >
> >         tglx
>
> OK - so I moved the decision to memcpy_flushcache_single and I added a
> comment that explains the magic number.
>
> Mikulas
>
>
>
>
> From: Mikulas Patocka <mpatocka@redhat.com>
>
> Implement the function memcpy_flushcache_single which flushes cache just
> like memcpy_flushcache - except that it uses cached writes and explicit
> cache flushing instead of non-temporal stores.
>
> Explicit cache flushing performs better in singlethreaded cases (i.e. the
> dm-writecache target with block size greater than 512), non-temporal
> stores perform better in other cases (mostly multithreaded workloads) - so
> we provide these two functions and the user should select which one is
> faster for his particular workload.

I would mention that dm-writecache is choosing to use
memcpy_flushcache_single() because it is regularly invoked under a
lock.

"The dm-writecache target is singlethreaded (all the copying is done
while holding the writecache lock), so it benefits from clwb." [1]

[1]: http://lore.kernel.org/r/alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com

>
> dm-writecache througput (on real Optane-based persistent memory):
> block size      512             1024            2048            4096
> movnti          496 MB/s        642 MB/s        725 MB/s        744 MB/s
> clflushopt      373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>
> ---
>  arch/x86/include/asm/string_64.h |   10 ++++++++
>  arch/x86/lib/usercopy_64.c       |   46 +++++++++++++++++++++++++++++++++++++++
>  drivers/md/dm-writecache.c       |    2 -
>  include/linux/string.h           |    6 +++++
>  4 files changed, 63 insertions(+), 1 deletion(-)
>
> Index: linux-2.6/arch/x86/include/asm/string_64.h
> ===================================================================
> --- linux-2.6.orig/arch/x86/include/asm/string_64.h     2020-04-20 15:31:46.939999000 +0200
> +++ linux-2.6/arch/x86/include/asm/string_64.h  2020-04-20 15:31:46.929999000 +0200
> @@ -114,6 +114,14 @@ memcpy_mcsafe(void *dst, const void *src
>         return 0;
>  }
>
> +/*
> + * In some cases (mostly single-threaded workload), clflushopt is faster
> + * than non-temporal stores. In other situations, non-temporal stores are
> + * faster. So, we provide two functions:
> + *     memcpy_flushcache using non-temporal stores
> + *     memcpy_flushcache_single using clflushopt
> + * The caller should test which one is faster for the particular workload.
> + */
>  #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
>  #define __HAVE_ARCH_MEMCPY_FLUSHCACHE 1
>  void __memcpy_flushcache(void *dst, const void *src, size_t cnt);
> @@ -135,6 +143,8 @@ static __always_inline void memcpy_flush
>         }
>         __memcpy_flushcache(dst, src, cnt);
>  }
> +#define __HAVE_ARCH_MEMCPY_FLUSHCACHE_CLFLUSHOPT 1
> +void memcpy_flushcache_single(void *dst, const void *src, size_t cnt);
>  #endif
>
>  #endif /* __KERNEL__ */
> Index: linux-2.6/include/linux/string.h
> ===================================================================
> --- linux-2.6.orig/include/linux/string.h       2020-04-20 15:31:46.939999000 +0200
> +++ linux-2.6/include/linux/string.h    2020-04-20 15:31:46.929999000 +0200
> @@ -175,6 +175,12 @@ static inline void memcpy_flushcache(voi
>         memcpy(dst, src, cnt);
>  }
>  #endif
> +#ifndef __HAVE_ARCH_MEMCPY_FLUSHCACHE_CLFLUSHOPT
> +static inline void memcpy_flushcache_single(void *dst, const void *src, size_t cnt)
> +{
> +       memcpy_flushcache(dst, src, cnt);
> +}
> +#endif
>  void *memchr_inv(const void *s, int c, size_t n);
>  char *strreplace(char *s, char old, char new);
>
> Index: linux-2.6/arch/x86/lib/usercopy_64.c
> ===================================================================
> --- linux-2.6.orig/arch/x86/lib/usercopy_64.c   2020-04-20 15:31:46.939999000 +0200
> +++ linux-2.6/arch/x86/lib/usercopy_64.c        2020-04-20 15:38:13.159999000 +0200
> @@ -199,6 +199,52 @@ void __memcpy_flushcache(void *_dst, con
>  }
>  EXPORT_SYMBOL_GPL(__memcpy_flushcache);
>
> +void memcpy_flushcache_single(void *_dst, const void *_src, size_t size)
> +{
> +       unsigned long dest = (unsigned long) _dst;
> +       unsigned long source = (unsigned long) _src;
> +
> +       /*
> +        * dm-writecache througput (on real Optane-based persistent memory):
> +        * measured with dd:

Why mention Optane? There are several types of persistent memory.
Typical persistent memory to date behaves like DDR because it is
battery backed. So if you're going to mention the memory type I would
also include the DDR details.

At a minimum include the lore link in the changelog to the wider
analysis you contributed on the mailing list.

> +        *
> +        * block size   512             1024            2048            4096
> +        * movnti       496 MB/s        642 MB/s        725 MB/s        744 MB/s
> +        * clflushopt   373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s
> +        *
> +        * We see that movnti performs better for 512-byte blocks, and
> +        * clflushopt performs better for 1024-byte and larger blocks. So, we
> +        * prefer clflushopt for sizes >= 768.
> +        */
> +
> +       if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) && likely(boot_cpu_data.x86_clflush_size == 64) &&
> +           likely(size >= 768)) {
> +               if (unlikely(!IS_ALIGNED(dest, 64))) {
> +                       size_t len = min_t(size_t, size, ALIGN(dest, 64) - dest);
> +
> +                       memcpy((void *) dest, (void *) source, len);
> +                       clflushopt((void *)dest);
> +                       dest += len;
> +                       source += len;
> +                       size -= len;
> +               }
> +               do {
> +                       memcpy((void *)dest, (void *)source, 64);
> +                       clflushopt((void *)dest);
> +                       dest += 64;
> +                       source += 64;
> +                       size -= 64;
> +               } while (size >= 64)
> +               if (unlikely(size != 0)) {
> +                       memcpy((void *)dest, (void *)source, size);
> +                       clflushopt((void *)dest);
> +               }
> +               return;
> +       }
> +       memcpy_flushcache((void *)dest, (void *)source, size);
> +}
> +EXPORT_SYMBOL_GPL(memcpy_flushcache_single);
> +
>  void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
>                 size_t len)
>  {
> Index: linux-2.6/drivers/md/dm-writecache.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-writecache.c   2020-04-20 15:31:46.939999000 +0200
> +++ linux-2.6/drivers/md/dm-writecache.c        2020-04-20 15:32:35.549999000 +0200
> @@ -1166,7 +1166,7 @@ static void bio_copy_block(struct dm_wri
>                         }
>                 } else {
>                         flush_dcache_page(bio_page(bio));
> -                       memcpy_flushcache(data, buf, size);
> +                       memcpy_flushcache_single(data, buf, size);
>                 }
>
>                 bvec_kunmap_irq(buf, &flags);
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

