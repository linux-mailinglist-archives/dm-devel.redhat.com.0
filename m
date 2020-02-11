Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A5295159C13
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 23:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581459743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r2pC8zhzkhLeaI+9lxzdERzs8AgSuxBOLf+7qAt6HuQ=;
	b=d9MbAClbpVgOtg0eKSklr/xIEbo6PXNcNl758InO/SouGFMSEE8dqT/abrQ6y6KbCZWMq2
	qQ9Q4Ry3j/CnWzYW+29pUXV5r5dESAuq5oj8t8cQClT4MOhlZphVWxBmzQcddd4Kn9VOnS
	yz75o/KpiucKOmtw+Ey4MlgNMOmrbPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-CBntap8NMQ2PJ8IcQKmeQg-1; Tue, 11 Feb 2020 17:22:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81A71800EB2;
	Tue, 11 Feb 2020 22:21:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F20AE60BF1;
	Tue, 11 Feb 2020 22:21:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8519C18089CD;
	Tue, 11 Feb 2020 22:21:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BMLDrR001673 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 17:21:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 03BA06E3EE; Tue, 11 Feb 2020 22:21:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EFAE90063;
	Tue, 11 Feb 2020 22:21:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01BML86H008980; 
	Tue, 11 Feb 2020 16:21:09 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01BML8o3008979;
	Tue, 11 Feb 2020 16:21:08 -0600
Date: Tue, 11 Feb 2020 16:21:07 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200211222107.GG30153@octiron.msp.redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-16-git-send-email-bmarzins@redhat.com>
	<5f6810410ac8deac3e335ad45ba02184eff155ac.camel@suse.com>
	<20200210231553.GE30153@octiron.msp.redhat.com>
	<531a70cb9fe8a62a5ad5eed4ddfc437f8930c088.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <531a70cb9fe8a62a5ad5eed4ddfc437f8930c088.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
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
X-MC-Unique: CBntap8NMQ2PJ8IcQKmeQg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Feb 11, 2020 at 09:38:39AM +0100, Martin Wilck wrote:
> On Mon, 2020-02-10 at 17:15 -0600, Benjamin Marzinski wrote:
> > On Mon, Feb 10, 2020 at 06:08:14PM +0100, Martin Wilck wrote:
> > > On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> > > > On systems with a large number of cores (>500), io_destroy() can
> > > > take
> > > > tens to hundreds of milliseconds to complete, due to RCU
> > > > synchronization. If there are a large number of paths using the
> > > > directio
> > > > checker on such a system, this can lead to multipath taking
> > > > almost a
> > > > minute to complete, with the vast majority of time taken up by
> > > > io_destroy().
> > > > 
> > > > To solve this, the directio checker now allocates one aio context
> > > > for
> > > > every 1024 checkers. This reduces the io_destroy() delay to a
> > > > thousandth
> > > > of its previous level. However, this means that muliple checkers
> > > > are
> > > > sharing the same aio context, and must be able to handle getting
> > > > results
> > > > for other checkers.  Because only one checker is ever running at
> > > > a
> > > > time, this doesn't require any locking.  However, locking could
> > > > be added
> > > > in the future if necessary, to allow multiple checkers to run at
> > > > the
> > > > same time.
> > > > 
> > > > When checkers are freed, they usually no longer destroy the io
> > > > context.
> > > > Instead, they attempt to cancel any outstanding request. If that
> > > > fails,
> > > > they put the request on an orphan list, so that it can be freed
> > > > by other
> > > > checkers, once it has completed. IO contexts are only destroyed
> > > > at three
> > > > times, during reconfigure (to deal with the possibility that
> > > > multipathd
> > > > is holding more aio events than it needs to be, since there is a
> > > > single
> > > > limit for the whole system), when the checker class is unloaded,
> > > > and
> > > > in a corner case when checkers are freed. If an aio_group (which
> > > > contains the aio context) is entirely full of orphaned requests,
> > > > then
> > > > no checker can use it. Since no checker is using it, there is no
> > > > checker
> > > > to clear out the orphaned requests. In this (likely rare) case,
> > > > the
> > > > last checker from that group to be freed and leave behind an
> > > > orphaned
> > > > request will call io_destroy() and remove the group.
> > > > 
> > > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > > > ---
> > > >  libmultipath/checkers/directio.c | 336
> > > > +++++++++++++++++++++++++------
> > > >  multipath/multipath.conf.5       |   7 +-
> > > >  2 files changed, 281 insertions(+), 62 deletions(-)
> > > 
> > > Although I concur now that your design is sound, I still have some
> > > issues, see below.
> > > ...
> > >  	}
> > > >  	ct->running++;
> > > 
> > > This looks to me as if in the case (ct->running && ct->req->state
> > > ==
> > > PATH_PENDING), ct->running could become > 1, even though you don't
> > > start a new IO. Is that intended? I don't think it matters because
> > > you
> > > never decrement, but it looks weird.
> > 
> > That's necessary for how the checker currently works. In async mode
> > checker doesn't actually wait for a specific number of seconds (and
> > didn't before my patch). It assumes 1 sec call times for pending
> > paths,
> > and times out after ct->running > timeout_secs. That's why the unit
> > tests can get away with simply calling the checker repeatedly,
> > without
> > waiting, to make it timeout. But I suppose that
> > wait_for_pending_paths()
> > will also be making the checker time out quicker, so this should
> > probably be changed. However, since check_path won't set a paths
> > state
> > to PATH_PENDING if it wasn't already, it's not really a very likely
> > issue to occur.
> 
> Bah. I should have realized that, of course. Yet measuring the timeout
> in *seconds*, and polling for it the way we currently do, is really 80s
> design... I guess I was confused by the use of ns timeout calculation
> for the get_events() call (suggesting high-res timing), and the use of
> "ct->running" as both indicator of running IO and "abstract run time".
> 
> I hope you admit that the logic in check_path() is convoluted and hard
> to understand :-/ . For example here:
> 
> > 	while(1) {
> > 		r = get_events(ct->aio_grp, timep);
> > 
> > 		if (ct->req->state != PATH_PENDING) {
> > 			ct->running = 0;
> > 			return ct->req->state;
> > 		} else if (r == 0 || !timep)
> > 			break;
> > 
> > 		get_monotonic_time(&currtime);
> > 		timespecsub(&endtime, &currtime, &timeout);
> > 		if (timeout.tv_sec < 0)
> > 			timep = NULL;
> 
> We're past the timeout already, having seen some events, just not for
> the path we're currently looking at. Why do we go through another
> iteration?

Well, in this case we are past the timeout now, but weren't when
io_getevents() completed, so the code loops one more time to check
(without waiting) if the current path's request has completed. Since we
call io_getevents() after setting the timeout to be all the remaining
time, this should only ever happen if io_getevents() exitted early.
Granted, it likely didn't exit very early (unless the thread was
preempted afterwards), since it is now past the timeout.

-Ben

> 
> > 	}
> > 	if (ct->running > timeout_secs || sync) {
> >  
> > > See comment for get_events() above. Why don't you simply do this?
> > > 
> > >     timeout.tv_sec = timeout.tv_nsec = 0;
> > > 
> > 
> > Sure.
> > 
> > So, If I will post a seperate patch that resolves these issues, can
> > this
> > one have an ack?
> 
> Yes. I agree we should move forward.
> 
> Regards
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

