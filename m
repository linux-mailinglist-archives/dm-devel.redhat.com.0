Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9565923F3EB
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 22:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596833035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ntVEN9NlZKoc8dC431QDO9Tq2RVyBTtarbQFjrWoxMU=;
	b=grc948NURR1auTOxrMT+BpgT6opG55NHDx5+/tsoXbWjaOnyjkfbAl0U6Ipdl6/Jkgh6n4
	5elaROh5C1TyuCG+R5y5rLw9C3QNxQgI8mRimXcBVc3ds2UdAxjIF1w60Robry1h+BssMb
	zbCKq+hEuRXK4Woa3Q2Kpn6kcydg72M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-x2r4t4eqO62E1clrOXacug-1; Fri, 07 Aug 2020 16:43:50 -0400
X-MC-Unique: x2r4t4eqO62E1clrOXacug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFEE8800685;
	Fri,  7 Aug 2020 20:43:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C34087A6D;
	Fri,  7 Aug 2020 20:43:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D7199693F;
	Fri,  7 Aug 2020 20:43:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 077KePLf010602 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 16:40:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EBD010023A0; Fri,  7 Aug 2020 20:40:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AFCE1001B2C;
	Fri,  7 Aug 2020 20:40:16 +0000 (UTC)
Date: Fri, 7 Aug 2020 16:40:15 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200807204015.GA2178@redhat.com>
References: <20200807160327.GA977@redhat.com>
	<CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>,
	Damien Le Moal <damien.lemoal@wdc.com>, John Dorminy <jdorminy@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block <linux-block@vger.kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.9
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Aug 07 2020 at  4:11pm -0400,
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, Aug 7, 2020 at 9:03 AM Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > - DM crypt improvement to optionally avoid async processing via
> >   workqueues for reads and/or writes -- via "no_read_workqueue" and
> >   "no_write_workqueue" features.  This more direct IO processing
> >   improves latency and throughput with faster storage.  Avoiding
> >   workqueue IO submission for writes (DM_CRYPT_NO_WRITE_WORKQUEUE) is
> >   a requirement for adding zoned block device support to DM crypt.
> 
> Is there a reason the async workqueue isn't removed entirely if it's not a win?
> 
> Or at least made to not be the default.

I haven't assessed it yet.

There are things like rbtree sorting that is also hooked off async, but
that is more meaningful for rotational storage.

> Now it seems to be just optionally disabled, which seems the wrong way
> around to me.
> 
> I do not believe async crypto has ever worked or been worth it.
> Off-loaded crypto in the IO path, yes. Async using a workqueue? Naah.
> 
> Or do I misunderstand?

No, you've got it.

My thinking was to introduce the ability to avoid the workqueue code via
opt-in and then we can evaluate the difference it has on different
classes of storage.

More conservative approach that also allows me to not know the end from
the beginning... this was work driven by others so on this point I
rolled with what was proposed since I personally don't have the answer
(yet) on whether workqueue is actually helpful.  Best to _really_ know
that before removing it.

I'll make a point to try to get more eyes on this to see if it makes
sense to just eliminate the workqueue code entirely (or invert the
default).  Will keep you updated.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

