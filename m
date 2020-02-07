Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 77D8E155D4E
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 19:04:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581098680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5SWbdzNgJLj3mtbBK7IYetU1c/Ei761l5RnpYTwSMKI=;
	b=b8GvUyOdTmmjJVwpDVVPmr1cqSURNSwKooth52BD3kXdbsVL2PJSOBU+Iv8UQUFPXvMo7b
	+NgFSBarEc1nLKXJ3VLCJWslQ8HVquKA8SwHXA+nA8wfUbYKufWqyK/vNS6xI8CzsUV/Rl
	6rjojl8NrArmn2GzVWmAM6daCYox8T0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-JJ9FYwmHPI-c_pp-GkeC2w-1; Fri, 07 Feb 2020 13:04:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A43E10054E3;
	Fri,  7 Feb 2020 18:04:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53E2F8E9EA;
	Fri,  7 Feb 2020 18:04:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8885A18089C8;
	Fri,  7 Feb 2020 18:04:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017I4KGw013248 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 13:04:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AF1812637B; Fri,  7 Feb 2020 18:04:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C1E51FE07;
	Fri,  7 Feb 2020 18:04:15 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 017I4FgX008685; Fri, 7 Feb 2020 13:04:15 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 017I4FIg008681; Fri, 7 Feb 2020 13:04:15 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 7 Feb 2020 13:04:15 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: John Dorminy <jdorminy@redhat.com>
In-Reply-To: <CAMeeMh-8MN=Jf4YhJ+Vx9-=Xa84EAPuDFyUk+jNU7ChB_EJ-6Q@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2002071259240.7925@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2002071143390.32552@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh-8MN=Jf4YhJ+Vx9-=Xa84EAPuDFyUk+jNU7ChB_EJ-6Q@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Heinz Mauelshagen <heinzm@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-bufio: implement discard
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
X-MC-Unique: JJ9FYwmHPI-c_pp-GkeC2w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 7 Feb 2020, John Dorminy wrote:

> > +/*
> > + * Free the specified range of buffers. If a buffer is held by other process, it
> > + * is not freed. If a buffer is dirty, it is discarded without writeback.
> > + * Finally, send the discard request to the device.
> Might be clearer to say "After freeing, send a discard request for the
> specified range to the device." to clarify that it's all cases, not
> just the dirty-buffer case mentioned in the previous sentence.
> 
> > + */
> > +int dm_bufio_discard_buffers(struct dm_bufio_client *c, sector_t block, sector_t count)
> > +{
> > +       sector_t i;
> > +
> > +       for (i = block; i < block + count; i++) {
> > +               struct dm_buffer *b;
> > +               dm_bufio_lock(c);
> > +               b = __find(c, i);
> > +               if (b && likely(!b->hold_count)) {
> > +                       wait_on_bit_io(&b->state, B_READING, TASK_UNINTERRUPTIBLE);
> > +                       wait_on_bit_io(&b->state, B_WRITING, TASK_UNINTERRUPTIBLE);
> > +                       __unlink_buffer(b);
> > +                       __free_buffer_wake(b);
> > +               }
> > +               dm_bufio_unlock(c);
> > +       }
> > +
> > +       return dm_bufio_issue_discard(c, block, count);
> > +}
> > +EXPORT_SYMBOL_GPL(dm_bufio_discard_buffers);
> 
> This seems dangerous -- if another process is holding the buffer, you
> could be issuing a discard while they are reading or writing, or vice
> versa.
> 
> Discards whose lifetime overlaps with the lifetime of a read or write
> to the same region have undefined behavior, as far as I know.

So the user should not do it. I don't see a problem with it. If the user 
sends two ovelapping writes, it is unspecified which of them stays on the 
device. If the user sends a read with overlapping write, it is unspecified 
if the read returns the old data or the new data.

It's the same with overlapping discards and other I/Os.

> Perhaps dm_bufio_issue_discard() should allow the caller to specify a
> callback, in which case dm_bufio_discard_buffers could unlock any
> buffers in the range upon completion; or dm_bufio_discard_buffers
> should not issue discards for blocks held by other processes.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

