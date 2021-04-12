Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BC91235C426
	for <lists+dm-devel@lfdr.de>; Mon, 12 Apr 2021 12:38:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618223919;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MTYXu8LTWJmDkpLdHdxxlwGGVmiog3yF3pr7TGID6j4=;
	b=dhzp3qXfwhOHIlmnk+evK6Aej7n6U6T9rPFiAfSUK1lWJ2x3Hy8Nq0RB4ZRkQ+cGLt5NPw
	11KAeTgyu8qmIvfeJNG+3nPA0QVCerJj1AbTnOeGXQ6xpd1MFeZr3kztpK3BLV8CNpDaPG
	dSox4OcDmlItRGPK/5YmL++3dRrdPg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-qv86hgQ_O-KOIsndEjLqfQ-1; Mon, 12 Apr 2021 06:38:37 -0400
X-MC-Unique: qv86hgQ_O-KOIsndEjLqfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82CE6107ACCA;
	Mon, 12 Apr 2021 10:38:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC1855D6DC;
	Mon, 12 Apr 2021 10:38:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89F1B44A5A;
	Mon, 12 Apr 2021 10:38:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CAbsZj032460 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 06:37:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A3C5646D6; Mon, 12 Apr 2021 10:37:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-111.pek2.redhat.com [10.72.12.111])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 127776A04E;
	Mon, 12 Apr 2021 10:37:38 +0000 (UTC)
Date: Mon, 12 Apr 2021 18:37:34 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YHQi7rZ5StWUpX/r@T590>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-9-ming.lei@redhat.com>
	<20210412101659.GA993044@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210412101659.GA993044@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 12, 2021 at 11:16:59AM +0100, Christoph Hellwig wrote:
> > +static int blk_bio_poll_io(struct io_context *submit_ioc,
> > +		struct io_context *poll_ioc)
> 
> Givem that poll_ioc is always current->io_context there is no
> need to pass it.

Yeah, it is true.

> 
> > +	struct blk_bio_poll_ctx *poll_ctx = poll_ioc ?
> > +		poll_ioc->data : NULL;
> 
> and it really should not be NULL here, should it?

Yeah, it is NULL just in case of memory allocation failure.

> 
> > +static int __blk_bio_poll(blk_qc_t cookie)
> > +{
> > +	struct io_context *poll_ioc = current->io_context;
> > +	pid_t pid;
> > +	struct task_struct *submit_task;
> > +	int ret;
> > +
> > +	pid = (pid_t)cookie;
> > +
> > +	/* io poll often share io submission context */
> > +	if (likely(current->pid == pid && blk_bio_ioc_valid(current)))
> > +		return blk_bio_poll_io(poll_ioc, poll_ioc);
> > +
> > +	submit_task = find_get_task_by_vpid(pid);
> > +	if (likely(blk_bio_ioc_valid(submit_task)))
> > +		ret = blk_bio_poll_io(submit_task->io_context, poll_ioc);
> > +	else
> > +		ret = 0;
> > +	if (likely(submit_task))
> > +		put_task_struct(submit_task);
> 
> Wouldn't it make more sense to just store the submitting context
> in the bio, even if that uses more space?  Having to call

But where to store the submitting context in bio? pid is 32bit and we can
pass it from submit_bio() perfectly, then avoid to add anything to bio.

If we save the submitting context in bio, we still have to handle task
exit related race, not see any benefit.

So far bio is ~128byte with typical setting, and people usually hate to
add more stuff into bio.

> find_get_task_by_vpid in the poll context seems rather problematic.

Why? We already handle submit context early exit.

> 
> Note that this requires doing the refacoring to get rid of the separate
> blk_qc_t passed up the stack I asked for earlier, but hiding all these
> details seems like a really useful change anyway.

That is hard to do because of race between submission and completion:

1) HIPRI could be cleared because of bio splitting, so we can't do that
for this kind of bio

2) we have to make sure that the bio won't be completed when storing
cookie into this bio. BIO_END_BY_POLL is added in this patch for bio
based polling. You mean we may cover all normal blk-mq polling via
BIO_END_BY_POLL?



Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

