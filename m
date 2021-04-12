Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F28AB35C38F
	for <lists+dm-devel@lfdr.de>; Mon, 12 Apr 2021 12:17:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-_-xVcPztNOul3pcLZNpOqw-1; Mon, 12 Apr 2021 06:17:52 -0400
X-MC-Unique: _-xVcPztNOul3pcLZNpOqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 178801898283;
	Mon, 12 Apr 2021 10:17:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC6C5C559;
	Mon, 12 Apr 2021 10:17:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C4AF44A59;
	Mon, 12 Apr 2021 10:17:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CAH9UY029899 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 06:17:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8C302138BB3; Mon, 12 Apr 2021 10:17:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D314B2138BB2
	for <dm-devel@redhat.com>; Mon, 12 Apr 2021 10:17:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75252811E7F
	for <dm-devel@redhat.com>; Mon, 12 Apr 2021 10:17:07 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-314-VNVi6GZBMiqORxIizNplaA-1; Mon, 12 Apr 2021 06:17:03 -0400
X-MC-Unique: VNVi6GZBMiqORxIizNplaA-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lVtcp-004AsT-ID; Mon, 12 Apr 2021 10:17:00 +0000
Date: Mon, 12 Apr 2021 11:16:59 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20210412101659.GA993044@infradead.org>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-9-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401021927.343727-9-ming.lei@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: Re: [dm-devel] [PATCH V5 08/12] block: use per-task poll context to
 implement bio based io polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> +static int blk_bio_poll_io(struct io_context *submit_ioc,
> +		struct io_context *poll_ioc)

Givem that poll_ioc is always current->io_context there is no
need to pass it.

> +	struct blk_bio_poll_ctx *poll_ctx = poll_ioc ?
> +		poll_ioc->data : NULL;

and it really should not be NULL here, should it?

> +static int __blk_bio_poll(blk_qc_t cookie)
> +{
> +	struct io_context *poll_ioc = current->io_context;
> +	pid_t pid;
> +	struct task_struct *submit_task;
> +	int ret;
> +
> +	pid = (pid_t)cookie;
> +
> +	/* io poll often share io submission context */
> +	if (likely(current->pid == pid && blk_bio_ioc_valid(current)))
> +		return blk_bio_poll_io(poll_ioc, poll_ioc);
> +
> +	submit_task = find_get_task_by_vpid(pid);
> +	if (likely(blk_bio_ioc_valid(submit_task)))
> +		ret = blk_bio_poll_io(submit_task->io_context, poll_ioc);
> +	else
> +		ret = 0;
> +	if (likely(submit_task))
> +		put_task_struct(submit_task);

Wouldn't it make more sense to just store the submitting context
in the bio, even if that uses more space?  Having to call
find_get_task_by_vpid in the poll context seems rather problematic.

Note that this requires doing the refacoring to get rid of the separate
blk_qc_t passed up the stack I asked for earlier, but hiding all these
details seems like a really useful change anyway.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

