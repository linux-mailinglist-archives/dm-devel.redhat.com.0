Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5F69A277754
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:00:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600966857;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e8DMbkUiyvoluYB85JfhtbUgHboufzqNrYyR4PO3xaQ=;
	b=e0voxIHsK0L9ySqJiHoCsT3/TfKiNtazmlB1ndMrtG/0LViUceUmbX4lbQ30kWwYByCeUu
	jd/tGT5wU5HrNSYKscaG6/Pqr70lbvTtPX1+iNagn1kL4x7FoAat3GL3BNqRxxqzQAOb6n
	BhHmbs4hHJvsTOGRRUQKHXOMVTIyQDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-lKYmTUUQMy2nYjgxf2fGVQ-1; Thu, 24 Sep 2020 13:00:55 -0400
X-MC-Unique: lKYmTUUQMy2nYjgxf2fGVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F168D8D210F;
	Thu, 24 Sep 2020 17:00:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11FE319746;
	Thu, 24 Sep 2020 17:00:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26D941826D2A;
	Thu, 24 Sep 2020 17:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGwKDf020623 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:58:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8ED7E5C22B; Thu, 24 Sep 2020 16:58:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2083D5C1C7;
	Thu, 24 Sep 2020 16:58:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OGwD64031145; Thu, 24 Sep 2020 12:58:13 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OGwDta031142; Thu, 24 Sep 2020 12:58:13 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 12:58:13 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: John Dorminy <jdorminy@redhat.com>
In-Reply-To: <CAMeeMh87GLea=7_4qGuPhMj0WKnB-596HzkKQDafLirHiBpSzQ@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2009241250280.28814@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh87GLea=7_4qGuPhMj0WKnB-596HzkKQDafLirHiBpSzQ@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	device-mapper development <dm-devel@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-raid: stack limits instead of overwriting
 them.
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 24 Sep 2020, John Dorminy wrote:

> I don't understand how this works...
> 
> Can chunk_size_bytes be 0? If not, how is discard_granularity being set to 0?

Yes - chunk_size_bytes is 0 here.

> I think also limits is local to the ti in question here, initialized
> by blk_set_stacking_limits() via dm-table.c, and therefore has only
> default values and not anything to do with the underlying queue. So

In dm_calculate_queue_limits, there's
	blk_set_stacking_limits(limits);
- that will initialize the default limits (discard_granularity == 0)

Then, there's:
	ti->type->iterate_devices(ti, dm_set_device_limits, &ti_limits);
- that will unify limits for all RAID legs (in this case, it sets 
discard_granularity == 1024)

Then, there's
	if (ti->type->io_hints) ti->type->io_hints(ti, &ti_limits);
And that will incorrectly overwrite discard_granularity with zero.

> setting discard_granularity=max(discard_granularity, chunk_size_bytes)
> doesn't seem like it should be working, unless I'm not understanding
> what it's there for...
> 
> And shouldn't melding in the target's desired io_hints into the
> existing queue limits be happening in blk_stack_limits() instead?
> (Also, it does lcm_not_zero() for stacking granularity, instead of
> max()...)

Well, you can add blk_stack_limits to raid_io_hints and use it to stack 
the limits, but that would just complicate that function.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

