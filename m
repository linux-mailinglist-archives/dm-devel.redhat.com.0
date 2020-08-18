Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CD44C249193
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 01:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597794854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tvV1EOKOvR+EchKCI6JUP+xk9CwE8X/7Vr4KDsJNefQ=;
	b=feOYYTMl9X4+/9fLYcsv4sNr+FoOEa9Q7je+9qKw8DSHsgS9ofZ4Dri6UP3fhkiEgbHeqW
	NJklQQlkoXzwOraSfW6JQ/XVXZlWdV0qWBpEvWPhve90z6QBUYkJkvrEXg0rmB+Bm/Atp1
	tTcPaPd5a8fvDV3bCRslzCH4vPoqyK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-fnVOm-IfOQ2lhMkYPc0YBw-1; Tue, 18 Aug 2020 19:54:12 -0400
X-MC-Unique: fnVOm-IfOQ2lhMkYPc0YBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 836681DDF1;
	Tue, 18 Aug 2020 23:54:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3136760C07;
	Tue, 18 Aug 2020 23:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 063454EE16;
	Tue, 18 Aug 2020 23:53:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07INqbbK031804 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 19:52:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A85F57BE6D; Tue, 18 Aug 2020 23:52:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-56.pek2.redhat.com [10.72.12.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0F3D39A75;
	Tue, 18 Aug 2020 23:52:24 +0000 (UTC)
Date: Wed, 19 Aug 2020 07:52:20 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200818235220.GA2712797@T590>
References: <20200818090728.2696802-1-ming.lei@redhat.com>
	<92162ee6-0fa0-dafd-69b1-af285ee61044@kernel.dk>
	<20200818152022.GB6842@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200818152022.GB6842@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH RESEND] blk-mq: insert request not through
 ->queue_rq into sw/scheduler queue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Aug 18, 2020 at 11:20:22AM -0400, Mike Snitzer wrote:
> On Tue, Aug 18 2020 at 10:50am -0400,
> Jens Axboe <axboe@kernel.dk> wrote:
> 
> > On 8/18/20 2:07 AM, Ming Lei wrote:
> > > c616cbee97ae ("blk-mq: punt failed direct issue to dispatch list") supposed
> > > to add request which has been through ->queue_rq() to the hw queue dispatch
> > > list, however it adds request running out of budget or driver tag to hw queue
> > > too. This way basically bypasses request merge, and causes too many request
> > > dispatched to LLD, and system% is unnecessary increased.
> > > 
> > > Fixes this issue by adding request not through ->queue_rq into sw/scheduler
> > > queue, and this way is safe because no ->queue_rq is called on this request
> > > yet.
> > > 
> > > High %system can be observed on Azure storvsc device, and even soft lock
> > > is observed. This patch reduces %system during heavy sequential IO,
> > > meantime decreases soft lockup risk.
> > 
> > Applied, thanks Ming.
> 
> Hmm, strikes me as strange that this is occurring given the direct
> insertion into blk-mq queue (bypassing scheduler) is meant to avoid 2
> layers of IO merging when dm-mulipath is stacked on blk-mq path(s).  The
> dm-mpath IO scheduler does all merging and underlying paths' blk-mq
> request_queues are meant to just dispatch the top-level's requests.
> 
> So this change concerns me.  Feels like this design has broken down.
> 

'bypass_insert' is 'true' when blk_insert_cloned_request() is
called from device mapper code, so this patch doesn't affect dm.

> Could be that some other entry point was added for the
> __blk_mq_try_issue_directly() code?  And it needs to be untangled away
> from the dm-multipath use-case?

__blk_mq_try_issue_directly() can be called from blk-mq directly, that
is the case this patch is addressing, if one request can't be queued to
LLD because of running out of budget or driver tag, it should be added to
scheduler queue for improving io merge, meantime we can avoid too many
requests dispatched to hardware.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

