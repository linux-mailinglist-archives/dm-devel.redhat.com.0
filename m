Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 381CA1438DD
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jan 2020 09:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579596877;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c0QF+Lt+sL1KQsyArnSwZct7wHuHeIBF+rSF32Ttaf0=;
	b=gvA368r+JSwGQ65sCJoPOEDssIY9svCSmcmA/UYL2ltLi/jmFK9unt+qCNd4UOsPUuDeXo
	H7q/G1281jFRB0aFSV5Uuu0vtUysD67qPXTwQHd7PSbIM98/71T+Q9Fe/Wa3MM5peqBTWL
	FIYBYwc9Gy3nlAmx1IpzixLooCcSaFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-w_xq4J3rNCyjHiOmsyqqqA-1; Tue, 21 Jan 2020 03:54:36 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EFB118B9FC4;
	Tue, 21 Jan 2020 08:54:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2008BE23;
	Tue, 21 Jan 2020 08:54:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F1D218095FF;
	Tue, 21 Jan 2020 08:54:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00L8rsbG032447 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 03:53:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 804012166B2F; Tue, 21 Jan 2020 08:53:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C2D22166B2A
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 08:53:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F68A85A326
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 08:53:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-268-H2RiBzdPPkCMFBLCZkXq5g-1;
	Tue, 21 Jan 2020 03:53:50 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0082CB26B;
	Tue, 21 Jan 2020 08:53:48 +0000 (UTC)
Message-ID: <03120dd13729606158b7e523178b2999b111f6e9.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>
Date: Tue, 21 Jan 2020 09:55:06 +0100
In-Reply-To: <20200120160843.GQ30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-15-git-send-email-bmarzins@redhat.com>
	<beb66255f922b10f5533f6d8131cdb8f2891a9b6.camel@suse.de>
	<20200120160843.GQ30153@octiron.msp.redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: H2RiBzdPPkCMFBLCZkXq5g-1
X-MC-Unique: w_xq4J3rNCyjHiOmsyqqqA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00L8rsbG032447
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 14/15] libmultipath: make directio checker
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ben,

thanks for your clarifying remarks.

On Mon, 2020-01-20 at 10:08 -0600, Benjamin Marzinski wrote:
> On Mon, Jan 20, 2020 at 09:09:37AM +0100, Martin Wilck wrote:
> > Hi Ben,
> > 
> > On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
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
> > > of its previous level.
> > >  However, this means that muliple checkers are
> > > sharing the same aio context, and must be able to handle getting
> > > results
> > > for other checkers.  Because only one checker is ever running at
> > > a
> > > time, this doesn't require any locking.  However, locking could
> > > be
> > > added
> > > in the future if necessary, to allow multiple checkers to run at
> > > the
> > > same time.
> > > 
> > > When checkers are freed, they usually no longer destroy the io
> > > context.
> > > Instead, they attempt to cancel any outstanding request. If that
> > > fails,
> > > they put the request on an orphan list, so that it can be freed
> > > by
> > > other
> > > checkers, once it has completed. IO contexts are only destroyed
> > > at
> > > three
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
> > 
> > I haven't made up my mind about this patch yet. 
> > 
> > The general idea is of course good, I never liked the fact that we
> > allocate one aio context per path. Also, technically, I haven't
> > found
> > any issues with your patch.
> > 
> > Wrt the design, rather than having the checkers mutually catch
> > there
> > completion events, have you considered simply creating a dedicated
> > thread for each aio group, which would just call io_getevents() in
> > a
> > loop and update the checker status, which licbcheck_check() could
> > then
> > fetch at the next call? That approach would avoid the "no checker
> > available for freeing orphans" complication. As an added bonus,
> > this
> > thread could also handle checker timeouts, and perhaps even
> > io_destroy() and the cleanup. That way multipathd wouldn't have to
> > wait
> > for io_destroy() at all - it could drop all refs to the aio context
> > to
> > be deleted, detach the event thread, and let it handle the
> > destruction
> > of the remaining data structures without worrying further. Some
> > locking
> > and/or atomic operations would be required of course, but you
> > remarked
> > already that that might be necessary sooner or later anyway.
> 
> I actually went back and forth a while before settling on not using
> another thread.  In the end, all of the additional locking work, and
> extra thread stuff seemed worse than the orphan handling. You will
> only
> ever need the data when the checker runs, and it will always want to
> wait for the checker timeout, so I decided against adding more
> threads.
> But like I said, it wasn't a clear cut choice, and I didn't think
> about
> full aio_group corner case until I was actually writing the code. 

I guess it's a matter of taste. I thought the locking wouldn't be all-
too-complicated (the IO thread could be made the only entity actually
writing to the status bytes), and OTOH I found the additonal level of
complexity introduced by the aio_groups a bit confusing at first. 
But I'm definitely not in a position to reject your patch on these weak
grounds.

> But,
> right now the only io_destroy issue that exists is in that corner
> case.
> I believe that you still want to wait for the old IO contexts to be
> destroyed before you create new ones in reconfigure. 

Well, the kernel doesn't wait until all resources are released before
freeing the AIO slots (see 
https://elixir.bootlin.com/linux/v5.5-rc7/source/fs/aio.c#L836). But
that's undocumented behavior, so waiting for io_destroy() to return is
certainly safer.

> > Second, I have experimented with this a bit, and AFAICS io_cancel()
> > NEVER succeeds. Please don't add a level 3 logmessage there, as the
> > failure of this call is expected. I observed that recent kernels
> > always
> > return -EINVAL from io_cancel(), and I'm going to report this on
> > LKML
> > soon. But whatever the error code is, as a matter of fact aio
> > requests
> > can't be cancelled with currentl Linux kernels. We have to wait for
> > their completion no matter what.
> 
> Sure, I can change that message

In principle, you could almost skip the entire check, as the kernel
won't return 0 anyway. (See also my linux-aio patch, 
https://marc.info/?l=linux-aio&m=157953649003136&w=2).


> > Finally, I wonder if the code could be simplified by just using a
> > single aio context, possibly with configurable size. If slots fill
> > up,
> > we could either fall back to sync IO, or try to re-allocate the
> > context, returning PATH_PENDING from checkers in the meantime.
> 
> The issue is that there is a single limit for async io events that is
> shared by everything using aio on a system, so we don't want to take
> up many more events than we need to. And in order to grow a single
> context, we would either need to allocate the new one while still
> holding the old one, or wait until we can destroy the old on. If we
> wait, then every checker is stalled until the last IO is waited for.
> If
> we don't wait, then we add back a significant chunk of the
> complexity,
> and we also end up temporarily taking up a much larger chunk of aio
> events than we need.

I don't think that would be a big issue, in particular as it would be
temporary. We don't need to bother too much about depleting system
resources. On servers which run aio-intensive workloads, the limit will
be increased anyway. On other systems, the default of 64k is plenty for
multipath, except in corner cases.

What bothers me more is that we, ourselves, have no fallback to sync IO
in the case that io_setup() fails. If that happens and directio is
configured, multipathd will effectively run without path checker.
That's not an issue of your patch, I was just considering whether it
should be fixed while we're at it. And we should add a more meaningful
error message if io_setup() returns -EAGAIN, hinting at an increase of
for fs.aio-max-nr sysctl, and add a similar hint in the man page.

Bottom line: I suppose you'll submit a v2 of your series anyway to
address the minor points I raised, and I believe this part will be fine
then, too.

Thanks,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

