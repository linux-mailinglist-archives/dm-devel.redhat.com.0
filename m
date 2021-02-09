Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DEB753146D3
	for <lists+dm-devel@lfdr.de>; Tue,  9 Feb 2021 04:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612840339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ESvelFJRnlm27Q4lgzc9Xw8t2qCVQ2IJGiZWl5h/clc=;
	b=JZXphz6KmtosEMyAhD5f7MFLVAFfcO/Rwa9nfdy2M2y54hCHZodb5w/ic+455H/k67dcXd
	qCID6zlGuXGKOj6fUpVRg3gPUX3D555bKSCtzcoocPiLa0zy0Khou8UfeaBCsQM1S2/ejN
	cfEpCLpe79JY4YRTpt59zJ3PxqpwvJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-tYLG4SX9N-WH1hTiZW9xdw-1; Mon, 08 Feb 2021 22:12:16 -0500
X-MC-Unique: tYLG4SX9N-WH1hTiZW9xdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7999192D787;
	Tue,  9 Feb 2021 03:12:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C041001901;
	Tue,  9 Feb 2021 03:12:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D28D04E58D;
	Tue,  9 Feb 2021 03:11:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1193Be63013572 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Feb 2021 22:11:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C0935D6D7; Tue,  9 Feb 2021 03:11:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-86.pek2.redhat.com [10.72.13.86])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45B205D6A8;
	Tue,  9 Feb 2021 03:11:26 +0000 (UTC)
Date: Tue, 9 Feb 2021 11:11:22 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20210209031122.GA63798@T590>
References: <20210208085243.82367-1-jefflexu@linux.alibaba.com>
	<20210208085243.82367-10-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20210208085243.82367-10-jefflexu@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, snitzer@redhat.com, caspar@linux.alibaba.com,
	io-uring@vger.kernel.org, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com, hch@lst.de
Subject: Re: [dm-devel] [PATCH v3 09/11] dm: support IO polling for
	bio-based dm device
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 08, 2021 at 04:52:41PM +0800, Jeffle Xu wrote:
> DM will iterate and poll all polling hardware queues of all target mq
> devices when polling IO for dm device. To mitigate the race introduced
> by iterating all target hw queues, a per-hw-queue flag is maintained

What is the per-hw-queue flag?

> to indicate whether this polling hw queue currently being polled on or
> not. Every polling hw queue is exclusive to one polling instance, i.e.,
> the polling instance will skip this polling hw queue if this hw queue
> currently is being polled by another polling instance, and start
> polling on the next hw queue.

Not see such skip in dm_poll_one_dev() in which
queue_for_each_poll_hw_ctx() is called directly for polling all POLL
hctxs of the request queue, so can you explain it a bit more about this
skip mechanism?

Even though such skipping is implemented, not sure if good performance
can be reached because hctx poll may be done in ping-pong style
among several CPUs. But blk-mq hctx is supposed to have its cpu affinities.

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

