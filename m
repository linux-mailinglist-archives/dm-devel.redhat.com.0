Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ED3A220B41E
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 17:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593183801;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=90G2hFlRLJCWwdGPZP2ZxOKWPUAmU+9HeaL456gBs5I=;
	b=Fd8YryJjR6jAbOqM/YlZAgtmSDB1gBpzvIsDxUI7TbF00GCglpKXVUo7SRTufQF66FHiIY
	8mA6bUtkceN72YKH7q67t8e9CJ5VjmTUcEEg8AzBZR1vIwzGpJah0p574P6JlxMIGm8vKq
	gj5r0JaTuSXfO/5k6hsRZfR5vNg1xqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-vp5Xk2ezMFCgrSKrptFn2g-1; Fri, 26 Jun 2020 11:03:18 -0400
X-MC-Unique: vp5Xk2ezMFCgrSKrptFn2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A84BA107ACF3;
	Fri, 26 Jun 2020 15:03:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13CC519C4F;
	Fri, 26 Jun 2020 15:03:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4823B180954D;
	Fri, 26 Jun 2020 15:02:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QF2QqT003236 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 11:02:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3CCF061984; Fri, 26 Jun 2020 15:02:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A9A60F8A;
	Fri, 26 Jun 2020 15:02:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05QF2MDr012492; Fri, 26 Jun 2020 11:02:22 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05QF2J5i012464; Fri, 26 Jun 2020 11:02:21 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 26 Jun 2020 11:02:19 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
In-Reply-To: <20200625113122.7540-1-willy@infradead.org>
Message-ID: <alpine.LRH.2.02.2006261058250.11899@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200625113122.7540-1-willy@infradead.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/6] Overhaul memalloc_no*
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I suggest to join memalloc_noio and memalloc_nofs into just one flag that 
prevents both filesystem recursion and i/o recursion.

Note that any I/O can recurse into a filesystem via the loop device, thus 
it doesn't make much sense to have a context where PF_MEMALLOC_NOFS is set 
and PF_MEMALLOC_NOIO is not set.

Mikulas

On Thu, 25 Jun 2020, Matthew Wilcox (Oracle) wrote:

> I want a memalloc_nowait like we have memalloc_noio and memalloc_nofs
> for an upcoming patch series, and Jens also wants it for non-blocking
> io_uring.  It turns out we already have dm-bufio which could benefit
> from memalloc_nowait, so it may as well go into the tree now.
> 
> The biggest problem is that we're basically out of PF_ flags, so we need
> to find somewhere else to store the PF_MEMALLOC_NOWAIT flag.  It turns
> out the PF_ flags are really supposed to be used for flags which are
> accessed from other tasks, and the MEMALLOC flags are only going to
> be used by this task.  So shuffling everything around frees up some PF
> flags and generally makes the world a better place.
> 
> Patch series also available from
> http://git.infradead.org/users/willy/linux.git/shortlog/refs/heads/memalloc
> 
> Matthew Wilcox (Oracle) (6):
>   mm: Replace PF_MEMALLOC_NOIO with memalloc_noio
>   mm: Add become_kswapd and restore_kswapd
>   xfs: Convert to memalloc_nofs_save
>   mm: Replace PF_MEMALLOC_NOFS with memalloc_nofs
>   mm: Replace PF_MEMALLOC_NOIO with memalloc_nocma
>   mm: Add memalloc_nowait
> 
>  drivers/block/loop.c           |  3 +-
>  drivers/md/dm-bufio.c          | 30 ++++--------
>  drivers/md/dm-zoned-metadata.c |  5 +-
>  fs/iomap/buffered-io.c         |  2 +-
>  fs/xfs/kmem.c                  |  2 +-
>  fs/xfs/libxfs/xfs_btree.c      | 14 +++---
>  fs/xfs/xfs_aops.c              |  4 +-
>  fs/xfs/xfs_buf.c               |  2 +-
>  fs/xfs/xfs_linux.h             |  6 ---
>  fs/xfs/xfs_trans.c             | 14 +++---
>  fs/xfs/xfs_trans.h             |  2 +-
>  include/linux/sched.h          |  7 +--
>  include/linux/sched/mm.h       | 84 ++++++++++++++++++++++++++--------
>  kernel/sys.c                   |  8 ++--
>  mm/vmscan.c                    | 16 +------
>  15 files changed, 105 insertions(+), 94 deletions(-)
> 
> -- 
> 2.27.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

