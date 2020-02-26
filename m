Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF2316F4F8
	for <lists+dm-devel@lfdr.de>; Wed, 26 Feb 2020 02:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582680193;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KCvRDl+1gzGFSPOwcYWpGgtcYaMcw5LbZSw52sJcSkI=;
	b=CPoeu8/vHEJw0hurbmhxwJiJY0YF8B9euu7OkBZ8i8Q9/ITGg06PmbFDUu9ipuGhWVC768
	F3x6moZcMVxfjhpy0USpLvk3awSL+LA2qs//bBilok9V6WCQFTvjOQTtg9uVtSxp+g9TtF
	t+uWiSduDaUor5oBhr7ftU1mY4AfwTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-AdTTsIseMZyJc_E_y6O1bA-1; Tue, 25 Feb 2020 20:23:10 -0500
X-MC-Unique: AdTTsIseMZyJc_E_y6O1bA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9225B1005513;
	Wed, 26 Feb 2020 01:23:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CCFF26E6E;
	Wed, 26 Feb 2020 01:23:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E832E8B2DB;
	Wed, 26 Feb 2020 01:22:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01Q1MZMi025410 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 20:22:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A333B5C545; Wed, 26 Feb 2020 01:22:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D8D15C28C;
	Wed, 26 Feb 2020 01:22:32 +0000 (UTC)
Date: Tue, 25 Feb 2020 20:22:31 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200226012231.GA12308@redhat.com>
References: <20200225170744.10485-1-dg@emlix.com>
	<20200225191222.GA3908@infradead.org>
	<a932a297-266e-4dee-f030-40ecbc9899ca@emlix.com>
	<20200225220254.GA13356@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200225220254.GA13356@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Subject: Re: [dm-devel] dm integrity: reinitialize __bi_remaining when
	reusing bio
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 25 2020 at  5:02pm -0500,
Christoph Hellwig <hch@infradead.org> wrote:

> On Tue, Feb 25, 2020 at 08:54:07PM +0100, Daniel Gl=F6ckner wrote:
> > bio_reset will reset too many fields. As you can see in the context of
> > the diff, dm-integrity expects f.ex. the values modified by bio_advance
> > to stay intact and the transfer should of course use the same disk and
> > operation.
> >=20
> > How about doing the atomic_set in bio_remaining_done (in block/bio.c)
> > where the BIO_CHAIN flag is cleared once __bi_remaining hits zero?
> > Or is requeuing a bio without bio_reset really a no-go? In that case a
> > one-liner won't do...
>
> That tends to add a overhead to the fast path for a rather exotic
> case.  I'm having a bit of a hard time understanding the dm-integrity
> code due to it's annoyingly obsfucated code, but it seems like it
> tries to submit a bio again after it came out of a ->end_io handler.

Yeah, the dm-integrity code has always been complex and it has only
gotten moreso.  I'm struggling with it too.

This case that Daniel has seen a BUG_ON with is when there is a need to
finish a partially completed bio (as reflected by the per-bio-data's
internal accounting managed by dm-integrity).

> That might have some other problems, but if we only want to paper
> over the remaining count a isngle call to bio_inc_remaining might be all
> you need.

bio_inc_remaining() is really meant to be paired with bio_chain().  They
are pretty tightly coupled these days.  We removed __bio_inc_remaining()
once we weened all (ab)users many releases ago.  Definitely don't want
an open-coded equivalent buried in an obscure dm-integrity usecase.

Could be bio_split() + generic_make_request() recursion is a way
forward -- but that'd likely require some extra work in dm-integrity.
All the additional code in dm_integrity_map_continue() makes me think I
could easily be missing something.

Mikulas, if you could look closer at this issue and see what your best
suggestion would be that'd be appreciated.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

