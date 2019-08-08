Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F06E86567
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 17:15:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3C6330C2432;
	Thu,  8 Aug 2019 15:15:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DA9D1001B07;
	Thu,  8 Aug 2019 15:15:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB1051C8A;
	Thu,  8 Aug 2019 15:15:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78FDwQh028538 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 11:13:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A23868370; Thu,  8 Aug 2019 15:13:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86F145D9E1;
	Thu,  8 Aug 2019 15:13:51 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x78FDo4j019011; Thu, 8 Aug 2019 11:13:50 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x78FDoGF019007; Thu, 8 Aug 2019 11:13:50 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 8 Aug 2019 11:13:50 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Matthew Wilcox <willy@infradead.org>
In-Reply-To: <20190808135329.GG5482@bombadil.infradead.org>
Message-ID: <alpine.LRH.2.02.1908081112580.18950@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1908080540240.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190808135329.GG5482@bombadil.infradead.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, Mike Snitzer <msnitzer@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, junxiao.bi@oracle.com,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] direct-io: use GFP_NOIO to avoid deadlock
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 08 Aug 2019 15:15:16 +0000 (UTC)



On Thu, 8 Aug 2019, Matthew Wilcox wrote:

> On Thu, Aug 08, 2019 at 05:50:10AM -0400, Mikulas Patocka wrote:
> > A deadlock with this stacktrace was observed.
> > 
> > The obvious problem here is that in the call chain 
> > xfs_vm_direct_IO->__blockdev_direct_IO->do_blockdev_direct_IO->kmem_cache_alloc 
> > we do a GFP_KERNEL allocation while we are in a filesystem driver and in a 
> > block device driver.
> 
> But that's not the problem.  The problem is the loop driver calls into the
> filesystem without calling memalloc_noio_save() / memalloc_noio_restore().
> There are dozens of places in XFS which use GFP_KERNEL allocations and
> all can trigger this same problem if called from the loop driver.

OK. I'll send a new patch that sets PF_MEMALLOC_NOIO in the loop driver.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
