Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6901B1A132E
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 19:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586282034;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LLsl2XadyXi4Tl8N0NLN3o8bD4M+XYn/fjXywwQWHqw=;
	b=S37f5x59p6buaA339srO4c6E511/zWHuSxC5tzkgvIfKuPNQYKni3plbAseeQb0E9tW4Ly
	W6Fz/D7pefl8PkVh45axXRjBjCy0DkYrk9X13cwn8Pj3ajVMIqylHdd+U1LhzZPB7R9jYB
	3CkHG6nGUYQOsginhz0BG2cCWDZdhYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-XwZhZT3UMvqfNndfsLBOtw-1; Tue, 07 Apr 2020 13:53:51 -0400
X-MC-Unique: XwZhZT3UMvqfNndfsLBOtw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EC69140B;
	Tue,  7 Apr 2020 17:53:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BD475C28F;
	Tue,  7 Apr 2020 17:53:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9895193A61;
	Tue,  7 Apr 2020 17:53:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037HrHNo004328 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 13:53:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2852A2166B2D; Tue,  7 Apr 2020 17:53:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24AE62166B2A
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 17:53:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 702EF8F614C
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 17:53:14 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-118-Q0mDy34aMSuZKpjLS3hVlg-1; Tue, 07 Apr 2020 13:53:12 -0400
X-MC-Unique: Q0mDy34aMSuZKpjLS3hVlg-1
Received: by mail-ed1-f66.google.com with SMTP id z65so5211295ede.0
	for <dm-devel@redhat.com>; Tue, 07 Apr 2020 10:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fReP27+S8EmMViT0XclWb7BSpfuyZbaoShchCIlF6Rg=;
	b=Ln+22Yr+RkgT8oA0cTJfd4/mOW1S2SyVjJ1EBdM1+N3BnDxX5wl3HeBs1alnz7bX87
	LcKQJIRhwLawUAsH9rNybocD36/c3avThrATc+ufdYsNcckFNgmEuDR14Go6K8NczTc0
	zXVtX2FOQw4yR8NvRSWp/idzDldnWsqhDRlncMWtUrY+Qkn4eLIA917rbN9BQxYURUh3
	dmrDX5w7comjs4zmmcvOmSop4e6P4AV8fapXegRjHxnfjugOEnX2belqBf0B18Ugdoah
	WUfJmhQwSwkjJxu5VGOUDGKYN8p/vSyz99+JtcAFOWxau+KDegX4CNXaY1xuGXVs69g0
	LjhQ==
X-Gm-Message-State: AGi0Pua9p9f1ktouLcTMmnWdRq4RmHwFvLEbIAc42qm/pRzD25O+Dl+t
	sMHubsQmgKRt/OK+RhgUuTVVEdDaS90SAsf20O/qqg==
X-Google-Smtp-Source: APiQypJ57XlctB5m5vpEXm+L/8pvYvG+sfnlbPnmuml+0OdDWKFc7GxhEGybYQcVpM/HElMl+IAh2syFW1PO5P0sDow=
X-Received: by 2002:a17:906:1e42:: with SMTP id
	i2mr3043907ejj.317.1586281990650; 
	Tue, 07 Apr 2020 10:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 Apr 2020 10:52:58 -0700
Message-ID: <CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037HrHNo004328
X-loop: dm-devel@redhat.com
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 7, 2020 at 8:02 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> [ resending this to x86 maintainers ]
>
> Hi
>
> I tested performance of various methods how to write to optane-based
> persistent memory, and found out that non-temporal stores achieve
> throughput 1.3 GB/s. 8 cached stores immediatelly followed by clflushopt
> or clwb achieve throughput 1.6 GB/s.
>
> memcpy_flushcache uses non-temporal stores, I modified it to use cached
> stores + clflushopt and it improved performance of the dm-writecache
> target significantly:
>
> dm-writecache throughput:
> (dd if=/dev/zero of=/dev/mapper/wc bs=64k oflag=direct)
> writecache block size   512             1024            2048            4096
> movnti                  496 MB/s        642 MB/s        725 MB/s        744 MB/s
> clflushopt              373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s
>
> For block size 512, movnti works better, for larger block sizes,
> clflushopt is better.

This should use clwb instead of clflushopt, the clwb macri
automatically converts back to clflushopt if clwb is not supported.

>
> I was also testing the novafs filesystem, it is not upstream, but it
> benefitted from similar change in __memcpy_flushcache and
> __copy_user_nocache:
> write throughput on big files - movnti: 662 MB/s, clwb: 1323 MB/s
> write throughput on small files - movnti: 621 MB/s, clwb: 1013 MB/s
>
>
> I submit this patch for __memcpy_flushcache that improves dm-writecache
> performance.
>
> Other ideas - should we introduce memcpy_to_pmem instead of modifying
> memcpy_flushcache and move this logic there? Or should I modify the
> dm-writecache target directly to use clflushopt with no change to the
> architecture-specific code?

This also needs to mention your analysis that showed that this can
have negative cache pollution effects [1], so I'm not sure how to
decide when to make the tradeoff. Once we have movdir64b the tradeoff
equation changes yet again:

[1]: https://lore.kernel.org/linux-nvdimm/alpine.LRH.2.02.2004010941310.23210@file01.intranet.prod.int.rdu2.redhat.com/


>
> Mikulas
>
>
>
>
> From: Mikulas Patocka <mpatocka@redhat.com>
>
> I tested dm-writecache performance on a machine with Optane nvdimm and it
> turned out that for larger writes, cached stores + cache flushing perform
> better than non-temporal stores. This is the throughput of dm-writecache
> measured with this command:
> dd if=/dev/zero of=/dev/mapper/wc bs=64 oflag=direct
>
> block size      512             1024            2048            4096
> movnti          496 MB/s        642 MB/s        725 MB/s        744 MB/s
> clflushopt      373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s
>
> We can see that for smaller block, movnti performs better, but for larger
> blocks, clflushopt has better performance.
>
> This patch changes the function __memcpy_flushcache accordingly, so that
> with size >= 768 it performs cached stores and cache flushing. Note that
> we must not use the new branch if the CPU doesn't have clflushopt - in
> that case, the kernel would use inefficient "clflush" instruction that has
> very bad performance.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>
> ---
>  arch/x86/lib/usercopy_64.c |   36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> Index: linux-2.6/arch/x86/lib/usercopy_64.c
> ===================================================================
> --- linux-2.6.orig/arch/x86/lib/usercopy_64.c   2020-03-24 15:15:36.644945091 -0400
> +++ linux-2.6/arch/x86/lib/usercopy_64.c        2020-03-30 07:17:51.450290007 -0400
> @@ -152,6 +152,42 @@ void __memcpy_flushcache(void *_dst, con
>                         return;
>         }
>
> +       if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) && size >= 768 && likely(boot_cpu_data.x86_clflush_size == 64)) {
> +               while (!IS_ALIGNED(dest, 64)) {
> +                       asm("movq    (%0), %%r8\n"
> +                           "movnti  %%r8,   (%1)\n"
> +                           :: "r" (source), "r" (dest)
> +                           : "memory", "r8");
> +                       dest += 8;
> +                       source += 8;
> +                       size -= 8;
> +               }
> +               do {
> +                       asm("movq    (%0), %%r8\n"
> +                           "movq   8(%0), %%r9\n"
> +                           "movq  16(%0), %%r10\n"
> +                           "movq  24(%0), %%r11\n"
> +                           "movq    %%r8,   (%1)\n"
> +                           "movq    %%r9,  8(%1)\n"
> +                           "movq   %%r10, 16(%1)\n"
> +                           "movq   %%r11, 24(%1)\n"
> +                           "movq  32(%0), %%r8\n"
> +                           "movq  40(%0), %%r9\n"
> +                           "movq  48(%0), %%r10\n"
> +                           "movq  56(%0), %%r11\n"
> +                           "movq    %%r8, 32(%1)\n"
> +                           "movq    %%r9, 40(%1)\n"
> +                           "movq   %%r10, 48(%1)\n"
> +                           "movq   %%r11, 56(%1)\n"
> +                           :: "r" (source), "r" (dest)
> +                           : "memory", "r8", "r9", "r10", "r11");
> +                       clflushopt((void *)dest);
> +                       dest += 64;
> +                       source += 64;
> +                       size -= 64;
> +               } while (size >= 64);
> +       }
> +
>         /* 4x8 movnti loop */
>         while (size >= 32) {
>                 asm("movq    (%0), %%r8\n"
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

