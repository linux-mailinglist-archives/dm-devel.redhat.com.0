Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D2DD2F89F2
	for <lists+dm-devel@lfdr.de>; Tue, 12 Nov 2019 08:51:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573545088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=acrxNQ/m6ghP7pWw1wEIx4yyhbfY3k3jpJuoX8SYl8k=;
	b=Z3jtwMjlIpcgqvx55NQCfw6zWDQUOMhqlhD/+bZY+rUZVscWiF5JVfZbrkCGHgue7ZvtET
	uqFw/it/gm8PSvfag7WU22CZ+CnbVgVLZ1yoRZ/2XO4GcwkE/IxoFZ11/Pnbx7PyiQc0Ou
	LB0JzMPeQQy9JwMAn/btcDD2cmml3Ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-EIcyrGvqN-y2QORIu32b7w-1; Tue, 12 Nov 2019 02:51:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD56B8064DC;
	Tue, 12 Nov 2019 07:51:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7ED560852;
	Tue, 12 Nov 2019 07:51:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E1AA1803C33;
	Tue, 12 Nov 2019 07:51:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAC7omlq013609 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 Nov 2019 02:50:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 44EF26090A; Tue, 12 Nov 2019 07:50:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 622B360852;
	Tue, 12 Nov 2019 07:50:42 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xAC7oge0031234; Tue, 12 Nov 2019 02:50:42 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xAC7ogaK031230; Tue, 12 Nov 2019 02:50:42 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 12 Nov 2019 02:50:42 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20191112011444.GA32220@redhat.com>
Message-ID: <alpine.LRH.2.02.1911120240020.25757@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1911110811060.28408@file01.intranet.prod.int.rdu2.redhat.com>
	<c9a772e9-e305-cf0b-1155-fb19bdb84e55@arrikto.com>
	<20191112011444.GA32220@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>, linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Scott Wood <swood@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm-snapshot: fix crash with the realtime
	kernel
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
X-MC-Unique: EIcyrGvqN-y2QORIu32b7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable



On Mon, 11 Nov 2019, Mike Snitzer wrote:

> On Mon, Nov 11 2019 at 11:37am -0500,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>=20
> > On 11/11/19 3:59 PM, Mikulas Patocka wrote:
> > > Snapshot doesn't work with realtime kernels since the commit f79ae415=
b64c.
> > > hlist_bl is implemented as a raw spinlock and the code takes two non-=
raw
> > > spinlocks while holding hlist_bl (non-raw spinlocks are blocking mute=
xes
> > > in the realtime kernel, so they couldn't be taken inside a raw spinlo=
ck).
> > >=20
> > > This patch fixes the problem by using non-raw spinlock
> > > exception_table_lock instead of the hlist_bl lock.
> > >=20
> > > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > > Fixes: f79ae415b64c ("dm snapshot: Make exception tables scalable")
> > >=20
> >=20
> > Hi Mikulas,
> >=20
> > I wasn't aware that hlist_bl is implemented as a raw spinlock in the
> > real time kernel. I would expect it to be a standard non-raw spinlock,
> > so everything works as expected. But, after digging further in the real
> > time tree, I found commit ad7675b15fd87f1 ("list_bl: Make list head
> > locking RT safe") which suggests that such a conversion would break
> > other parts of the kernel.
>=20
> Right, the proper fix is to update list_bl to work on realtime (which I
> assume the referenced commit does).  I do not want to take this
> dm-snapshot specific workaround that open-codes what should be done
> within hlist_{bl_lock,unlock}, etc.

If we change list_bl to use non-raw spinlock, it fails in dentry lookup=20
code. The dentry code takes a seqlock (which is implemented as preempt=20
disable in the realtime kernel) and then takes a list_bl lock.

This is wrong from the real-time perspective (the chain in the hash could=
=20
be arbitrarily long, so using non-raw spinlock could cause unbounded=20
wait), however we can't do anything with it.

I think that fixing dm-snapshot is way easier than fixing the dentry code.=
=20
If you have an idea how to fix the dentry code, tell us.

> I'm not yet sure which realtime mailing list and/or maintainers should
> be cc'd to further the inclussion of commit ad7675b15fd87f1 -- Nikos do
> you?
>=20
> Thanks,
> Mike

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

