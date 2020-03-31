Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C4A801995E4
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 14:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585656069;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I7XzUgCacyEhbCZzEAl7HXxmIlEXr6dnFjfUf1lEM5M=;
	b=VGFRikXNwhh6GttS421atXqs7LJNHaxJHIJwZNWuXyFipxG/dkzqoaknnXgTFv3vcY0f2V
	Xdne0ggZPNPFKbFmXm/3kiR+CdvT39VEhXo2lgXFmwaq33EuRocAvrNwPFKgr/CwrVYha4
	yWNmqFI6uLkHU86zcM5hpalXUpFil6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-8UBZKQSKMQa3tQpWY62aqg-1; Tue, 31 Mar 2020 08:01:06 -0400
X-MC-Unique: 8UBZKQSKMQa3tQpWY62aqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8036B10883AC;
	Tue, 31 Mar 2020 12:00:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D66FAD769D;
	Tue, 31 Mar 2020 12:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AAA8969AC;
	Tue, 31 Mar 2020 12:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VC0S2w001481 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 08:00:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7DE1F5C1D8; Tue, 31 Mar 2020 12:00:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E7495C240;
	Tue, 31 Mar 2020 12:00:18 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 02VBxktS017612; Tue, 31 Mar 2020 07:59:46 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 02VBwYXk017547; Tue, 31 Mar 2020 07:58:58 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 31 Mar 2020 07:58:34 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: "Elliott, Robert (Servers)" <elliott@hpe.com>
In-Reply-To: <CS1PR8401MB12377197482867F688BF93F7ABC80@CS1PR8401MB1237.NAMPRD84.PROD.OUTLOOK.COM>
Message-ID: <alpine.LRH.2.02.2003310709090.2117@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2003291625590.32108@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2003300729320.9938@file01.intranet.prod.int.rdu2.redhat.com>
	<CS1PR8401MB12377197482867F688BF93F7ABC80@CS1PR8401MB1237.NAMPRD84.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Dave Jiang <dave.jiang@intel.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 31 Mar 2020, Elliott, Robert (Servers) wrote:

> 
> 
> > -----Original Message-----
> > From: Mikulas Patocka <mpatocka@redhat.com>
> > Sent: Monday, March 30, 2020 6:32 AM
> > To: Dan Williams <dan.j.williams@intel.com>; Vishal Verma
> > <vishal.l.verma@intel.com>; Dave Jiang <dave.jiang@intel.com>; Ira
> > Weiny <ira.weiny@intel.com>; Mike Snitzer <msnitzer@redhat.com>
> > Cc: linux-nvdimm@lists.01.org; dm-devel@redhat.com
> > Subject: [PATCH v2] memcpy_flushcache: use cache flusing for larger
> > lengths
> > 
> > I tested dm-writecache performance on a machine with Optane nvdimm
> > and it turned out that for larger writes, cached stores + cache
> > flushing perform better than non-temporal stores. This is the
> > throughput of dm- writecache measured with this command:
> > dd if=/dev/zero of=/dev/mapper/wc bs=64 oflag=direct
> > 
> > block size	512		1024		2048		4096
> > movnti	496 MB/s	642 MB/s	725 MB/s	744 MB/s
> > clflushopt	373 MB/s	688 MB/s	1.1 GB/s	1.2 GB/s
> > 
> > We can see that for smaller block, movnti performs better, but for
> > larger blocks, clflushopt has better performance.
> 
> There are other interactions to consider... see threads from the last
> few years on the linux-nvdimm list.

dm-writecache is the only linux driver that uses memcpy_flushcache on 
persistent memory. There is also the btt driver, it uses the "do_io" 
method to write to persistent memory and I don't know where this method 
comes from.

Anyway, if patching memcpy_flushcache conflicts with something else, we 
should introduce memcpy_flushcache_to_pmem.

> For example, software generally expects that read()s take a long time and
> avoids re-reading from disk; the normal pattern is to hold the data in
> memory and read it from there. By using normal stores, CPU caches end up
> holding a bunch of persistent memory data that is probably not going to
> be read again any time soon, bumping out more useful data. In contrast,
> movnti avoids filling the CPU caches.

But if I write one cacheline and flush it immediatelly, it would consume 
just one associative entry in the cache.

> Another option is the AVX vmovntdq instruction (if available), the
> most recent of which does 64-byte (cache line) sized transfers to
> zmm registers. There's a hefty context switching overhead (e.g.,
> 304 clocks), and the CPU often runs AVX instructions at a slower
> clock frequency, so it's hard to judge when it's worthwhile.

The benchmark shows that 64-byte non-temporal avx512 vmovntdq is as good 
as 8, 16 or 32-bytes writes.
                                         ram            nvdimm
sequential write-nt 4 bytes              4.1 GB/s       1.3 GB/s
sequential write-nt 8 bytes              4.1 GB/s       1.3 GB/s
sequential write-nt 16 bytes (sse)       4.1 GB/s       1.3 GB/s
sequential write-nt 32 bytes (avx)       4.2 GB/s       1.3 GB/s
sequential write-nt 64 bytes (avx512)    4.1 GB/s       1.3 GB/s

With cached writes (where each cache line is immediatelly followed by clwb 
or clflushopt), 8, 16 or 32-byte write performs better than non-temporal 
stores and avx512 performs worse.

sequential write 8 + clwb                5.1 GB/s       1.6 GB/s
sequential write 16 (sse) + clwb         5.1 GB/s       1.6 GB/s
sequential write 32 (avx) + clwb         4.4 GB/s       1.5 GB/s
sequential write 64 (avx512) + clwb      1.7 GB/s       0.6 GB/s


> In user space, glibc faces similar choices for its memcpy() functions;
> glibc memcpy() uses non-temporal stores for transfers > 75% of the
> L3 cache size divided by the number of cores. For example, with
> glibc-2.216-16.fc27 (August 2017), on a Broadwell system with
> E5-2699 36 cores 45 MiB L3 cache, non-temporal stores are used
> for memcpy()s over 36 MiB.

BTW. what does glibc do with reads? Does it flush them from the cache 
after they are consumed?

AFAIK glibc doesn't support persistent memory - i.e. there is no function 
that flushes data and the user has to use inline assembly for that.

> It'd be nice if glibc, PMDK, and the kernel used the same algorithms.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

