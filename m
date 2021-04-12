Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A42C35C57B
	for <lists+dm-devel@lfdr.de>; Mon, 12 Apr 2021 13:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618227777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F1oy0UNCd6bMdt+x/m93VDCX2UHzBdhBwAi3EsEOcio=;
	b=X3bptNKQm63q0nifMi8zNZbUTGiNAx+nRn2M3//OtyvqiPSmf2LL6iScqqWb4dyTBfIcnR
	juTbniFR5Tu2a3yMsZK+pQZdPdRosHyYH4vB6mhRqCfL7DS+ZWABExDDkSYEw0yMRPV9GD
	Q16kl/o3JRHCrjBHBj37xrzuzhBD0s0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-4ipGPVU8Mu2cgU1-zxdUcg-1; Mon, 12 Apr 2021 07:42:54 -0400
X-MC-Unique: 4ipGPVU8Mu2cgU1-zxdUcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28EB81084426;
	Mon, 12 Apr 2021 11:42:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86ED41037E81;
	Mon, 12 Apr 2021 11:42:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CBE485F2;
	Mon, 12 Apr 2021 11:42:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CBggIb006677 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 07:42:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4ECC01042AB0; Mon, 12 Apr 2021 11:42:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-111.pek2.redhat.com [10.72.12.111])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43FF6100AE4E;
	Mon, 12 Apr 2021 11:42:20 +0000 (UTC)
Date: Mon, 12 Apr 2021 19:42:17 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YHQyGVQb48g5rYsJ@T590>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-9-ming.lei@redhat.com>
	<20210412095427.GA987123@infradead.org> <YHQfB83n8dQSwD3O@T590>
	<20210412102947.GA998763@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210412102947.GA998763@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 12, 2021 at 11:29:47AM +0100, Christoph Hellwig wrote:
> On Mon, Apr 12, 2021 at 06:20:55PM +0800, Ming Lei wrote:
> > > > +static inline void *bio_grp_data(struct bio *bio)
> > > > +{
> > > > +	return bio->bi_poll;
> > > > +}
> > > 
> > > What is the purpose of this helper?  And why does it have to lose the
> > > type information?
> > 
> > This patch stores bio->bi_end_io(shared with ->bi_poll) into one per-task
> > data structure, and links all bios sharing same .bi_end_io into one list
> > via ->bi_end_io. And their ->bi_end_io is recovered before calling
> > bio_endio().
> > 
> > The helper is used for checking if one bio can be added to bio group,
> > and storing the data. The helper just serves for document purpose.
> > 
> > And the type info doesn't matter.
> 
> So why is bi_poll typed to start with then just to need a accessor
> to remove the typer information?

It should be a bug from the beginning, either .bi_poll can be dropped
or it should be 'void *'. Just find it, thanks for pointing it out.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

