Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 845F61581CE
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 18:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581357330;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VNtkKZA1lkLPfZKeo+8nO/4YlKvBFBgS7zxzlq1pOmU=;
	b=YhHq/Lks0dE2Rno4tjZS956QM+NbgKQF/CbnWk7742I9ayKxew8bpGI5uqGImsIRjT3cCA
	NKRE34Dt91ksucVbjdr9g6HiaKGhiC7Ulz4ACukMYWAP5NOpcMJX7R9+LOOuHFbPv5JZQ0
	ie8hiE8usrEToeAw288OhvGSiQzWKxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-4BHg5e0EOPm0TzdB3jysqw-1; Mon, 10 Feb 2020 12:55:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A21C218AB2C6;
	Mon, 10 Feb 2020 17:55:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B872B5D9CA;
	Mon, 10 Feb 2020 17:55:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 779BB8175A;
	Mon, 10 Feb 2020 17:55:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AHsw17030853 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 12:54:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C6C2AF9B2; Mon, 10 Feb 2020 17:54:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87CDBAF9AB
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 17:54:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6CA6800F49
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 17:54:54 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-416-o4I7qfblO2CseS9KLSRNEQ-1; Mon, 10 Feb 2020 12:54:53 -0500
Received: by mail-qv1-f69.google.com with SMTP id p3so5471709qvt.9
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 09:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eZN2fK2oClgxOyiMPCNiDXUFp65EWPWr57ac6gCOb4s=;
	b=eElcic9CO5P1bs67L7POk7Cv5UV0IJKRrAo+IIEgGQdUGJ/oReVdLmelTKLI0UGrU9
	DAtZkeG/HG8uFKv1jQXmnnMNJ2t4hRIwK1ZpVBIkDHtGuvt06L2ffz16OY8IIiAemC/T
	nNyli/L3QojV9fi9Qc+eAz0P8WrqUZbB9dyWzrdxRJ01VUYFLPg3LB6CkUKRdT6n/cQH
	/N7db7SPAKrFZjnuwXSi81669+nFBQzn8teo/HjdlRMd/n6jP2h80UsMFJx1vQi9P6Ga
	/9eOZ2eYbMSbtMCYd3sPbdkVFrTPkxxpepvyC2Z43IX4I4rMsOhwlAfJPa5bww6ukjDF
	NAwA==
X-Gm-Message-State: APjAAAWQ1S4k0HdYjPdtdMGR1ZEhoFdQ5Ct6Gv1PLTgh5FVFmFapaAXS
	XF6MgMrumP8Gsx8kr6vwxtuMn35QwcDLY8lg0NxDqqorEV8XZQdc07G7By27sM55x1GKimSJJUC
	A8/XZGJkmrv5TPH1zvOJ54DI3HR1K1Xs=
X-Received: by 2002:a37:89c7:: with SMTP id l190mr2502570qkd.498.1581357292565;
	Mon, 10 Feb 2020 09:54:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyShGKr+8VNRNM4+Nk7FMeLCzMGuCY/mbylnu+GVt44lC3XctltLuOSnDlML2c/6UaApXEfSE6JKo30avusFQc=
X-Received: by 2002:a37:89c7:: with SMTP id l190mr2502551qkd.498.1581357292310;
	Mon, 10 Feb 2020 09:54:52 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2002071143390.32552@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh-8MN=Jf4YhJ+Vx9-=Xa84EAPuDFyUk+jNU7ChB_EJ-6Q@mail.gmail.com>
	<alpine.LRH.2.02.2002071259240.7925@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh-r9Hxj+FCxg510wrfYb=Hhnz2wVbxLHfjVTz3i23XHHA@mail.gmail.com>
	<alpine.LRH.2.02.2002071456370.16613@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2002071456370.16613@file01.intranet.prod.int.rdu2.redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Mon, 10 Feb 2020 12:54:41 -0500
Message-ID: <CAMeeMh-ZP04_YCXLaJ7s8AQ7w-uhzFL7sd320OVr2gY8HmCbgA@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-MC-Unique: o4I7qfblO2CseS9KLSRNEQ-1
X-MC-Unique: 4BHg5e0EOPm0TzdB3jysqw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01AHsw17030853
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yeah, that's a great point. Now that I've reviewed the code a little
more, I understand how it's not safe to do the thing I described in
the first place, and how this change is safe and correct.

Please feel free to add my

Reviewed-by: John Dorminy <jdorminy@redhat.com>

Thanks!


On Fri, Feb 7, 2020 at 3:07 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Fri, 7 Feb 2020, John Dorminy wrote:
>
> > There's no obvious way for the other process to wait for the discard
> > to be complete at the present time, though -- suppose there were two
> > holders of a given buffer, and one decided to discard -- how will the
> > second one to wait for the discard to complete, or even tell that it's
> > currently being discarded from another thread? I would naively guess
> > that __write_dirty_buffer() waits via wait_on_bit_io(&b->state,
> > B_WRITING, ...) to make sure nobody else is doing IO on the buffer
> > location at the moment, but a discard doesn't currently set that bit,
> > as far as I can see.
> >
> > (If there is a way to wait, perhaps it should be documented at
> > dm_bufio_discard_buffers() -- "If there is another process holding the
> > buffer, the other process should be sure to [do stuff] before issuing
> > a write, lest the write potentially be dropped or corrupted."
>
> If two processes write to the same buffer, it is undefined behavior. If
> both of them do this:
>         1) dm_bufio_get
>         2) ... write to the buffer
>         3) dm_bufio_mark_buffer_dirty
>         4) dm_bufio_release
> it is undefined what data the buffer would hold. It can even hold mixture
> of data written by those two processes. You must design your code in such
> a way that this doesn't happen.
>
> The same is with discards - if you want to use them, you must design your
> code so that it doesn't overlay discards with other I/O. If you can't
> design it this way, then don't use discard.
>
> Mikulas
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

