Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 20D1F18F8D0
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 16:40:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584978017;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+6pP4lXTOxGu5JM/3LgRRhyaZ4j3lyGp1wvyZ2K2U2I=;
	b=HoGzJ5+P0lciPQ7Cs8FDUSHpf0oBDrRu8+vXKEZRGODuAoI8XgojU10JI9M031M1OqiOb9
	fjuSx1Trsd7YgE0UjItEGJuqQckYCb0SWIWnLMHu26LuA/XCLIHaoD7qmjBsQ8vK/9+CvA
	1ke/YXMyZ0yGkWh4DE51CDyHJtGQp3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-SdjPuNYtPBKMgGXoY7HMBA-1; Mon, 23 Mar 2020 11:40:14 -0400
X-MC-Unique: SdjPuNYtPBKMgGXoY7HMBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF0B801FAF;
	Mon, 23 Mar 2020 15:40:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C15A1001938;
	Mon, 23 Mar 2020 15:40:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10BDF18089CD;
	Mon, 23 Mar 2020 15:39:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NFdm0L003527 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 11:39:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92BC25C28F; Mon, 23 Mar 2020 15:39:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2F8D5C28E;
	Mon, 23 Mar 2020 15:39:45 +0000 (UTC)
Date: Mon, 23 Mar 2020 11:39:44 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200323153944.GA27615@redhat.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323151538.GA27573@redhat.com>
	<69ce4dd2-81d3-0ac6-933b-a1f781836597@suse.de>
MIME-Version: 1.0
In-Reply-To: <69ce4dd2-81d3-0ac6-933b-a1f781836597@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
	dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 23 2020 at 11:26am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> On 3/23/20 4:15 PM, Mike Snitzer wrote:
> >On Mon, Mar 23 2020 at 11:03am -0400,
> >Hannes Reinecke <hare@suse.de> wrote:
> >
> >>Hi Damien,
> >>
> >>as my original plan to upgrade bcache to work for SMR devices
> >>turned out to be more complex than anticipated I went for the
> >>simpler approach and added a 'cache' device for dm-zoned.
> >>It is using a normal device (eg '/dev/pmem0' :-), split it
> >>into zones of the same size of the original SMR device, and
> >>makes those 'virtual' zones avialable to dm-zoned in a similar
> >>manner than the existing 'random write' zoned.
> >>
> >>The implementation is still a bit rough (one would need to add
> >>metadata to the cache device, too), but so far it seems to work
> >>quite well; still running after copying 300GB of data back and forth.
> >>
> >>As usual, comments and reviews are welcome.
> >
> >Not seeing why this needs to be so specialized (natively implemented in
> >dm-zoned).  Did you try stacking dm-writecache on dm-zoned?
> >
> dm-zoned is using the random-write zones internally to stage writes
> to the sequential zones, so in effect it already has an internal
> caching.
> All this patch does is to use a different device for the already present
> mechanism.
> Using dm-writecache would be ignorant of that mechanism, leading to
> double caching and detrimental results.

If dm-writecache were effective at submitting larger IO then dm-zoned
shouldn't be resorting to caching in random-write zones at all -- that
is a big if, so not saying it'll "just work".  But if both layers are
working then it should.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

