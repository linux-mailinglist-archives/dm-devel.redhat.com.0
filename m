Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 883D233F3C3
	for <lists+dm-devel@lfdr.de>; Wed, 17 Mar 2021 15:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615993138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fei8pvtwZ6QjoURluZJcKsYuHqxDJjaNMHhNTJyExKs=;
	b=azoh8gaLVSgJXj2NOttDeLq02qMh338x5oPEmcAqb1Ew4CAmRLLBTZ5QdgDMLBIhq9cjFP
	tk5x2q82ii7u7g6ladopDnlJ7nSJGokuKeugPdQdtFjsqncYa8lv/4PM2IxtQYqPNygwPk
	0wCcqMh3NX4UrNzJRdx5jvC5aXW5LXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-RbOuGZiDPtezlLABlRNymg-1; Wed, 17 Mar 2021 10:58:55 -0400
X-MC-Unique: RbOuGZiDPtezlLABlRNymg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AC9B910E3;
	Wed, 17 Mar 2021 14:58:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 929196E50A;
	Wed, 17 Mar 2021 14:58:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A99A74BB7C;
	Wed, 17 Mar 2021 14:58:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12HEwTbs019038 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Mar 2021 10:58:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 963CF2B18E; Wed, 17 Mar 2021 14:58:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5371737DD;
	Wed, 17 Mar 2021 14:58:23 +0000 (UTC)
Date: Wed, 17 Mar 2021 10:58:22 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20210317145822.GA29481@redhat.com>
References: <1615563895-28565-1-git-send-email-sergei.shtepa@veeam.com>
	<1615563895-28565-3-git-send-email-sergei.shtepa@veeam.com>
	<YFBnypYemiR08A/c@T590> <20210316163544.GA31272@veeam.com>
	<YFFxdz84esfiTvNk@T590>
MIME-Version: 1.0
In-Reply-To: <YFFxdz84esfiTvNk@T590>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	Pavel Tide <Pavel.TIde@veeam.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Sergei Shtepa <sergei.shtepa@veeam.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v7 2/3] block: add bdev_interposer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 16 2021 at 11:03pm -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> On Tue, Mar 16, 2021 at 07:35:44PM +0300, Sergei Shtepa wrote:
> > The 03/16/2021 11:09, Ming Lei wrote:
> > > On Fri, Mar 12, 2021 at 06:44:54PM +0300, Sergei Shtepa wrote:
> > > > bdev_interposer allows to redirect bio requests to another devices.
> > > > 
> > > > Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>

...

> > > > +
> > > > +int bdev_interposer_attach(struct block_device *original,
> > > > +			   struct block_device *interposer)
> > > > +{
> > > > +	int ret = 0;
> > > > +
> > > > +	if (WARN_ON(((!original) || (!interposer))))
> > > > +		return -EINVAL;
> > > > +	/*
> > > > +	 * interposer should be simple, no a multi-queue device
> > > > +	 */
> > > > +	if (!interposer->bd_disk->fops->submit_bio)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (WARN_ON(!blk_mq_is_queue_frozen(original->bd_disk->queue)))
> > > > +		return -EPERM;
> > > 
> > > The original request queue may become live now...
> > 
> > Yes.
> > I will remove the blk_mq_is_queue_frozen() function and use a different
> > approach.
> 
> Looks what attach and detach needs is that queue is kept as frozen state
> instead of being froze simply at the beginning of the two functions, so
> you can simply call freeze/unfreeze inside the two functions.
> 
> But what if 'original' isn't a MQ queue?  queue usage counter is just
> grabed when calling ->submit_bio(), and queue freeze doesn't guarantee there
> isn't any io activity, is that a problem for bdev_interposer use case?

Right, I raised the same concern here:
https://listman.redhat.com/archives/dm-devel/2021-March/msg00135.html
(toward bottom inlined after dm_disk_{freeze,unfreeze}

Anyway, this certainly needs to be addressed.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

