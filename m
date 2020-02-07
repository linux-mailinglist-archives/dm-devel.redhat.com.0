Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4F76F155E50
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 19:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581100811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9If4/BOIv15Tj7SnKsDtvHulT3HBftywFeIypFKTgvM=;
	b=ISzsc5uVjYHmz1BOC5p+gdEFZF4Ih8jrEs9mq5i+Ichn4O9TpQviaDtLc97wOE1k2Xo+uu
	b47Yo1dqyT1laHc0z3+iVikmrYevgYi+pdXqufucP9TaXiSW3VFw7nM+GzYZqIEu5SWFTY
	0lg5FJqxNAxyl7BFkAJL2DPm508uEgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-XCrfbM6QPxKZQcjOVRXT4g-1; Fri, 07 Feb 2020 13:40:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3DFD8018A1;
	Fri,  7 Feb 2020 18:40:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C32E261B1;
	Fri,  7 Feb 2020 18:39:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A07C866B5;
	Fri,  7 Feb 2020 18:39:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017IdgG4014526 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 13:39:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E8EB4884F0; Fri,  7 Feb 2020 18:39:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E36E2109950
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 18:39:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD79B1011A68
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 18:39:39 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-396--87_yzfUO16J5fhETDw2Bw-1; Fri, 07 Feb 2020 13:39:38 -0500
Received: by mail-qt1-f199.google.com with SMTP id c10so101825qtk.18
	for <dm-devel@redhat.com>; Fri, 07 Feb 2020 10:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FFlrvHzvXD+0icwkCi5nb58Lvc5XMfsEdPwOyQH9iiQ=;
	b=DO6yDvnkmDxcyMMMSsts9r1Wib1wVijDQRRw7mkDixrwZ/g+KcgEBE/sIIcSjPTz9Z
	dlcWdc5VPNC10hOI3mj+HLM54k442ATdMLAVc13Ea8H6uI7gOLOx1goo0929MG6dSQHJ
	a0gknutaZ/VHBTB4xBN9QYbK1hCi52EfGTBnTQqwPe1wEV1kKQ8cJlBrIIYJfhSPx1Bq
	SsxVdxJLB3T56xVXZAx/S1k54yXNFv7tQCr9gK4zx/mu+W8CKY6JC7Xgfv/Cs6uELwrD
	mPyCWmvcHqLnd92ya42i4jCDeZR5U7qgMHx8bGjd9EUmZFOQ/4dXDWwlp8IU16nV2dsz
	vRQA==
X-Gm-Message-State: APjAAAVpUM+/fhGxhhRoq07QhXJkLSGp1Wb4CdQrp1qZYaaH2bT5PQfv
	VBagToi4VG8fm8Ooo/+4n9dLg3+rtyuyvU7sXcV7+YfZtiXcngjCKcuVzC+S+HHn5HzeSZ+C9At
	R5gvELaFTLvRQD2GcVkYXQmom+2HO1gU=
X-Received: by 2002:ac8:430c:: with SMTP id z12mr145567qtm.299.1581100777558; 
	Fri, 07 Feb 2020 10:39:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzIMfycEhtwn1QEeH0nzuHdSIIIJZCCRwC7WYsE0D3KR/OZw/wVe4JyiuD2w+IpLAOnQ/yttt1kF4t0TJws/hE=
X-Received: by 2002:ac8:430c:: with SMTP id z12mr145539qtm.299.1581100777280; 
	Fri, 07 Feb 2020 10:39:37 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2002071143390.32552@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh-8MN=Jf4YhJ+Vx9-=Xa84EAPuDFyUk+jNU7ChB_EJ-6Q@mail.gmail.com>
	<alpine.LRH.2.02.2002071259240.7925@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2002071259240.7925@file01.intranet.prod.int.rdu2.redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Fri, 7 Feb 2020 13:39:26 -0500
Message-ID: <CAMeeMh-r9Hxj+FCxg510wrfYb=Hhnz2wVbxLHfjVTz3i23XHHA@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-MC-Unique: -87_yzfUO16J5fhETDw2Bw-1
X-MC-Unique: XCrfbM6QPxKZQcjOVRXT4g-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017IdgG4014526
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 7, 2020 at 1:04 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Fri, 7 Feb 2020, John Dorminy wrote:
>
> > > +/*
> > > + * Free the specified range of buffers. If a buffer is held by other process, it
> > > + * is not freed. If a buffer is dirty, it is discarded without writeback.
> > > + * Finally, send the discard request to the device.
> > Might be clearer to say "After freeing, send a discard request for the
> > specified range to the device." to clarify that it's all cases, not
> > just the dirty-buffer case mentioned in the previous sentence.
> >
> > > + */
> > > +int dm_bufio_discard_buffers(struct dm_bufio_client *c, sector_t block, sector_t count)
> > > +{
> > > +       sector_t i;
> > > +
> > > +       for (i = block; i < block + count; i++) {
> > > +               struct dm_buffer *b;
> > > +               dm_bufio_lock(c);
> > > +               b = __find(c, i);
> > > +               if (b && likely(!b->hold_count)) {
> > > +                       wait_on_bit_io(&b->state, B_READING, TASK_UNINTERRUPTIBLE);
> > > +                       wait_on_bit_io(&b->state, B_WRITING, TASK_UNINTERRUPTIBLE);
> > > +                       __unlink_buffer(b);
> > > +                       __free_buffer_wake(b);
> > > +               }
> > > +               dm_bufio_unlock(c);
> > > +       }
> > > +
> > > +       return dm_bufio_issue_discard(c, block, count);
> > > +}
> > > +EXPORT_SYMBOL_GPL(dm_bufio_discard_buffers);
> >
> > This seems dangerous -- if another process is holding the buffer, you
> > could be issuing a discard while they are reading or writing, or vice
> > versa.
> >
> > Discards whose lifetime overlaps with the lifetime of a read or write
> > to the same region have undefined behavior, as far as I know.
>
> So the user should not do it. I don't see a problem with it. If the user
> sends two ovelapping writes, it is unspecified which of them stays on the
> device. If the user sends a read with overlapping write, it is unspecified
> if the read returns the old data or the new data.

There's no obvious way for the other process to wait for the discard
to be complete at the present time, though -- suppose there were two
holders of a given buffer, and one decided to discard -- how will the
second one to wait for the discard to complete, or even tell that it's
currently being discarded from another thread? I would naively guess
that __write_dirty_buffer() waits via wait_on_bit_io(&b->state,
B_WRITING, ...) to make sure nobody else is doing IO on the buffer
location at the moment, but a discard doesn't currently set that bit,
as far as I can see.

(If there is a way to wait, perhaps it should be documented at
dm_bufio_discard_buffers() -- "If there is another process holding the
buffer, the other process should be sure to [do stuff] before issuing
a write, lest the write potentially be dropped or corrupted."


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

