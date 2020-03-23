Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2062D18FA8A
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 17:56:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584982562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dQYLV2Sb3neq49ner91WoIUoomYGmjAkz346AWH4rQk=;
	b=GBDngxziiRKz2Bm/owgOZuCzhl1niPT3XPRsV6NXXd5Juy0bfo0TrdtiZyaPYHfyD92gMT
	H1fO1Zdttgj6BwlqZzKX0W1yuUg+bKyVZXcsRj55fyium9UmspBaG4gBRKwwUzUJ1KT3Xn
	3RTdWjSxc53dICNj5DD7LWhxA+NOxV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-_1ruv1QkMJ2f7n_8rcv5_A-1; Mon, 23 Mar 2020 12:56:00 -0400
X-MC-Unique: _1ruv1QkMJ2f7n_8rcv5_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5FC8800D4E;
	Mon, 23 Mar 2020 16:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 825E594974;
	Mon, 23 Mar 2020 16:55:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48A5E18089CD;
	Mon, 23 Mar 2020 16:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NGqf4F006952 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 12:52:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3CBC94B27; Mon, 23 Mar 2020 16:52:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E6F94960;
	Mon, 23 Mar 2020 16:52:38 +0000 (UTC)
Date: Mon, 23 Mar 2020 12:52:37 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200323165237.GA27972@redhat.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323151538.GA27573@redhat.com>
	<69ce4dd2-81d3-0ac6-933b-a1f781836597@suse.de>
	<20200323153944.GA27615@redhat.com>
	<7e92a106-b072-126f-fda5-80a8d4abc296@suse.de>
MIME-Version: 1.0
In-Reply-To: <7e92a106-b072-126f-fda5-80a8d4abc296@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH RFC 0/2] dm-zoned: add cache device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 23 2020 at 12:10pm -0400,
Hannes Reinecke <hare@suse.de> wrote:

> On 3/23/20 4:39 PM, Mike Snitzer wrote:
> >On Mon, Mar 23 2020 at 11:26am -0400,
> >Hannes Reinecke <hare@suse.de> wrote:
> >
> >>On 3/23/20 4:15 PM, Mike Snitzer wrote:
> >>>On Mon, Mar 23 2020 at 11:03am -0400,
> >>>Hannes Reinecke <hare@suse.de> wrote:
> >>>
> >>>>Hi Damien,
> >>>>
> >>>>as my original plan to upgrade bcache to work for SMR devices
> >>>>turned out to be more complex than anticipated I went for the
> >>>>simpler approach and added a 'cache' device for dm-zoned.
> >>>>It is using a normal device (eg '/dev/pmem0' :-), split it
> >>>>into zones of the same size of the original SMR device, and
> >>>>makes those 'virtual' zones avialable to dm-zoned in a similar
> >>>>manner than the existing 'random write' zoned.
> >>>>
> >>>>The implementation is still a bit rough (one would need to add
> >>>>metadata to the cache device, too), but so far it seems to work
> >>>>quite well; still running after copying 300GB of data back and forth.
> >>>>
> >>>>As usual, comments and reviews are welcome.
> >>>
> >>>Not seeing why this needs to be so specialized (natively implemented in
> >>>dm-zoned).  Did you try stacking dm-writecache on dm-zoned?
> >>>
> >>dm-zoned is using the random-write zones internally to stage writes
> >>to the sequential zones, so in effect it already has an internal
> >>caching.
> >>All this patch does is to use a different device for the already present
> >>mechanism.
> >>Using dm-writecache would be ignorant of that mechanism, leading to
> >>double caching and detrimental results.
> >
> >If dm-writecache were effective at submitting larger IO then dm-zoned
> >shouldn't be resorting to caching in random-write zones at all -- that
> >is a big if, so not saying it'll "just work".  But if both layers are
> >working then it should.
> >
> Well, by the looks of it dm-writecache suffers from the same problem
> bcache has; it allows for blocks up to 64k sectors to be submitted.
> Sadly for SMR drives I would need to submit block of 256M...
> But before discussing any further I'll give it a go and see where I end up.

Chatted with Mikulas quickly: dm-writecache currently imposes that the
blocksize is <= page size.  So 256M requirement is a non-starter for
dm-writecache at the moment.  I asked Mikulas what he thought about
relaxing that constraint in SSD mode.  He suggested rather hack dm-cache
to always promote on writes... which I hold to _not_ be a good rabbit
hole to staart running down :(

So at the moment work is needed in the DM caching layers to allow for
pure 256M buffering when layered on dm-zoned.

As such, your dm-zoned specific separate cache device changes would
scratch your itch sooner than dm-writecache could be trained/verified to
work with 256M in SSD mode.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

