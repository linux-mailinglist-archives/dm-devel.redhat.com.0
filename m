Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 98F78424E15
	for <lists+dm-devel@lfdr.de>; Thu,  7 Oct 2021 09:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633591731;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0yXSgBNHO7jKVfdLY3R7Pk2316vPK7wKkF6MS2TS8EE=;
	b=UnKDtT2etA7V767vRbq0ewC0QYR8AE9XrSejegzkKtWmlPnLNKdas5M91ws1Mxc+ka1F1c
	lMPw7hLm9jqPdY2m7V/6wQyMOB+ibvDOJCol6heHiGphjXdQt79R2cuNkoGoF1zrGiB09F
	nJqz5Cttb/cA9odbt3sOHuv6yf1Xvhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-AUOrcfFKPMu1ADzywDUHrA-1; Thu, 07 Oct 2021 03:28:50 -0400
X-MC-Unique: AUOrcfFKPMu1ADzywDUHrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD793101F003;
	Thu,  7 Oct 2021 07:28:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C858C9AA26;
	Thu,  7 Oct 2021 07:28:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F5221800B8B;
	Thu,  7 Oct 2021 07:28:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197770XD013017 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 03:07:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 669D460657; Thu,  7 Oct 2021 07:07:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-22.pek2.redhat.com [10.72.8.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C74D260583;
	Thu,  7 Oct 2021 07:06:58 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:06:53 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <YV6cjZa3Dnnj46Nz@T590>
References: <20210923091131.1463013-1-ming.lei@redhat.com>
	<YV2vnlKScVXYvQMo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YV2vnlKScVXYvQMo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-rq: don't queue request during suspend
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

On Wed, Oct 06, 2021 at 10:15:58AM -0400, Mike Snitzer wrote:
> On Thu, Sep 23 2021 at  5:11P -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > DM uses blk-mq's quiesce/unquiesce to stop/start device mapper queue.
> > 
> > But blk-mq's unquiesce may come from outside events, such as elevator
> > switch, updating nr_requests or others, and request may come during
> > suspend, so simply ask for blk-mq to requeue it.
> > 
> > Fixes one kernel panic issue when running updating nr_requests and
> > dm-mpath suspend/resume stress test.
> > 
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> > ---
> >  drivers/md/dm-rq.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
> > index 5b95eea517d1..a896dea9750e 100644
> > --- a/drivers/md/dm-rq.c
> > +++ b/drivers/md/dm-rq.c
> > @@ -490,6 +490,14 @@ static blk_status_t dm_mq_queue_rq(struct blk_mq_hw_ctx *hctx,
> >  	struct mapped_device *md = tio->md;
> >  	struct dm_target *ti = md->immutable_target;
> >  
> > +	/*
> > +	 * blk-mq's unquiesce may come from outside events, such as
> > +	 * elevator switch, updating nr_requests or others, and request may
> > +	 * come during suspend, so simply ask for blk-mq to requeue it.
> > +	 */
> > +	if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags)))
> > +		return BLK_STS_RESOURCE;
> > +
> >  	if (unlikely(!ti)) {
> >  		int srcu_idx;
> >  		struct dm_table *map = dm_get_live_table(md, &srcu_idx);
> > -- 
> > 2.31.1
> > 
> 
> Hey Ming,
> 
> I've marked this for stable@ and queued this up.  BUT this test is
> racey, could easily be that device gets suspended just after your
> test.

Hello Mike,

I understand the device shouldn't be suspended after the test given
it is just like the following two tasks running contiguously in the
test:

1) task1
- suspend device mapper
- resume device mapper

2) task2
- updating nr_requests of the device mapper

BTW, it is reported as RH BZ1891486 in which it is easily reproduced,
however, seems device suspended isn't observed.

thanks, 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

