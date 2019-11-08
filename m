Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 97DB0F4B99
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 13:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573216331;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y0IHlL8Q3kO5CivN1jOuoHaKia2osfk/XREaa9oiECY=;
	b=JEDGWWnhkvEe3g++Dv2F5bHy6s1PQ1rbFS6TuROVAGKc0JN7RJ5Erq6yXK/hQbPXigKVeO
	wT+odPGQrfCj0uHuD5nwxOiRgbJ11ZKXVx04/sZOb5cBndTNJSX2qCPq10urMZRuCMwrux
	2/H2cq9e15BRc4imBMUvyFG/FdhWQYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-_80QfvKZNOKwiee8VSyV-w-1; Fri, 08 Nov 2019 07:32:09 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38F035EA;
	Fri,  8 Nov 2019 12:32:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043361001B39;
	Fri,  8 Nov 2019 12:32:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19D634BB65;
	Fri,  8 Nov 2019 12:31:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8CVmHf001845 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 07:31:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 846461001DC2; Fri,  8 Nov 2019 12:31:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEFA31001902;
	Fri,  8 Nov 2019 12:31:45 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xA8CVjPD004476; Fri, 8 Nov 2019 07:31:45 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xA8CViNb004472; Fri, 8 Nov 2019 07:31:44 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 8 Nov 2019 07:31:44 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Alessio Balsini <balsini@android.com>
In-Reply-To: <20191104164900.GA10934@google.com>
Message-ID: <alpine.LRH.2.02.1911080723130.3392@file01.intranet.prod.int.rdu2.redhat.com>
References: <20191025101624.GA61225@google.com>
	<alpine.LRH.2.02.1910290957220.25731@file01.intranet.prod.int.rdu2.redhat.com>
	<20191104164900.GA10934@google.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, elsk@google.com,
	dm-devel@redhat.com, dvander@google.com, kernel-team@android.com,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-snapshot for system updates in Android
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
X-MC-Unique: _80QfvKZNOKwiee8VSyV-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable



On Mon, 4 Nov 2019, Alessio Balsini wrote:

> > > -- Alignment
> > >=20
> > > Our approach follows the solution proposed by Mikulas [1].
> > > Being the block alignment of file extents automatically managed by th=
e
> > > filesystem, using FIEMAP should have no alignment-related performance=
 issue.
> > > But in our implementation we hit a misalignment [2] branch which lead=
s to
> > > dmwarning messages [3, 4].
> > >=20
> > > I have a limited experience with the block layer and dm, so I'm still
> > > struggling in finding the root cause for this, either in user space o=
r kernel
> > > space.
> >=20
> > I don't know. What is the block size of the filesystem? Are all mapping=
s=20
> > aligned to this block size?
>=20
> Here follows a just generated warning coming from a Pixel 4 kernel (4.14)=
:
>=20
> [ 3093.443808] device-mapper: table: 253:16: adding target device dm-15
> caused an alignment inconsistency: physical_block_size=3D4096,
> logical_block_size=3D4096, alignment_offset=3D61440, start=3D0
>=20
> Does this contain all the info you asked for?

Look at the function blk_stack_limits - it has various checks that make it=
=20
return -1. Insert some debugging printk's there and find out which check=20
made the function return -1.

Based on this, we can find out which of the limits triggered the error=20
message.

> I started investigating this issue, but since we didn't notice any
> performance degradation, I prioritized other things. I'll be hopefully
> able to get back to this warning in the next months.
> Please let me know if I can help you with that or if you need additional
> information.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

