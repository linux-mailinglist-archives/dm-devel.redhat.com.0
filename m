Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3C8F85E3
	for <lists+dm-devel@lfdr.de>; Tue, 12 Nov 2019 02:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573521328;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vQbwzMdKUday/BshbepOMv649rfC6LOUmQB8QEImlCU=;
	b=i2weaOxJkjEr6cuaD0YRb+QMfkdSILg1G8PujkPdUwJ51ld6AIwl+W5TpUnhYussZOcV6N
	1dYlvf1LPzyGIq4ZOuJkkSzhXkHCsqjg7609xjn8eWiXiL34jQ2EnJY5XEOazN4RKzlopY
	cuny1W3/61RiFjWxlHohh5vQwvN23zY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-B9fMxTYWOeecLk8CIdYSRg-1; Mon, 11 Nov 2019 20:15:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4184B107ACC4;
	Tue, 12 Nov 2019 01:15:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27AB9100EBAC;
	Tue, 12 Nov 2019 01:15:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3E424BB65;
	Tue, 12 Nov 2019 01:15:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAC1EmhV024780 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 Nov 2019 20:14:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82B8E5D9D6; Tue, 12 Nov 2019 01:14:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A345D9CA;
	Tue, 12 Nov 2019 01:14:45 +0000 (UTC)
Date: Mon, 11 Nov 2019 20:14:44 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191112011444.GA32220@redhat.com>
References: <alpine.LRH.2.02.1911110811060.28408@file01.intranet.prod.int.rdu2.redhat.com>
	<c9a772e9-e305-cf0b-1155-fb19bdb84e55@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <c9a772e9-e305-cf0b-1155-fb19bdb84e55@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Scott Wood <swood@redhat.com>, Ilias Tsitsimpis <iliastsi@arrikto.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: B9fMxTYWOeecLk8CIdYSRg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Nov 11 2019 at 11:37am -0500,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> On 11/11/19 3:59 PM, Mikulas Patocka wrote:
> > Snapshot doesn't work with realtime kernels since the commit f79ae415b6=
4c.
> > hlist_bl is implemented as a raw spinlock and the code takes two non-ra=
w
> > spinlocks while holding hlist_bl (non-raw spinlocks are blocking mutexe=
s
> > in the realtime kernel, so they couldn't be taken inside a raw spinlock=
).
> >=20
> > This patch fixes the problem by using non-raw spinlock
> > exception_table_lock instead of the hlist_bl lock.
> >=20
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Fixes: f79ae415b64c ("dm snapshot: Make exception tables scalable")
> >=20
>=20
> Hi Mikulas,
>=20
> I wasn't aware that hlist_bl is implemented as a raw spinlock in the
> real time kernel. I would expect it to be a standard non-raw spinlock,
> so everything works as expected. But, after digging further in the real
> time tree, I found commit ad7675b15fd87f1 ("list_bl: Make list head
> locking RT safe") which suggests that such a conversion would break
> other parts of the kernel.

Right, the proper fix is to update list_bl to work on realtime (which I
assume the referenced commit does).  I do not want to take this
dm-snapshot specific workaround that open-codes what should be done
within hlist_{bl_lock,unlock}, etc.

I'm not yet sure which realtime mailing list and/or maintainers should
be cc'd to further the inclussion of commit ad7675b15fd87f1 -- Nikos do
you?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

