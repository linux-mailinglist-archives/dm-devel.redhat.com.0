Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 58CA232D067
	for <lists+dm-devel@lfdr.de>; Thu,  4 Mar 2021 11:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614852603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u+vLhO4hdLVLRJzzYGO+4alsuyNjxSIF+ZpPR9A4g9k=;
	b=PvFEHfWoRkX6+ICmhqF8UawE1Wj/ASptODCNtep8t4CMdHO7PRwnr2ata6WPo8qE+uJDS6
	3XPcro+nWCLUw3cwo7B+5zdKC8oKT3r7s044CGrgC3gCiQsWbDTyqMAZ03dEkUGoQUn90X
	l/faPWBe1LOkhSYrbZHOQPnsFBovtQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-pfLFdy1RPkOBymactDpA6g-1; Thu, 04 Mar 2021 05:09:59 -0500
X-MC-Unique: pfLFdy1RPkOBymactDpA6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1361B1842145;
	Thu,  4 Mar 2021 10:09:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43FF539A71;
	Thu,  4 Mar 2021 10:09:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F2644A714;
	Thu,  4 Mar 2021 10:09:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 124A9Tkf013468 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Mar 2021 05:09:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F120310023AF; Thu,  4 Mar 2021 10:09:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47364100E114;
	Thu,  4 Mar 2021 10:09:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 124A9PQ9007649; Thu, 4 Mar 2021 05:09:25 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 124A9Oo8007645; Thu, 4 Mar 2021 05:09:25 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 4 Mar 2021 05:09:24 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <f9dd41f1-7a4c-5901-c099-dca08c4e6d65@linux.alibaba.com>
Message-ID: <alpine.LRH.2.02.2103040507040.7400@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210302190555.201228400@debian-a64.vm>
	<33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
	<alpine.LRH.2.02.2103030505460.29593@file01.intranet.prod.int.rdu2.redhat.com>
	<f9dd41f1-7a4c-5901-c099-dca08c4e6d65@linux.alibaba.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Mike Snitzer <msnitzer@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, caspar@linux.alibaba.com,
	hch@lst.de, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/4] dm: support I/O polling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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



On Thu, 4 Mar 2021, JeffleXu wrote:

> > __split_and_process_non_flush records the poll cookie in ci.poll_cookie. 
> > When we processed all the bios, we poll for the last cookie here:
> > 
> >         if (ci.poll_cookie != BLK_QC_T_NONE) {
> >                 while (atomic_read(&ci.io->io_count) > 1 &&
> >                        blk_poll(ci.poll_queue, ci.poll_cookie, true)) ;
> >         }
> 
> So what will happen if one bio submitted to dm device crosses the device
> boundary among several target devices (e.g., dm-stripe)? Please refer
> the following call graph.
> 
> ```
> submit_bio
>   __submit_bio_noacct
>     disk->fops->submit_bio(), calling into __split_and_process_bio(),
> call __split_and_process_non_flush() once, submitting the *first* split bio
>     disk->fops->submit_bio(), calling into __split_and_process_bio(),
> call __split_and_process_non_flush() once, submitting the *second* split bio
>     ...
> ```
> 
> 
> So the loop is in __submit_bio_noacct(), rather than
> __split_and_process_bio(). Your design will send the first split bio,
> and then poll on this split bio, then send the next split bio, polling
> on this, go on and on...

No. It will send all the bios and poll for the last one.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

