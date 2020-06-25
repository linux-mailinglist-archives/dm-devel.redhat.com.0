Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DD62320AA25
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 03:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593134931;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YPgNfREo1bE9IozsgPD0qzmvNZ1qjKYUzKZegTuBzEY=;
	b=L9+ZNjZlIhwYPF0I+6/VOF0IIdp+l8YNsuj+B8HHJknJDQt4P1nu1VWLGPXTNMmJdHMftr
	+lZGWno5m3ff4bF6Mp4ZgFt37ZM9xmRA008nh04oCqycVi+EBzd2xFIGUKVVTyDHTT6Kr8
	mErYGbJ28DlWWxSwSgAnwT+fn1/cRxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-jwnhMK8pP7iahBTgQzK6_A-1; Thu, 25 Jun 2020 21:28:48 -0400
X-MC-Unique: jwnhMK8pP7iahBTgQzK6_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9300C800C64;
	Fri, 26 Jun 2020 01:28:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0677917C0F;
	Fri, 26 Jun 2020 01:28:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBD6A8759D;
	Fri, 26 Jun 2020 01:28:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05Q1SApT009869 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 21:28:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B22072144B39; Fri, 26 Jun 2020 01:28:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD9662144B37
	for <dm-devel@redhat.com>; Fri, 26 Jun 2020 01:28:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA3718007AC
	for <dm-devel@redhat.com>; Fri, 26 Jun 2020 01:28:08 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-191-3YtYqIRAPUaTEyfxQ-pB1g-1; Thu, 25 Jun 2020 21:28:03 -0400
X-MC-Unique: 3YtYqIRAPUaTEyfxQ-pB1g-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	05PIftsV071319; Thu, 25 Jun 2020 18:50:37 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 31uustt77f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 25 Jun 2020 18:50:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	05PIi0fM071227; Thu, 25 Jun 2020 18:48:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 31uur1n5ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2020 18:48:36 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05PImYeM018585;
	Thu, 25 Jun 2020 18:48:34 GMT
Received: from localhost (/10.159.246.176)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 25 Jun 2020 18:48:34 +0000
Date: Thu, 25 Jun 2020 11:48:32 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20200625184832.GP7606@magnolia>
References: <20200625113122.7540-1-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625113122.7540-1-willy@infradead.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	mlxlogscore=999
	adultscore=0 mlxscore=0 suspectscore=2 malwarescore=0 phishscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2006250112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	mlxlogscore=999
	cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
	suspectscore=2 priorityscore=1501 lowpriorityscore=0 clxscore=1011
	impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006250112
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Yafang Shao <laoar.shao@gmail.com>,
	Mikulas Patocka <mpatocka@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 25, 2020 at 12:31:16PM +0100, Matthew Wilcox (Oracle) wrote:
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

So, uh, how does this intersect with the patch "xfs: reintroduce
PF_FSTRANS for transaction reservation recursion protection" that
re-adds PF_TRANS because uh I guess we lost some subtlety or another at
some point?

I don't have any strong opinion on this series one way or another, but
seeing as that patch was generating discussion about how PF_MEMALLOC_NO*
is not quite the same as PF_TRANS, I kinda want all these competing PF
tweaks and reworks to come together into a single series to review,
rather than the four(?) different people submitting conflicting changes.

[adding Yafang Shao to cc]

--D

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

