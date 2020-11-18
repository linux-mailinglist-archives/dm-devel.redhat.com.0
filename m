Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 966562B8690
	for <lists+dm-devel@lfdr.de>; Wed, 18 Nov 2020 22:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605734724;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jDbbzROGVsnZGnk7ul/XPSID2XifFQYS+lDy8q6LIMA=;
	b=TgFu2vi3RNYKIEQh98DjVnk35E/QqXptnDYKnkU8VlRhMLXKlFGnR8TH/JVnuGD7IPF0gz
	BiaJVn4ax/mKQNLpo1zBjY5Aj/i+PTuYwOEZpoitW0cmpAZnoQAvRT6wR1f4HVLUi6GpHO
	DgbKkeazznBTXp7ZvfEpU/DSGmYvCLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-qYfAVwJ1Mm2zSafxm1izOA-1; Wed, 18 Nov 2020 16:25:22 -0500
X-MC-Unique: qYfAVwJ1Mm2zSafxm1izOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B10B108E1A8;
	Wed, 18 Nov 2020 21:25:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9154C1346E;
	Wed, 18 Nov 2020 21:25:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32C5518095C9;
	Wed, 18 Nov 2020 21:25:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AILOl68031838 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 16:24:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B91446064B; Wed, 18 Nov 2020 21:24:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16ACF1346F;
	Wed, 18 Nov 2020 21:24:40 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0AILOeFo017597; Wed, 18 Nov 2020 16:24:40 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0AILOcWa017593; Wed, 18 Nov 2020 16:24:38 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 18 Nov 2020 16:24:38 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20201118160748.GA754@redhat.com>
Message-ID: <alpine.LRH.2.02.2011181611470.16933@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201113225228.20563-1-rdunlap@infradead.org>
	<344abf76-9405-58ba-2dc4-27cab88c974d@de.ibm.com>
	<c29eeb5d-0683-49eb-f729-38b14fac7745@infradead.org>
	<20201117163147.GA27243@redhat.com>
	<20201118154944.GB545@redhat.com> <20201118160748.GA754@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] md: dm-writeback: add __noreturn to BUG-ging function
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 18 Nov 2020, Mike Snitzer wrote:

> On Wed, Nov 18 2020 at 10:49am -0500,
> Mike Snitzer <snitzer@redhat.com> wrote:
> 
> > I don't think my suggestion will help.. given it'd still leave
> > persistent_memory_claim() without a return statement.
> > 
> > Think it worthwhile to just add a dummy 'return 0;' after the BUG().
> 
> Decided to go with this, now staged for 5.11:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.11&id=a1e4865b4dda7071f3707f7e551289ead66e38b1

Hi

I would just use "return -EOPNOTSUPP;" and drop the "#ifdef 
DM_WRITECACHE_HAS_PMEM" that you added.

That BUG/return -EOPNOTSUPP code can't happen at all - if 
DM_WRITECACHE_HAS_PMEM is not defined, WC_MODE_PMEM(wc) always returns 
false - so persistent_memory_claim and BUG() can't ever be called. And if 
it can't be called, you don't need to add a code that prints an error in 
that case.

If we don't have DM_WRITECACHE_HAS_PMEM, the compiler optimizer will 
remove all the code guarded with if (WC_MODE_PMEM(wc)) as unreachable.

Mikulas


From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] dm writecache: remove BUG() and fail gracefully insteadfor-nextdm-5.11

Building on arch/s390/ results in this build error:

cc1: some warnings being treated as errors
../drivers/md/dm-writecache.c: In function 'persistent_memory_claim':
../drivers/md/dm-writecache.c:323:1: error: no return statement in function returning non-void [-Werror=return-type]

Fix this by replacing the BUG() with a -EOPNOTSUPP return.

Fixes: 48debafe4f2f ("dm: add writecache target")
Cc: stable@vger.kernel.org	# v4.18+
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c
+++ linux-2.6/drivers/md/dm-writecache.c
@@ -319,7 +319,7 @@ err1:
 #else
 static int persistent_memory_claim(struct dm_writecache *wc)
 {
-	BUG();
+	return -EOPNOTSUPP;
 }
 #endif
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

