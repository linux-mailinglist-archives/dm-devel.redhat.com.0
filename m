Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCC31323BF
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jan 2020 11:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578393395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=79rcyfK+vuVfiR/1Z04WWHxk08C5vEPl3c3Y9TtVrB8=;
	b=YIEYjAU4hoYYKzVoR7zMi3cUdzRVN/Fmk2XMoU/zuoDgpD1V6hqrUHgbWknP8oSTD5Z3ni
	07z2mTt+H1okay2nUDy3dEC98q04SDxqxH/qNdaB31eKGoAMe7MWcYAia+BO2Nek1Br7tg
	hiG4g496s4p+TqcOWtM8UCCr4Oyzi1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-uusdSJ2OOOSG1m8B6d5bTg-1; Tue, 07 Jan 2020 05:36:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 444B2593A4;
	Tue,  7 Jan 2020 10:36:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E08E85EF5;
	Tue,  7 Jan 2020 10:36:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6894081C86;
	Tue,  7 Jan 2020 10:36:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 007AZusT014469 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 05:35:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 79C357DB55; Tue,  7 Jan 2020 10:35:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43B6D1C4;
	Tue,  7 Jan 2020 10:35:46 +0000 (UTC)
Date: Tue, 7 Jan 2020 10:35:46 +0000
From: Joe Thornber <thornber@redhat.com>
To: LVM2 development <lvm-devel@redhat.com>
Message-ID: <20200107103546.asf4tmlfdmk6xsub@reti>
Mail-Followup-To: LVM2 development <lvm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, markus.schade@gmail.com,
	ejt@redhat.com, linux-block@vger.kernel.org, dm-devel@redhat.com,
	joe.thornber@gmail.com
References: <alpine.LRH.2.11.1909251814220.15810@mx.ewheeler.net>
	<alpine.LRH.2.11.1912201829300.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912270137420.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912271946380.26683@mx.ewheeler.net>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1912271946380.26683@mx.ewheeler.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, markus.schade@gmail.com,
	dm-devel@redhat.com, linux-block@vger.kernel.org, ejt@redhat.com,
	joe.thornber@gmail.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: uusdSJ2OOOSG1m8B6d5bTg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Dec 28, 2019 at 02:13:07AM +0000, Eric Wheeler wrote:
> On Fri, 27 Dec 2019, Eric Wheeler wrote:

> > Just hit the bug again without mq-scsi (scsi_mod.use_blk_mq=n), all other 
> > times MQ has been turned on. 
> > 
> > I'm trying the -ENOSPC hack which will flag the pool as being out of space 
> > so I can recover more gracefully than a BUG_ON. Here's a first-draft 
> > patch, maybe the spinlock will even prevent the issue.
> > 
> > Compile tested, I'll try on a real system tomorrow.
> > 
> > Comments welcome:

Both sm_ll_find_free_block() and sm_ll_inc() can trigger synchronous IO.  So you
absolutely cannot use a spin lock.

dm_pool_alloc_data_block() holds a big rw semaphore which should prevent anything
else trying to allocate at the same time.

- Joe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

