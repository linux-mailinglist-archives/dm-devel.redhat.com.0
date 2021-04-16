Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80AF3362401
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 17:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618587203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x+IWNTPL7xefTkvQEz0oTqLrhDnZZu+giFKrYsdfmWs=;
	b=PG9cqlf/bHLlbsuFzLoJe/HBsDGDfKbuBW6wZBGX5zi2ci5dX2mdSJpYVr/08F4Ww9cZRG
	VZyT1Xkwt5U7iplRtNhDNcucAXuQ82fap3WljsWPJAO0WfRJP8YbMooWMfRTy/ojUj/xR3
	0ScKviITmBYL7TMrUoEAxIedUGYeT2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-1isjJIucNlm6qqXGZ53jtA-1; Fri, 16 Apr 2021 11:33:20 -0400
X-MC-Unique: 1isjJIucNlm6qqXGZ53jtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 703C987A826;
	Fri, 16 Apr 2021 15:33:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDB695D9C0;
	Fri, 16 Apr 2021 15:33:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C3C244A5E;
	Fri, 16 Apr 2021 15:33:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13GFX4K1008357 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Apr 2021 11:33:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 090985D74B; Fri, 16 Apr 2021 15:33:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9D25D749;
	Fri, 16 Apr 2021 15:33:00 +0000 (UTC)
Date: Fri, 16 Apr 2021 11:32:59 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20210416153259.GA20150@redhat.com>
References: <20210415231530.95464-1-snitzer@redhat.com>
	<20210415231530.95464-3-snitzer@redhat.com>
	<da184561-2c97-5807-5c5b-9cc6593693c6@suse.de>
	<20210416145340.GB16047@redhat.com>
	<3c5d6257-5f49-877e-91c2-c6d7687b002b@suse.de>
MIME-Version: 1.0
In-Reply-To: <3c5d6257-5f49-877e-91c2-c6d7687b002b@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Chao Leng <lengchao@huawei.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH v2 2/4] nvme: allow local retry for requests
 with REQ_FAILFAST_TRANSPORT set
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 16 2021 at 11:20am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> On 4/16/21 4:53 PM, Mike Snitzer wrote:
> > On Fri, Apr 16 2021 at 10:01am -0400,
> > Hannes Reinecke <hare@suse.de> wrote:
> > 
> >> On 4/16/21 1:15 AM, Mike Snitzer wrote:
> >>> From: Chao Leng <lengchao@huawei.com>
> >>>
> >>> REQ_FAILFAST_TRANSPORT was designed for SCSI, because the SCSI protocol
> >>> does not define the local retry mechanism. SCSI implements a fuzzy
> >>> local retry mechanism, so REQ_FAILFAST_TRANSPORT is needed to allow
> >>> higher-level multipathing software to perform failover/retry.
> >>>
> >>> NVMe is different with SCSI about this. It defines a local retry
> >>> mechanism and path error codes, so NVMe should retry local for non
> >>> path error. If path related error, whether to retry and how to retry
> >>> is still determined by higher-level multipathing's failover.
> >>>
> >>> Unlike SCSI, NVMe shouldn't prevent retry if REQ_FAILFAST_TRANSPORT
> >>> because NVMe's local retry is needed -- as is NVMe specific logic to
> >>> categorize whether an error is path related.
> >>>
> >>> In this way, the mechanism of NVMe multipath or other multipath are
> >>> now equivalent. The mechanism is: non path related error will be
> >>> retried locally, path related error is handled by multipath.
> >>>
> >>> Signed-off-by: Chao Leng <lengchao@huawei.com>
> >>> [snitzer: edited header for grammar and clarity, also added code comment]
> >>> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> >>> ---
> >>>  drivers/nvme/host/core.c | 9 ++++++++-
> >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> >>> index 540d6fd8ffef..4134cf3c7e48 100644
> >>> --- a/drivers/nvme/host/core.c
> >>> +++ b/drivers/nvme/host/core.c
> >>> @@ -306,7 +306,14 @@ static inline enum nvme_disposition nvme_decide_disposition(struct request *req)
> >>>  	if (likely(nvme_req(req)->status == 0))
> >>>  		return COMPLETE;
> >>>  
> >>> -	if (blk_noretry_request(req) ||
> >>> +	/*
> >>> +	 * REQ_FAILFAST_TRANSPORT is set by upper layer software that
> >>> +	 * handles multipathing. Unlike SCSI, NVMe's error handling was
> >>> +	 * specifically designed to handle local retry for non-path errors.
> >>> +	 * As such, allow NVMe's local retry mechanism to be used for
> >>> +	 * requests marked with REQ_FAILFAST_TRANSPORT.
> >>> +	 */
> >>> +	if ((req->cmd_flags & (REQ_FAILFAST_DEV | REQ_FAILFAST_DRIVER)) ||
> >>>  	    (nvme_req(req)->status & NVME_SC_DNR) ||
> >>>  	    nvme_req(req)->retries >= nvme_max_retries)
> >>>  		return COMPLETE;
> >>>
> >> Huh?
> >>
> >> #define blk_noretry_request(rq) \
> >>         ((rq)->cmd_flags & (REQ_FAILFAST_DEV|REQ_FAILFAST_TRANSPORT| \
> >>                              REQ_FAILFAST_DRIVER))
> >>
> >> making the only _actual_ change in your patch _not_ evaluating the
> >> REQ_FAILFAST_DRIVER, which incidentally is only used by the NVMe core.
> > 
> > No, not sure how you got there. I'd have thought the 5 references to
> > "REQ_FAILFAST_TRANSPORT" would've been sufficient ;)
> > 
> 
> Ah. Misread stuff. You're excluding the REQ_FAILFAST_TRANSPORT here.
> But then it's _actually_ similar to the next patch (which I've also
> commented).
> 
> Wouldn't it be better to fold them into one patch and discuss things
> together; especially as my comment to the next one might actually
> achieve the same thing?

2 discrete things. This patch enables local retry.
Patch 3 allows proper failover via upper layer multipathing.

And as I replied, your suggestion about using DNR doesn't achieve the
same thing (said as much in reply to the patch 3 thread).

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

