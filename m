Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBE019A09C
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 23:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585689625;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=arMQl8p5sPtCxHPDat+/WWh1cQ6bC2utKs5b+J5qBig=;
	b=eo20kYRDX18XlVCXo3AHe8Yy/5+2KaNA4ilqUIq3fzS6aeQ/ASIgeX0ueCGEdJ/7wH+rpM
	JJkCTNJ+JgPGtBEcamtOLPJuZ7VfXPtzJunYdbVAPQh8DjkkrKUAUzJBYNeTfCmEBoEJaN
	Cwz2HSl68+FlU5Xk+RHHuwbLyUuPVC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-h7KifmrkNUa4yckU00uLeQ-1; Tue, 31 Mar 2020 17:20:23 -0400
X-MC-Unique: h7KifmrkNUa4yckU00uLeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 422D6107ACC9;
	Tue, 31 Mar 2020 21:20:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6860660BFE;
	Tue, 31 Mar 2020 21:20:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F35886C0E;
	Tue, 31 Mar 2020 21:20:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VLJnL4025163 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 17:19:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2FE22166B2F; Tue, 31 Mar 2020 21:19:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF5172166B2A
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 21:19:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D87B6101A55F
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 21:19:46 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-sTLJrjsjNxisw6-Pe_Ud6g-1; Tue, 31 Mar 2020 17:19:44 -0400
X-MC-Unique: sTLJrjsjNxisw6-Pe_Ud6g-1
Received: by mail-ed1-f66.google.com with SMTP id cw6so26312213edb.9
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 14:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vyTO6009JTCfLd3UlfmmxMzroAfVBiq2wFtDZniOPoA=;
	b=qIXy/c8ECY1ejb5nfh0gs3DuWPltaB2RAvDjayvOYA6LHTG74SJJM6AUljA1NTCLKa
	RUbGBjPLook5zkV60kaPrbahOsWWYY2LJdfso0GDP8hUUsUuIMD+NDlfA6Nws9xHiq+T
	cojkKy0yk9ZtjzrgUlLagHXpBUoZ449Boj7q0/xog/jYLry1iLmXRKdnnQsuJPr+bp5w
	JvNXU7MElYRa7wvJzzcrF1Ke7gyrq2WL7jYHjm2pXsP7NaqMaijCRB2yyP/hUv+xakkx
	nmTTp+Oathvm/yD6evtiQCf20b2Noh4/wmXc9I9zrymottq59ug1fGpE0LkOw/Bsu+xF
	ldyg==
X-Gm-Message-State: ANhLgQ0S/zQ4QVIifaDnsorhULJ7vdGajuouXIXK7ty41jnUY3dsAcnC
	znN8r3wUjy9wPRDzMSeqEsUMBDtrfMJkfV5nmn/LRA==
X-Google-Smtp-Source: ADFU+vtABgQXb+2PEWx0hDcyeb3463r13Md1qzkMGG01QQesWZLScUbpHISBuKxebdal1y7UNBfkFGiG0aFoj641FX8=
X-Received: by 2002:a50:d847:: with SMTP id v7mr17832750edj.154.1585689583161; 
	Tue, 31 Mar 2020 14:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2003291625590.32108@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2003300729320.9938@file01.intranet.prod.int.rdu2.redhat.com>
	<CS1PR8401MB12377197482867F688BF93F7ABC80@CS1PR8401MB1237.NAMPRD84.PROD.OUTLOOK.COM>
	<alpine.LRH.2.02.2003310709090.2117@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2003310709090.2117@file01.intranet.prod.int.rdu2.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 31 Mar 2020 14:19:32 -0700
Message-ID: <CAPcyv4ijR185RLmtT+A+WZxJs309qPfdqj5eUDEkMgFbxsV+uw@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02VLJnL4025163
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Dave Jiang <dave.jiang@intel.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	Vishal Verma <vishal.l.verma@intel.com>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>, "Elliott,
	Robert \(Servers\)" <elliott@hpe.com>
Subject: Re: [dm-devel] [PATCH v2] memcpy_flushcache: use cache flusing for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[ add x86 and LKML ]

On Tue, Mar 31, 2020 at 5:27 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Tue, 31 Mar 2020, Elliott, Robert (Servers) wrote:
>
> >
> >
> > > -----Original Message-----
> > > From: Mikulas Patocka <mpatocka@redhat.com>
> > > Sent: Monday, March 30, 2020 6:32 AM
> > > To: Dan Williams <dan.j.williams@intel.com>; Vishal Verma
> > > <vishal.l.verma@intel.com>; Dave Jiang <dave.jiang@intel.com>; Ira
> > > Weiny <ira.weiny@intel.com>; Mike Snitzer <msnitzer@redhat.com>
> > > Cc: linux-nvdimm@lists.01.org; dm-devel@redhat.com
> > > Subject: [PATCH v2] memcpy_flushcache: use cache flusing for larger
> > > lengths
> > >
> > > I tested dm-writecache performance on a machine with Optane nvdimm
> > > and it turned out that for larger writes, cached stores + cache
> > > flushing perform better than non-temporal stores. This is the
> > > throughput of dm- writecache measured with this command:
> > > dd if=/dev/zero of=/dev/mapper/wc bs=64 oflag=direct
> > >
> > > block size  512             1024            2048            4096
> > > movnti      496 MB/s        642 MB/s        725 MB/s        744 MB/s
> > > clflushopt  373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s
> > >
> > > We can see that for smaller block, movnti performs better, but for
> > > larger blocks, clflushopt has better performance.
> >
> > There are other interactions to consider... see threads from the last
> > few years on the linux-nvdimm list.
>
> dm-writecache is the only linux driver that uses memcpy_flushcache on
> persistent memory. There is also the btt driver, it uses the "do_io"
> method to write to persistent memory and I don't know where this method
> comes from.
>
> Anyway, if patching memcpy_flushcache conflicts with something else, we
> should introduce memcpy_flushcache_to_pmem.
>
> > For example, software generally expects that read()s take a long time and
> > avoids re-reading from disk; the normal pattern is to hold the data in
> > memory and read it from there. By using normal stores, CPU caches end up
> > holding a bunch of persistent memory data that is probably not going to
> > be read again any time soon, bumping out more useful data. In contrast,
> > movnti avoids filling the CPU caches.
>
> But if I write one cacheline and flush it immediatelly, it would consume
> just one associative entry in the cache.
>
> > Another option is the AVX vmovntdq instruction (if available), the
> > most recent of which does 64-byte (cache line) sized transfers to
> > zmm registers. There's a hefty context switching overhead (e.g.,
> > 304 clocks), and the CPU often runs AVX instructions at a slower
> > clock frequency, so it's hard to judge when it's worthwhile.
>
> The benchmark shows that 64-byte non-temporal avx512 vmovntdq is as good
> as 8, 16 or 32-bytes writes.
>                                          ram            nvdimm
> sequential write-nt 4 bytes              4.1 GB/s       1.3 GB/s
> sequential write-nt 8 bytes              4.1 GB/s       1.3 GB/s
> sequential write-nt 16 bytes (sse)       4.1 GB/s       1.3 GB/s
> sequential write-nt 32 bytes (avx)       4.2 GB/s       1.3 GB/s
> sequential write-nt 64 bytes (avx512)    4.1 GB/s       1.3 GB/s
>
> With cached writes (where each cache line is immediatelly followed by clwb
> or clflushopt), 8, 16 or 32-byte write performs better than non-temporal
> stores and avx512 performs worse.
>
> sequential write 8 + clwb                5.1 GB/s       1.6 GB/s
> sequential write 16 (sse) + clwb         5.1 GB/s       1.6 GB/s
> sequential write 32 (avx) + clwb         4.4 GB/s       1.5 GB/s
> sequential write 64 (avx512) + clwb      1.7 GB/s       0.6 GB/s

This is indeed compelling straight-line data. My concern, similar to
Robert's, is what it does to the rest of the system. In addition to
increasing cache pollution, which I agree is difficult to quantify, it
may also increase read-for-ownership traffic. Could you collect 'perf
stat' for this clwb vs nt comparison to check if any of this
incidental overhead effect shows up in the numbers? Here is a 'perf
stat' line that might capture that.

perf stat -e L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-dcache-store-misses,L1-dcache-prefetch-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses,LLC-prefetch-misses
-r 5 $benchmark

In both cases nt and explicit clwb there's nothing that prevents the
dirty-cacheline, or the fill buffer from being written-back / flushed
before the full line is populated and maybe you are hitting that
scenario differently with the two approaches? I did not immediately
see a perf counter for events like this. Going forward I think this
gets better with the movdir64b instruction because that can guarantee
full-line-sized store-buffer writes.

Maybe the perf data can help make a decision about whether we go with
your patch in the near term?

>
>
> > In user space, glibc faces similar choices for its memcpy() functions;
> > glibc memcpy() uses non-temporal stores for transfers > 75% of the
> > L3 cache size divided by the number of cores. For example, with
> > glibc-2.216-16.fc27 (August 2017), on a Broadwell system with
> > E5-2699 36 cores 45 MiB L3 cache, non-temporal stores are used
> > for memcpy()s over 36 MiB.
>
> BTW. what does glibc do with reads? Does it flush them from the cache
> after they are consumed?
>
> AFAIK glibc doesn't support persistent memory - i.e. there is no function
> that flushes data and the user has to use inline assembly for that.

Yes, and I don't know of any copy routines that try to limit the cache
pollution of pulling the source data for a copy, only the destination.

> > It'd be nice if glibc, PMDK, and the kernel used the same algorithms.

Yes, it would. Although I think PMDK would make a different decision
than the kernel when optimizing for highest bandwidth for the local
application vs bandwidth efficiency across all applications.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

