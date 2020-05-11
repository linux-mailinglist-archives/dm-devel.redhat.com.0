Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 270C41CE2F0
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 20:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589222535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K/bghGkM3nDJEWXfT64HKDuBFuSg93oaOrv+LFwnNaI=;
	b=RMbsjoLwt1gb4YMRFtWn8rleF30zZrmuPYYJoBNlxhqNMUH2cl9SKJBUJ8B16nGw2ntqri
	31iiUJqAM/m+Y7TLaQkOaQUgiKOEAk2ED3SQwZv94fmjDfFihupQ8n7NwbsjLMcVAk3jNM
	MTteCoC9sdbGUrehLfndnvTM8j05QVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-nPElyuTsO623tX8-NTDphQ-1; Mon, 11 May 2020 14:42:12 -0400
X-MC-Unique: nPElyuTsO623tX8-NTDphQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 202D28010EB;
	Mon, 11 May 2020 18:42:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 554AB2E186;
	Mon, 11 May 2020 18:42:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6440A1809543;
	Mon, 11 May 2020 18:41:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BIflJw025924 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 14:41:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB1B870949; Mon, 11 May 2020 18:41:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73487784AF;
	Mon, 11 May 2020 18:41:44 +0000 (UTC)
Date: Mon, 11 May 2020 14:41:43 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200511184143.GA8274@redhat.com>
References: <20200511163910.3778467-1-krisman@collabora.com>
	<20200511170235.GA7719@redhat.com> <85ftc6l7lb.fsf@collabora.com>
	<20200511173155.GA7892@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200511173155.GA7892@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: breeves@redhat.com, linux-kernel@vger.kernel.org, khazhy@google.com,
	song@kernel.org, dm-devel@redhat.com, mpatocka@redhat.com,
	kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v4 0/2] Historical Service Time Path Selector
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, May 11 2020 at  1:31pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Mon, May 11 2020 at  1:11pm -0400,
> Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
> 
> > Mike Snitzer <snitzer@redhat.com> writes:
> > 
> > > On Mon, May 11 2020 at 12:39pm -0400,
> > > Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
> > >
> > >> Hi,
> > >> 
> > >> This fourth version of HST applies the suggestion from Mikulas Patocka
> > >> to do the ktime_get_ns inside the mpath map_bio instead of generic
> > >> device-mapper code. This means that struct dm_mpath_io gained another
> > >> 64bit field.  For the request-based case, we continue to use the block
> > >> layer start time information.
> > >> 
> > >> With this modification, I was able obtain similar performance on  BIO
> > >> to request-based multipath with HST on the benchmarks shared in v1.
> > >> 
> > >> v3: https://www.redhat.com/archives/dm-devel/2020-April/msg00308.html
> > >> v2: https://www.redhat.com/archives/dm-devel/2020-April/msg00270.html
> > >> v1: https://www.redhat.com/archives/dm-devel/2020-April/msg00176.html
> > >
> > > I already staged your v3 in linux-next.  Please provide an incremental
> > > patch that layers on this git branch:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=dm-5.8
> > >
> > > I was hopeful for a flag to be set (e.g. in 'struct path_selector') to
> > > reflect whether the path selector expects highres start_time.  Makes
> > > little sense to incur that extra cost of providing the time if the path
> > > selector doesn't even use it.
> > >
> > > Alternatively, could split out the setting of the time needed by .end_io
> > > to a new path_selector_type method (e.g. .set_start_time).  And then
> > > only use ktime_get_ns() for bio-based if .set_start_time is defined.
> > > Would get a little fiddly needing to make sure a stale start_time isn't
> > > used... also, makes more sense to conditionally call this
> > > .set_start_time just after .start_io is.
> > 
> > Oh, my apologies, I hadn't noticed it was merged.  I will make the time fetch
> > conditional and submit a new patch based on that branch.
> 
> I don't want to waste your time so please don't run with that idea just yet.
> 
> There is a possibility we really _do_ need higher resolution time.
> 
> I'm about to have a concall to discuss some disk IO stat issues with DM
> disk stats vs NVMe disk stats (provided by block core).
> 
> I'll let you know the outcome and we can discuss further.

OK, that concall's issue had nothing to do with needing higher
resolution time (was about IOPs realized with requested-based vs
bio-based).

Reality is, DM won't need anything higher resolution than jiffies until
block core's interfaces require something other than jiffies
(e.g. generic_end_io_acct).

So feel free to proceed with the conditional time fetch solution you
were going to run with (prior to my previous mail asking you to hold
off).

Sorry for the noise.  Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

