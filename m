Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 28A5410F2D9
	for <lists+dm-devel@lfdr.de>; Mon,  2 Dec 2019 23:27:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575325621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SXQZLw7XVYikRRM8k5f/ZHJVkoyAAm3MubbC4rqRX4g=;
	b=ALa5lDqmRppC1wae6492WDa6zoc/uFbikemqM/YOy68zcvi2lERLlGm27FcLUPcfKhSe80
	i7Hdd6iglCX0dd5PXPXvOtSKuGmiqLJQtX+XalH5PQYVzzLdAoX63rrwsuLLRkQnR2ToE8
	QFu9+E7pdJaGqsz3GfWcMK1j8CMmpuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-iY4s79ohOMi_azyJ0tBYEA-1; Mon, 02 Dec 2019 17:27:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B50B3DB2D;
	Mon,  2 Dec 2019 22:26:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 134A267648;
	Mon,  2 Dec 2019 22:26:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9384518089CD;
	Mon,  2 Dec 2019 22:26:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2MQUdY021321 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 17:26:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B94FEED158; Mon,  2 Dec 2019 22:26:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B53C5ED153
	for <dm-devel@redhat.com>; Mon,  2 Dec 2019 22:26:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1673C80207E
	for <dm-devel@redhat.com>; Mon,  2 Dec 2019 22:26:28 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-24-31UKCQGrM9SqtDhIN5otFw-1;
	Mon, 02 Dec 2019 17:26:24 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id 1E6A5A0692;
	Mon,  2 Dec 2019 22:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YnXiFCX4wPNP; Mon,  2 Dec 2019 22:26:01 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id AB13DA0440;
	Mon,  2 Dec 2019 22:26:01 +0000 (UTC)
Date: Mon, 2 Dec 2019 22:26:00 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Joe Thornber <thornber@redhat.com>, JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <6b12137e-411e-0368-518e-41ae54e138e0@linux.alibaba.com>
Message-ID: <alpine.LRH.2.11.1912022002210.11561@mx.ewheeler.net>
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
	<6b12137e-411e-0368-518e-41ae54e138e0@linux.alibaba.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: 31UKCQGrM9SqtDhIN5otFw-1
X-MC-Unique: iY4s79ohOMi_azyJ0tBYEA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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
X-Mimecast-Spam-Score: 0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-844282404-1390322935-1575316954=:11561"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---844282404-1390322935-1575316954=:11561
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Dec 2019, JeffleXu wrote:
> =E5=9C=A8 2019/11/23 =E4=B8=8A=E5=8D=882:55, Joe Thornber =E5=86=99=E9=81=
=93:
>=20
> > On Fri, Nov 22, 2019 at 11:14:15AM +0800, JeffleXu wrote:
> >
> > > The first question is what's the purpose of data cell? In thin_bio_ma=
p(),
> > > normal bio will be packed as a virtual cell and data cell. I can
> > > understand
> > > that virtual cell is used to prevent discard bio and non-discard bio
> > > targeting the same block from being processed at the same time. I fin=
d it
> > > was added in commit =C2=A0=C2=A0=C2=A0 e8088073c9610af017fd47fddd104a=
2c3afb32e8 (dm thin:
> > > fix race between simultaneous io and discards to same block), but I'm
> > > still
> > > confused about the use of data cell.
> > As you are aware there are two address spaces for the locks.  The 'virt=
ual'
> > one
> > refers to cells in the logical address space of the thin devices, and t=
he
> > 'data' one
> > refers to the underlying data device.  There are certain conditions whe=
re we
> > unfortunately need to hold both of these (eg, to prevent a data block b=
eing
> > reprovisioned
> > before an io to it has completed).
> >
> > > The second question is the impact of virtual cell and data cell on IO
> > > performance. If $data_block_size is large for example 1G, in multithr=
ead
> > > fio
> > > test, most bio will be buffered in cell->bios list and then be proces=
sed
> > > by
> > > worker thread asynchronously, even when there's no discard bio. Thus =
the
> > > original parallel IO is processed by worker thread serially now. As t=
he
> > > number of fio test threads increase, the single worker thread can eas=
ily
> > > get
> > > CPU 100%, and thus become the bottleneck of the performance since dm-=
thin
> > > workqueue is ordered unbound.
> > Yep, this is a big issue.  Take a look at dm-bio-prison-v2.h, this is t=
he
> > new interface that we need to move dm-thin across to use (dm-cache alre=
ady
> > uses it).
> > It allows concurrent holders of a cell (ie, read locks), so we'll be ab=
le to
> > remap
> > much more io without handing it off to a worker thread.  Once this is d=
one I
> > want
> > to add an extra field to cells that will cache the mapping, this way if=
 you
> > acquire a
> > cell that is already held then you can avoid the expensive btree lookup=
.
> > Together
> > these changes should make a huge difference to the performance.
> >
> > If you've got some spare coding cycles I'd love some help with this ;)

Hi Joe,

I'm not sure if I will have the time but thought I would start the=20
research and ask a few questions. I looked at the v1/v2 .h files and some=
=20
of the functions just change suffix to _v2 and maybe calling=20
convention/structure field changes.

However, there appear to be some design changes, too:

* dm_deferred_set - These appear to be used a bit in dm-thin.c. =20
The dm_deferred_set calls don't seem to reference anything prison-related,=
=20
but they are defined in dm-bio-prison-v1.h.  Can you provide direction on=
=20
how these would be refactored, or if they can just remain as-is?
  Call counts in dm-thin.c:
      2 dm_deferred_entry_dec
      2 dm_deferred_set_create
      3 dm_deferred_entry_inc
      3 dm_deferred_set_add_work
      4 dm_deferred_set_destroy

* dm_bio_detain - is this replaced by dm_cell_get_v2?
=09- It looks like dm_bio_detain() returns 1 if already held, but=20
=09  dm_cell_get_v2() returns true if the lock is granted.  How might=20
=09  this be handled?
=09- What are the lock_levels?
=09- What in dm-thin.c would then call dm_cell_put_v2?

* dm_cell_release(_no_holder) - is this replaced by dm_cell_unlock_v2?
=09- How would the _no_holder version be refactored?

* dm_cell_visit_release - This function uses a callback, but none of the=20
v2 functions have such a callback.  Do we need to write a helper function=
=20
with get/unlock(?) around the cell?


* dm_cell_error - no equivalent v2 implementation.  Suggestions?


What other considerations might there be in the v2 port?

Thanks!

--
Eric Wheeler


> >
> > - Joe
> >
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel
>=20
>=20
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 
---844282404-1390322935-1575316954=:11561
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
---844282404-1390322935-1575316954=:11561--

