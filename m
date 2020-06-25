Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 290A020AE50
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159294;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ikaSg0crBKEqxYi/vB+zoR9aAv/6JRHxMi2LEsKWwrc=;
	b=SwlcNA0J6NTJwrSAbjKZrsm41NTbkEBuKhCpy9HcK5ItBnwLksz1oHW/lrvXFH3dyvIQTM
	qPpn2xe3pspKrZLlT24bPlLnATh+gg7A5TjVD2dHKlcOrLCmPABOSRqbBZLN568tpF/KB8
	CQQagiLMu7AuUH+CIEWeF2F4d1qAJFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-48Jhf1o1MbWzr3bDm9S7pA-1; Fri, 26 Jun 2020 04:14:27 -0400
X-MC-Unique: 48Jhf1o1MbWzr3bDm9S7pA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE927108597D;
	Fri, 26 Jun 2020 08:14:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7B25D9D3;
	Fri, 26 Jun 2020 08:14:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 508DD875B2;
	Fri, 26 Jun 2020 08:14:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PBmNrF022051 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 07:48:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B9702144B37; Thu, 25 Jun 2020 11:48:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 377B2201FCFD
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 261D3858EE2
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-IYTpO7s5NP6OQ5ukxT2P7Q-1; Thu, 25 Jun 2020 07:48:15 -0400
X-MC-Unique: IYTpO7s5NP6OQ5ukxT2P7Q-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joQ6W-0001zL-Ff; Thu, 25 Jun 2020 11:31:40 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Thu, 25 Jun 2020 12:31:16 +0100
Message-Id: <20200625113122.7540-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 0/6] Overhaul memalloc_no*
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I want a memalloc_nowait like we have memalloc_noio and memalloc_nofs
for an upcoming patch series, and Jens also wants it for non-blocking
io_uring.  It turns out we already have dm-bufio which could benefit
from memalloc_nowait, so it may as well go into the tree now.

The biggest problem is that we're basically out of PF_ flags, so we need
to find somewhere else to store the PF_MEMALLOC_NOWAIT flag.  It turns
out the PF_ flags are really supposed to be used for flags which are
accessed from other tasks, and the MEMALLOC flags are only going to
be used by this task.  So shuffling everything around frees up some PF
flags and generally makes the world a better place.

Patch series also available from
http://git.infradead.org/users/willy/linux.git/shortlog/refs/heads/memalloc

Matthew Wilcox (Oracle) (6):
  mm: Replace PF_MEMALLOC_NOIO with memalloc_noio
  mm: Add become_kswapd and restore_kswapd
  xfs: Convert to memalloc_nofs_save
  mm: Replace PF_MEMALLOC_NOFS with memalloc_nofs
  mm: Replace PF_MEMALLOC_NOIO with memalloc_nocma
  mm: Add memalloc_nowait

 drivers/block/loop.c           |  3 +-
 drivers/md/dm-bufio.c          | 30 ++++--------
 drivers/md/dm-zoned-metadata.c |  5 +-
 fs/iomap/buffered-io.c         |  2 +-
 fs/xfs/kmem.c                  |  2 +-
 fs/xfs/libxfs/xfs_btree.c      | 14 +++---
 fs/xfs/xfs_aops.c              |  4 +-
 fs/xfs/xfs_buf.c               |  2 +-
 fs/xfs/xfs_linux.h             |  6 ---
 fs/xfs/xfs_trans.c             | 14 +++---
 fs/xfs/xfs_trans.h             |  2 +-
 include/linux/sched.h          |  7 +--
 include/linux/sched/mm.h       | 84 ++++++++++++++++++++++++++--------
 kernel/sys.c                   |  8 ++--
 mm/vmscan.c                    | 16 +------
 15 files changed, 105 insertions(+), 94 deletions(-)

-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

