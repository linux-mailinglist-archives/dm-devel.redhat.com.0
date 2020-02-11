Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 370C4158B66
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 09:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581410468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Fx3C9ND+ci8HBurMEtww5IOU6vBAxoZIo0pBr0357tw=;
	b=HD2QOuaQIeykycwkv53ybMq+LYOOQ3VcNWwTSYmix2Y11NEXEM7CTiNIxjcvXedrDeo2/U
	uXB3SAOfVivzWoOj5GrqsEawBMSSzual3B19AHs3DNGT2aXGmZ+LwHIZmErnyZNmtNL99Q
	locDvp7oKyoVUIMdUNNNlR4hlohfMlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-yBUjRrQHPbuejMOFn1C3uQ-1; Tue, 11 Feb 2020 03:41:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15BED1005510;
	Tue, 11 Feb 2020 08:40:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C45EA60BF1;
	Tue, 11 Feb 2020 08:40:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84CDE8B2A1;
	Tue, 11 Feb 2020 08:40:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B8bKOa008043 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 03:37:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8AD612166B27; Tue, 11 Feb 2020 08:37:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81CCB2166B3A
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:37:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E940180030B
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:37:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-189-2XJ5luGrNse7X7apfaou1A-1;
	Tue, 11 Feb 2020 03:37:13 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E6364B146;
	Tue, 11 Feb 2020 08:37:09 +0000 (UTC)
Message-ID: <531a70cb9fe8a62a5ad5eed4ddfc437f8930c088.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 11 Feb 2020 09:38:39 +0100
In-Reply-To: <20200210231553.GE30153@octiron.msp.redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-16-git-send-email-bmarzins@redhat.com>
	<5f6810410ac8deac3e335ad45ba02184eff155ac.camel@suse.com>
	<20200210231553.GE30153@octiron.msp.redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: 2XJ5luGrNse7X7apfaou1A-1
X-MC-Unique: yBUjRrQHPbuejMOFn1C3uQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B8bKOa008043
X-loop: dm-devel@redhat.com
Cc: development <dm-devel@redhat.com>, device-mapper
Subject: Re: [dm-devel] [PATCH v2 15/17] libmultipath: make directio checker
 share io contexts
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-10 at 17:15 -0600, Benjamin Marzinski wrote:
> On Mon, Feb 10, 2020 at 06:08:14PM +0100, Martin Wilck wrote:
> > On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> > > On systems with a large number of cores (>500), io_destroy() can
> > > take
> > > tens to hundreds of milliseconds to complete, due to RCU
> > > synchronization. If there are a large number of paths using the
> > > directio
> > > checker on such a system, this can lead to multipath taking
> > > almost a
> > > minute to complete, with the vast majority of time taken up by
> > > io_destroy().
> > > 
> > > To solve this, the directio checker now allocates one aio context
> > > for
> > > every 1024 checkers. This reduces the io_destroy() delay to a
> > > thousandth
> > > of its previous level. However, this means that muliple checkers
> > > are
> > > sharing the same aio context, and must be able to handle getting
> > > results
> > > for other checkers.  Because only one checker is ever running at
> > > a
> > > time, this doesn't require any locking.  However, locking could
> > > be added
> > > in the future if necessary, to allow multiple checkers to run at
> > > the
> > > same time.
> > > 
> > > When checkers are freed, they usually no longer destroy the io
> > > context.
> > > Instead, they attempt to cancel any outstanding request. If that
> > > fails,
> > > they put the request on an orphan list, so that it can be freed
> > > by other
> > > checkers, once it has completed. IO contexts are only destroyed
> > > at three
> > > times, during reconfigure (to deal with the possibility that
> > > multipathd
> > > is holding more aio events than it needs to be, since there is a
> > > single
> > > limit for the whole system), when the checker class is unloaded,
> > > and
> > > in a corner case when checkers are freed. If an aio_group (which
> > > contains the aio context) is entirely full of orphaned requests,
> > > then
> > > no checker can use it. Since no checker is using it, there is no
> > > checker
> > > to clear out the orphaned requests. In this (likely rare) case,
> > > the
> > > last checker from that group to be freed and leave behind an
> > > orphaned
> > > request will call io_destroy() and remove the group.
> > > 
> > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > > ---
> > >  libmultipath/checkers/directio.c | 336
> > > +++++++++++++++++++++++++------
> > >  multipath/multipath.conf.5       |   7 +-
> > >  2 files changed, 281 insertions(+), 62 deletions(-)
> > 
> > Although I concur now that your design is sound, I still have some
> > issues, see below.
> > ...
> >  	}
> > >  	ct->running++;
> > 
> > This looks to me as if in the case (ct->running && ct->req->state
> > ==
> > PATH_PENDING), ct->running could become > 1, even though you don't
> > start a new IO. Is that intended? I don't think it matters because
> > you
> > never decrement, but it looks weird.
> 
> That's necessary for how the checker currently works. In async mode
> checker doesn't actually wait for a specific number of seconds (and
> didn't before my patch). It assumes 1 sec call times for pending
> paths,
> and times out after ct->running > timeout_secs. That's why the unit
> tests can get away with simply calling the checker repeatedly,
> without
> waiting, to make it timeout. But I suppose that
> wait_for_pending_paths()
> will also be making the checker time out quicker, so this should
> probably be changed. However, since check_path won't set a paths
> state
> to PATH_PENDING if it wasn't already, it's not really a very likely
> issue to occur.

Bah. I should have realized that, of course. Yet measuring the timeout
in *seconds*, and polling for it the way we currently do, is really 80s
design... I guess I was confused by the use of ns timeout calculation
for the get_events() call (suggesting high-res timing), and the use of
"ct->running" as both indicator of running IO and "abstract run time".

I hope you admit that the logic in check_path() is convoluted and hard
to understand :-/ . For example here:

> 	while(1) {
> 		r = get_events(ct->aio_grp, timep);
> 
> 		if (ct->req->state != PATH_PENDING) {
> 			ct->running = 0;
> 			return ct->req->state;
> 		} else if (r == 0 || !timep)
> 			break;
> 
> 		get_monotonic_time(&currtime);
> 		timespecsub(&endtime, &currtime, &timeout);
> 		if (timeout.tv_sec < 0)
> 			timep = NULL;

We're past the timeout already, having seen some events, just not for
the path we're currently looking at. Why do we go through another
iteration?

> 	}
> 	if (ct->running > timeout_secs || sync) {
>  
> > See comment for get_events() above. Why don't you simply do this?
> > 
> >     timeout.tv_sec = timeout.tv_nsec = 0;
> > 
> 
> Sure.
> 
> So, If I will post a seperate patch that resolves these issues, can
> this
> one have an ack?

Yes. I agree we should move forward.

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

