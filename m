Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4169D20BD27
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 01:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593214396;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jcNfyXWw3t6S45QQBQaCuclJR1OPi9mOQogBSz5TyuU=;
	b=Tlk9LQ5xqk5rCrjtZPgVyiyLfNTpnxcJb3VcM5QG/09nHvutoqMocIvcOb8vFZX417uNh/
	pY0SQtddwxJ15HXxava5ZNQrXmIHq/zvpD4lcInQB1EYGJuvopbX+sjPESJYE8sFLdbx6m
	9I/kwF1v5h/sVegothLoZXZhz60emfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-rCk0aKZMOmuE9NVd9I-TzQ-1; Fri, 26 Jun 2020 19:33:13 -0400
X-MC-Unique: rCk0aKZMOmuE9NVd9I-TzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F6171800D4A;
	Fri, 26 Jun 2020 23:33:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB9782026;
	Fri, 26 Jun 2020 23:33:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 418B81809543;
	Fri, 26 Jun 2020 23:32:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QNWXcU023867 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 19:32:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 781102144B5A; Fri, 26 Jun 2020 23:32:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 738812144B58
	for <dm-devel@redhat.com>; Fri, 26 Jun 2020 23:32:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76FEB8007AC
	for <dm-devel@redhat.com>; Fri, 26 Jun 2020 23:32:31 +0000 (UTC)
Received: from mail108.syd.optusnet.com.au (mail108.syd.optusnet.com.au
	[211.29.132.59]) by relay.mimecast.com with ESMTP id
	us-mta-505-xuzsR5UkMTGA3stOm0mtww-1; Fri, 26 Jun 2020 19:32:27 -0400
X-MC-Unique: xuzsR5UkMTGA3stOm0mtww-1
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
	[49.180.53.24])
	by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id E630E1A8BB7;
	Sat, 27 Jun 2020 09:08:54 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1joxSh-0001Ar-Mw; Sat, 27 Jun 2020 09:08:47 +1000
Date: Sat, 27 Jun 2020 09:08:47 +1000
From: Dave Chinner <david@fromorbit.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200626230847.GI2005@dread.disaster.area>
References: <20200625113122.7540-1-willy@infradead.org>
	<alpine.LRH.2.02.2006261058250.11899@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006261058250.11899@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
	a=kj9zAlcOel0A:10 a=nTHF0DUjJn0A:10 a=7-415B0cAAAA:8
	a=FVrTFY9nI9_O9HWt5mYA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 26, 2020 at 11:02:19AM -0400, Mikulas Patocka wrote:
> Hi
> 
> I suggest to join memalloc_noio and memalloc_nofs into just one flag that 
> prevents both filesystem recursion and i/o recursion.
> 
> Note that any I/O can recurse into a filesystem via the loop device, thus 
> it doesn't make much sense to have a context where PF_MEMALLOC_NOFS is set 
> and PF_MEMALLOC_NOIO is not set.

Correct me if I'm wrong, but I think that will prevent swapping from
GFP_NOFS memory reclaim contexts. IOWs, this will substantially
change the behaviour of the memory reclaim system under sustained
GFP_NOFS memory pressure. Sustained GFP_NOFS memory pressure is
quite common, so I really don't think we want to telling memory
reclaim "you can't do IO at all" when all we are trying to do is
prevent recursion back into the same filesystem.

Given that the loop device IO path already operates under
memalloc_noio context, (i.e. the recursion restriction is applied in
only the context that needs is) I see no reason for making that a
global reclaim limitation....

In reality, we need to be moving the other way with GFP_NOFS - to
fine grained anti-recursion contexts, not more broad contexts.

That is, GFP_NOFS prevents recursion into any filesystem, not just
the one that we are actively operating on and needing to prevent
recursion back into. We can safely have reclaim do relcaim work on
other filesysetms without fear of recursion deadlocks, but the
memory reclaim infrastructure does not provide that capability.(*)

e.g. if memalloc_nofs_save() took a reclaim context structure that
the filesystem put the superblock, the superblock's nesting depth
(because layering on loop devices can create cross-filesystem
recursion dependencies), and any other filesyetm private data the
fs wanted to add, we could actually have reclaim only avoid reclaim
from filesytsems where there is a deadlock possiblity. e.g:

	- superblock nesting depth is different, apply GFP_NOFS
	  reclaim unconditionally
	- superblock different apply GFP_KERNEL reclaim
	- superblock the same, pass context to filesystem to
	  decide if reclaim from the sueprblock is safe.

At this point, we get memory reclaim able to always be able to
reclaim from filesystems that are not at risk of recursion
deadlocks. Direct reclaim is much more likely to be able to make
progress now because it is much less restricted in what it can
reclaim. That's going to make direct relcaim faster and more
efficient, and taht's the ultimate goal we are aiming to acheive
here...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

