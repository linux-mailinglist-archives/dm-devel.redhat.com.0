Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA70277903
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 21:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600975013;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XCQoEp3Kl3uTKUxVQq8ui4gFVbUi4FqgBORCJFesXrQ=;
	b=SFh71QdMfk/xGsCAJedZ6OfyyAOlY8TBDmrriyk2Aa9jAyaLs05lFzOCzuHbLCSTOrsHfA
	KuR1e/soTmHRsUumGWdTPZpwRm+qEAs57wj5+gDXWKY9kONmkvuqWz6Jyb6IlmFaVXlBRA
	JfKSkLaBvgRctIoDaRMnn/dC4Sd23aQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-R0CnjmN2OVuf9NctMzbRKQ-1; Thu, 24 Sep 2020 15:16:50 -0400
X-MC-Unique: R0CnjmN2OVuf9NctMzbRKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5AA4192AB62;
	Thu, 24 Sep 2020 19:16:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E1D65C1C7;
	Thu, 24 Sep 2020 19:16:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 337B544A5E;
	Thu, 24 Sep 2020 19:16:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OJFMV1004257 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 15:15:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C9831972B; Thu, 24 Sep 2020 19:15:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66B3A19C66;
	Thu, 24 Sep 2020 19:15:16 +0000 (UTC)
Date: Thu, 24 Sep 2020 15:15:15 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20200924191515.GA15323@redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh87GLea=7_4qGuPhMj0WKnB-596HzkKQDafLirHiBpSzQ@mail.gmail.com>
	<20200924170047.GB14650@redhat.com>
	<CAMeeMh-KfeEFAZE9v_UiDx_TELg3twKg6Ayvbbaf=NwYJ-8Csg@mail.gmail.com>
	<CAMeeMh-6kdN_73qc3uH_UVqbWyo07nWR8yhypVcboyXry-2N9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMeeMh-6kdN_73qc3uH_UVqbWyo07nWR8yhypVcboyXry-2N9A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] dm-raid: stack limits instead of overwriting them.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24 2020 at  2:56pm -0400,
John Dorminy <jdorminy@redhat.com> wrote:

> On Thu, Sep 24, 2020 at 1:24 PM John Dorminy <jdorminy@redhat.com> wrote:
> >
> > I am impressed at how much I read wrong...
> >
> > On Thu, Sep 24, 2020 at 1:00 PM Mike Snitzer <snitzer@redhat.com> wrote:
> > >
> > > On Thu, Sep 24 2020 at 12:45pm -0400,
> > > John Dorminy <jdorminy@redhat.com> wrote:
> > >
> > > > I don't understand how this works...
> > > >
> > > > Can chunk_size_bytes be 0? If not, how is discard_granularity being set to 0?
> > >
> > > Yeah, I had same question.. see the reply I just sent in this thread:
> > > https://www.redhat.com/archives/dm-devel/2020-September/msg00568.html
> > >
> > > > I think also limits is local to the ti in question here, initialized
> > > > by blk_set_stacking_limits() via dm-table.c, and therefore has only
> > > > default values and not anything to do with the underlying queue. So
> > > > setting discard_granularity=max(discard_granularity, chunk_size_bytes)
> > > > doesn't seem like it should be working, unless I'm not understanding
> > > > what it's there for...
> > >
> > > You're reading the dm-table.c limits stacking wrong.  Of course DM stack
> > > up the underlying device(s) limits ;)
> >
> > Yep, I failed to read iterate_devices...
> >
> > >
> > > >
> > > > And shouldn't melding in the target's desired io_hints into the
> > > > existing queue limits be happening in blk_stack_limits() instead?
> > > > (Also, it does lcm_not_zero() for stacking granularity, instead of
> > > > max()...)
> > > >
> > >
> > > DM core does do that, the .io_hints hook in the DM target is reserved
> > > for when the target has additional constraints that blk_stack_limits()
> > > didn't/couldn't factor in.
> > Yes, I had erroneously thought the limit-stacking was after getting
> > the targets' individual limits, not before.
> >
> > >
> > > And blk_stack_limts() does use max() for discard_granularity.
> > ... I'm just terrible at reading this morning.
> >
> > Thanks for pointing out all the things I misread!
> 
> Actually, though, I don't understand why it should be max instead of
> lcm_not_zero(). If the raid's chunk size is 1024 sectors, say, and
> you're constructing it on something that has discard_granularity 812
> sectors, say, blkdev_issue_discard will be generating 1024 sector IOs
> which will work poorly when passed down to the 812-sector-granularity
> underlying device. While, if lcm(812,1024) were used, lcm(812,1024)
> sector IOs would be compatible with both the chunk size and underlying
> device's granularity, perhaps? Maybe I'm missing something, but I read
> the doc and code an extra time around this time ;)

Martin may correct me if I'm wrong but I _think_ it is because
discard_granularity is unintuitive.  The larger the discard_granularity
the more constraining it is (on other devices with more relaxed, or
smaller, discard_granularity).  So you need to impose the most
constrained limit for all when stacking.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

