Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 23C28155F0B
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 21:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581106070;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yR8ffpELW3A3J8co54zEAQXdo8XC3GMZe+YnOm9ZRT0=;
	b=Q3PZu2Ea9nafnefm0mHFr4pWS6K4oxN4s9AA8KzNL84kO3QhvY7KjbUljjC+C8erqBW9Aw
	T6At8NAI+WVu/r01OrPIEJv5IoZhYUh3so+hX5DMozjBmLelLz8d9rHM4+0a30h16S7U7i
	/YViPSbvCHM5mdvIuM+qM1/GE+Cib2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-UDXVnG7AM9W3a9sk0Vacqw-1; Fri, 07 Feb 2020 15:07:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B233E800D5C;
	Fri,  7 Feb 2020 20:07:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 110155C21A;
	Fri,  7 Feb 2020 20:07:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3C7818089C8;
	Fri,  7 Feb 2020 20:07:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017K7AUV018090 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 15:07:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C92722654D; Fri,  7 Feb 2020 20:07:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 413E419C7F;
	Fri,  7 Feb 2020 20:07:05 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 017K75uQ020428; Fri, 7 Feb 2020 15:07:05 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 017K75ju020424; Fri, 7 Feb 2020 15:07:05 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 7 Feb 2020 15:07:05 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: John Dorminy <jdorminy@redhat.com>
In-Reply-To: <CAMeeMh-r9Hxj+FCxg510wrfYb=Hhnz2wVbxLHfjVTz3i23XHHA@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2002071456370.16613@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2002071143390.32552@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh-8MN=Jf4YhJ+Vx9-=Xa84EAPuDFyUk+jNU7ChB_EJ-6Q@mail.gmail.com>
	<alpine.LRH.2.02.2002071259240.7925@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh-r9Hxj+FCxg510wrfYb=Hhnz2wVbxLHfjVTz3i23XHHA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: UDXVnG7AM9W3a9sk0Vacqw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 7 Feb 2020, John Dorminy wrote:

> There's no obvious way for the other process to wait for the discard
> to be complete at the present time, though -- suppose there were two
> holders of a given buffer, and one decided to discard -- how will the
> second one to wait for the discard to complete, or even tell that it's
> currently being discarded from another thread? I would naively guess
> that __write_dirty_buffer() waits via wait_on_bit_io(&b->state,
> B_WRITING, ...) to make sure nobody else is doing IO on the buffer
> location at the moment, but a discard doesn't currently set that bit,
> as far as I can see.
> 
> (If there is a way to wait, perhaps it should be documented at
> dm_bufio_discard_buffers() -- "If there is another process holding the
> buffer, the other process should be sure to [do stuff] before issuing
> a write, lest the write potentially be dropped or corrupted."

If two processes write to the same buffer, it is undefined behavior. If 
both of them do this:
	1) dm_bufio_get
	2) ... write to the buffer
	3) dm_bufio_mark_buffer_dirty
	4) dm_bufio_release
it is undefined what data the buffer would hold. It can even hold mixture 
of data written by those two processes. You must design your code in such 
a way that this doesn't happen.

The same is with discards - if you want to use them, you must design your 
code so that it doesn't overlay discards with other I/O. If you can't 
design it this way, then don't use discard.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

