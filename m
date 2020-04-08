Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 53F3B1A2956
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 21:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586374196;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5xO89AuCDIf5uHih77E/QXblY2Tlxqoc8KLnyFbtnD4=;
	b=SUNwJlHul0k4QWXeh9M0emWRBgL67eJ6rElkFmZeJeTsG7WWSDzHuzcIPIIBkrFZS7kBYe
	mkD0gk4wVu54NYZbvgfyu2hWdVmEZ+ASLYUsFpOsHSMvCIsFZSAQuvV09EEBvilYToQ2ji
	QkMk+CRWFMVMq61rCtcAHW5vr5h0rug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-ICON_h-gOlWNFXUhqVjIZg-1; Wed, 08 Apr 2020 15:29:53 -0400
X-MC-Unique: ICON_h-gOlWNFXUhqVjIZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A7F48017F6;
	Wed,  8 Apr 2020 19:29:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0DD118F3E;
	Wed,  8 Apr 2020 19:29:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFB65182B00F;
	Wed,  8 Apr 2020 19:29:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 038JTYgY032421 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Apr 2020 15:29:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D08972166B34; Wed,  8 Apr 2020 19:29:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCDEB2166B31
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 19:29:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01C048FF663
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 19:29:33 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-4G0tJpoyPqi09rXkgzmjsQ-1; Wed, 08 Apr 2020 15:29:30 -0400
X-MC-Unique: 4G0tJpoyPqi09rXkgzmjsQ-1
Received: by mail-ed1-f67.google.com with SMTP id m12so10153762edl.12
	for <dm-devel@redhat.com>; Wed, 08 Apr 2020 12:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2I+dB0B50ThXp7siibS6X0DXKO49NnaL82k0TLoeWMY=;
	b=XuFUocoInVcZux31rCVqIbJy4sq7mFPb/6ZH511r2MuQyBsg2k6LjTQgKkstSThQf2
	96g7KEvPI85bWVmhJhDy1XMFow/xHBP86mQUUMpTJA56H2ofHzfcvH0lhFbIjc16ewcV
	psuTVN3lfy/JFk7Snnk67+8SHcemDJVvMBhedpJ0aJMQcPhke94Mk3mUozpcbMDDiZRv
	UmCkvwJRibZ/MMDhqcTDMLGsR8qAeUloXakJUN26AMV1o4vtP30ZXmJYas835gEF4jzl
	yDzGK+AHiCwDTwxFfHc4lxmW4Lwu4dgwpINenqKoN8ShaWaLy0KnC19bHmo7IeqDNnUP
	RpGA==
X-Gm-Message-State: AGi0PuYNk4UFL9f00n+STmy+2tMwyvwbzOKZO2rv1iE8Qz0sI914fO9E
	iXw7IcN6IdVNJhUl/loqwuZnNKhAgMJ9fUdolNtiLA==
X-Google-Smtp-Source: APiQypKh7MW2L6vpdFisNj8DwA8ikhEpPvrYzpnHu5MtT/bhd43a6I3U63RAoZ5wvMWEYIF3IRyyczq1bpXE+OzPmX4=
X-Received: by 2002:a17:906:6987:: with SMTP id
	i7mr8255013ejr.12.1586374169369; 
	Wed, 08 Apr 2020 12:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 8 Apr 2020 12:29:18 -0700
Message-ID: <CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 038JTYgY032421
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 8, 2020 at 11:54 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Tue, 7 Apr 2020, Dan Williams wrote:
>
> > On Tue, Apr 7, 2020 at 8:02 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > >
> > > [ resending this to x86 maintainers ]
> > >
> > > Hi
> > >
> > > I tested performance of various methods how to write to optane-based
> > > persistent memory, and found out that non-temporal stores achieve
> > > throughput 1.3 GB/s. 8 cached stores immediatelly followed by clflushopt
> > > or clwb achieve throughput 1.6 GB/s.
> > >
> > > memcpy_flushcache uses non-temporal stores, I modified it to use cached
> > > stores + clflushopt and it improved performance of the dm-writecache
> > > target significantly:
> > >
> > > dm-writecache throughput:
> > > (dd if=/dev/zero of=/dev/mapper/wc bs=64k oflag=direct)
> > > writecache block size   512             1024            2048            4096
> > > movnti                  496 MB/s        642 MB/s        725 MB/s        744 MB/s
> > > clflushopt              373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s
> > >
> > > For block size 512, movnti works better, for larger block sizes,
> > > clflushopt is better.
> >
> > This should use clwb instead of clflushopt, the clwb macri
> > automatically converts back to clflushopt if clwb is not supported.
>
> But we want to invalidate cache, we do not expect CPU to access these data
> anymore (it will be accessed by a DMA engine during writeback).

The cluflushopt and clwb instructions should have identical overhead,
but clwb wins on the rare chance the written data is needed again
soon. If it is never needed again then the cost of dropping a clean
cache line is the same as if the line was invalidated in the first
instance. In both cases (clflushopt and clwb) the snoop traffic
overhead is still paid whether the written-back line is still present
in the cache or not.

>
> > > I was also testing the novafs filesystem, it is not upstream, but it
> > > benefitted from similar change in __memcpy_flushcache and
> > > __copy_user_nocache:
> > > write throughput on big files - movnti: 662 MB/s, clwb: 1323 MB/s
> > > write throughput on small files - movnti: 621 MB/s, clwb: 1013 MB/s
> > >
> > >
> > > I submit this patch for __memcpy_flushcache that improves dm-writecache
> > > performance.
> > >
> > > Other ideas - should we introduce memcpy_to_pmem instead of modifying
> > > memcpy_flushcache and move this logic there? Or should I modify the
> > > dm-writecache target directly to use clflushopt with no change to the
> > > architecture-specific code?
> >
> > This also needs to mention your analysis that showed that this can
> > have negative cache pollution effects [1], so I'm not sure how to
> > decide when to make the tradeoff. Once we have movdir64b the tradeoff
> > equation changes yet again:
> >
> > [1]: https://lore.kernel.org/linux-nvdimm/alpine.LRH.2.02.2004010941310.23210@file01.intranet.prod.int.rdu2.redhat.com/
>
> I analyzed it some more. I have created this program that tests writecache
> w.r.t. cache pollution:
>
> http://people.redhat.com/~mpatocka/testcases/pmem/misc/l1-test-2.c
>
> It fills the cache with a chain of random pointers and then walks these
> pointers to evaluate cache pollution. Between the walks, it writes data to
> the dm-writecache target.
>
> With the original kernel, the result is:
> 8503 - 11366
> real    0m7.985s
> user    0m0.585s
> sys     0m7.390s
>
> With dm-writecache hacked to use cached writes + clflushopt:
> 8513 - 11379
> real    0m5.045s
> user    0m0.670s
> sys     0m4.365s
>
> So, the hacked dm-writecache is significantly faster, while the cache
> micro-benchmark doesn't show any more cache pollution.

Nice. These are now the pmem numbers, or dram? Otherwise, what changed
that was making nt-writes on pmem perform better compared to your
previous test? I'm just trying to track the results.

> That's for dm-writecache. Are there some other significant users of
> memcpy_flushcache that need to be checked?

The only other user is direct and dax-I/O to the pmem driver.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

