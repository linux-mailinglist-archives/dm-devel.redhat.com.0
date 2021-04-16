Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 94A5436232A
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 16:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618584855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x2jSI5oiLGpqp4b+E5DaGFcwPoKnKZUhXEvxfLeBGWQ=;
	b=NwuJvc/0iUDQJmznjGB8uogr1yKZx03gruBfrCjMXctBjfmXUOPNiZhavj6jNvX9wLlaMJ
	1jx7wVw7Turn0xrvoXxmBQERkd2dKA1r3oKl3X2kNSrqz9bOxqHz8UMcR33eXhwjxpNgyV
	X7g7szRe954INry7KyJ/4RkxBRJD9iQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-sliy-zuaMAqfWPgpZbTU1g-1; Fri, 16 Apr 2021 10:54:13 -0400
X-MC-Unique: sliy-zuaMAqfWPgpZbTU1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78A86107ACCA;
	Fri, 16 Apr 2021 14:54:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A580260C0F;
	Fri, 16 Apr 2021 14:54:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FC6544A5E;
	Fri, 16 Apr 2021 14:53:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13GErike004971 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Apr 2021 10:53:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8E8C5DDAD; Fri, 16 Apr 2021 14:53:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 274AE5D9C0;
	Fri, 16 Apr 2021 14:53:41 +0000 (UTC)
Date: Fri, 16 Apr 2021 10:53:40 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20210416145340.GB16047@redhat.com>
References: <20210415231530.95464-1-snitzer@redhat.com>
	<20210415231530.95464-3-snitzer@redhat.com>
	<da184561-2c97-5807-5c5b-9cc6593693c6@suse.de>
MIME-Version: 1.0
In-Reply-To: <da184561-2c97-5807-5c5b-9cc6593693c6@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 16 2021 at 10:01am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> On 4/16/21 1:15 AM, Mike Snitzer wrote:
> > From: Chao Leng <lengchao@huawei.com>
> > 
> > REQ_FAILFAST_TRANSPORT was designed for SCSI, because the SCSI protocol
> > does not define the local retry mechanism. SCSI implements a fuzzy
> > local retry mechanism, so REQ_FAILFAST_TRANSPORT is needed to allow
> > higher-level multipathing software to perform failover/retry.
> > 
> > NVMe is different with SCSI about this. It defines a local retry
> > mechanism and path error codes, so NVMe should retry local for non
> > path error. If path related error, whether to retry and how to retry
> > is still determined by higher-level multipathing's failover.
> > 
> > Unlike SCSI, NVMe shouldn't prevent retry if REQ_FAILFAST_TRANSPORT
> > because NVMe's local retry is needed -- as is NVMe specific logic to
> > categorize whether an error is path related.
> > 
> > In this way, the mechanism of NVMe multipath or other multipath are
> > now equivalent. The mechanism is: non path related error will be
> > retried locally, path related error is handled by multipath.
> > 
> > Signed-off-by: Chao Leng <lengchao@huawei.com>
> > [snitzer: edited header for grammar and clarity, also added code comment]
> > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > ---
> >  drivers/nvme/host/core.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index 540d6fd8ffef..4134cf3c7e48 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> > @@ -306,7 +306,14 @@ static inline enum nvme_disposition nvme_decide_disposition(struct request *req)
> >  	if (likely(nvme_req(req)->status == 0))
> >  		return COMPLETE;
> >  
> > -	if (blk_noretry_request(req) ||
> > +	/*
> > +	 * REQ_FAILFAST_TRANSPORT is set by upper layer software that
> > +	 * handles multipathing. Unlike SCSI, NVMe's error handling was
> > +	 * specifically designed to handle local retry for non-path errors.
> > +	 * As such, allow NVMe's local retry mechanism to be used for
> > +	 * requests marked with REQ_FAILFAST_TRANSPORT.
> > +	 */
> > +	if ((req->cmd_flags & (REQ_FAILFAST_DEV | REQ_FAILFAST_DRIVER)) ||
> >  	    (nvme_req(req)->status & NVME_SC_DNR) ||
> >  	    nvme_req(req)->retries >= nvme_max_retries)
> >  		return COMPLETE;
> > 
> Huh?
> 
> #define blk_noretry_request(rq) \
>         ((rq)->cmd_flags & (REQ_FAILFAST_DEV|REQ_FAILFAST_TRANSPORT| \
>                              REQ_FAILFAST_DRIVER))
> 
> making the only _actual_ change in your patch _not_ evaluating the
> REQ_FAILFAST_DRIVER, which incidentally is only used by the NVMe core.

No, not sure how you got there. I'd have thought the 5 references to
"REQ_FAILFAST_TRANSPORT" would've been sufficient ;)

This patch makes it so requests marked with REQ_FAILFAST_TRANSPORT are
allowed to use NVMe's local retry (that is required for non-transport
errors).

> So what is it you're trying to solve?

What the patch header, code and code comment detail.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

