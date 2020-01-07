Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 535F913241C
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jan 2020 11:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578394081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6u7w1S2j68SplKHiJhIcikHa4NayUYQ2Zt8Xjc7o69Q=;
	b=WQ1TBUmwhguYe00QjjCKoa5GNueYlZmbJ+ofS8+6k18st4XLRhmxrhdU4GU/Zjt2dwVU6Y
	nlgrJVk7Yyf3K2nvCWn7CrHYaHtPlw5VgOUbCjm3gUAASdXLu48FHzjCBlQ0HHz4qEttr5
	uBKC8IMf70mJDW1a6J11G0PrTWWm5LE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-R0zj3scGNgiExiMI0cuxQQ-1; Tue, 07 Jan 2020 05:46:58 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE701801E72;
	Tue,  7 Jan 2020 10:46:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 595D91001902;
	Tue,  7 Jan 2020 10:46:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 518F281C68;
	Tue,  7 Jan 2020 10:46:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 007AkcLm015144 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 05:46:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 312AC60C88; Tue,  7 Jan 2020 10:46:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2B6060BE2;
	Tue,  7 Jan 2020 10:46:28 +0000 (UTC)
Date: Tue, 7 Jan 2020 10:46:27 +0000
From: Joe Thornber <thornber@redhat.com>
To: LVM2 development <lvm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	markus.schade@gmail.com, ejt@redhat.com, linux-block@vger.kernel.org,
	dm-devel@redhat.com, joe.thornber@gmail.com
Message-ID: <20200107104627.plviq37qhok2igt4@reti>
Mail-Followup-To: LVM2 development <lvm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, markus.schade@gmail.com,
	ejt@redhat.com, linux-block@vger.kernel.org, dm-devel@redhat.com,
	joe.thornber@gmail.com
References: <alpine.LRH.2.11.1909251814220.15810@mx.ewheeler.net>
	<alpine.LRH.2.11.1912201829300.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912270137420.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912271946380.26683@mx.ewheeler.net>
	<20200107103546.asf4tmlfdmk6xsub@reti>
MIME-Version: 1.0
In-Reply-To: <20200107103546.asf4tmlfdmk6xsub@reti>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [lvm-devel] kernel BUG at
 drivers/md/persistent-data/dm-space-map-disk.c:178
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: R0zj3scGNgiExiMI0cuxQQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 07, 2020 at 10:35:46AM +0000, Joe Thornber wrote:
> On Sat, Dec 28, 2019 at 02:13:07AM +0000, Eric Wheeler wrote:
> > On Fri, 27 Dec 2019, Eric Wheeler wrote:
> 
> > > Just hit the bug again without mq-scsi (scsi_mod.use_blk_mq=n), all other 
> > > times MQ has been turned on. 
> > > 
> > > I'm trying the -ENOSPC hack which will flag the pool as being out of space 
> > > so I can recover more gracefully than a BUG_ON. Here's a first-draft 
> > > patch, maybe the spinlock will even prevent the issue.
> > > 
> > > Compile tested, I'll try on a real system tomorrow.
> > > 
> > > Comments welcome:
> 
> Both sm_ll_find_free_block() and sm_ll_inc() can trigger synchronous IO.  So you
> absolutely cannot use a spin lock.
> 
> dm_pool_alloc_data_block() holds a big rw semaphore which should prevent anything
> else trying to allocate at the same time.

I suspect the problem is to do with the way we search for the new block in the 
space map for the previous transaction (sm->old_ll), and then increment in the current
transaction (sm->ll).

We keep old_ll around so we can ensure we never (re) allocate a block that's used in
the previous transaction.  This gives us our crash resistance, since if anything goes
wrong we effectively rollback to the previous transaction.

What I think we should be doing is running find_free on the old_ll, then double checking
it's not actually used in the current transaction.  ATM we're relying on smd->begin being
set properly everywhere, and I suspect this isn't the case.  A quick look shows sm_disk_inc_block()
doesn't adjust it.  sm_disk_inc_block() can be called when breaking sharing of a neighbouring entry
in a leaf btree node ... and we know you use snapshots very heavily.

I'll get a patch to you later today.

- Joe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

