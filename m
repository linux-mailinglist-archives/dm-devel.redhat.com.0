Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0B320F75E
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593527917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jhlo86IxA+imYv+hrlPBGyG1mMFuLbhNc9HqP7NNB9o=;
	b=EAJX2UckLT62d2QqFBHXeEYZmNo/qhWeJt4oEVlCyog2re2+PNMF4dY48Q3g/kmwgkPkuZ
	G61H/4rPhqgzRQas/QcHq++JbPWLAuNu+LpoqMS3W2p1hZ2xrD/d2QYS0kqOsmiky/UcBw
	pVXZ0ERg7XQR+C/s3417WKzr8ret4Rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-952h1TOSNsuoIBXe719_9A-1; Tue, 30 Jun 2020 10:38:33 -0400
X-MC-Unique: 952h1TOSNsuoIBXe719_9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B386E8015F8;
	Tue, 30 Jun 2020 14:38:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C8A8607A0;
	Tue, 30 Jun 2020 14:38:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E60D41809542;
	Tue, 30 Jun 2020 14:38:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UEbwjY031549 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 10:37:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92B3E741B1; Tue, 30 Jun 2020 14:37:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E33DE7169B;
	Tue, 30 Jun 2020 14:37:52 +0000 (UTC)
Date: Tue, 30 Jun 2020 09:36:33 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Message-ID: <20200630133546.GA20439@redhat.com>
References: <20200630123528.29660-1-msuchanek@suse.de>
	<alpine.LRH.2.02.2006300929580.4801@file01.intranet.prod.int.rdu2.redhat.com>
	<20200630141022.GZ21462@kitsune.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200630141022.GZ21462@kitsune.suse.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Cornelia Huck <cohuck@redhat.com>, Jan Kara <jack@suse.cz>,
	Jakub Staron <jstaron@google.com>, linux-nvdimm@lists.01.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
	Yuval Shaia <yuval.shaia@oracle.com>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm writecache: reject asynchronous pmem.
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jun 30 2020 at 10:10am -0400,
Michal Such=E1nek <msuchanek@suse.de> wrote:

> On Tue, Jun 30, 2020 at 09:32:01AM -0400, Mikulas Patocka wrote:
> >=20
> >=20
> > On Tue, 30 Jun 2020, Michal Suchanek wrote:
> >=20
> > > The writecache driver does not handle asynchronous pmem. Reject it wh=
en
> > > supplied as cache.
> > >=20
> > > Link: https://lore.kernel.org/linux-nvdimm/87lfk5hahc.fsf@linux.ibm.c=
om/
> > > Fixes: 6e84200c0a29 ("virtio-pmem: Add virtio pmem driver")
> > >=20
> > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > ---
> > >  drivers/md/dm-writecache.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> > > index 30505d70f423..57b0a972f6fd 100644
> > > --- a/drivers/md/dm-writecache.c
> > > +++ b/drivers/md/dm-writecache.c
> > > @@ -2277,6 +2277,12 @@ static int writecache_ctr(struct dm_target *ti=
, unsigned argc, char **argv)
> > > =20
> > >  =09=09wc->memory_map_size -=3D (uint64_t)wc->start_sector << SECTOR_=
SHIFT;
> > > =20
> > > +=09=09if (!dax_synchronous(wc->ssd_dev->dax_dev)) {
> > > +=09=09=09r =3D -EOPNOTSUPP;
> > > +=09=09=09ti->error =3D "Asynchronous persistent memory not supported=
 as pmem cache";
> > > +=09=09=09goto bad;
> > > +=09=09}
> > > +
> > >  =09=09bio_list_init(&wc->flush_list);
> > >  =09=09wc->flush_thread =3D kthread_create(writecache_flush_thread, w=
c, "dm_writecache_flush");
> > >  =09=09if (IS_ERR(wc->flush_thread)) {
> > > --=20
> >=20
> > Hi
> >=20
> > Shouldn't this be in the "if (WC_MODE_PMEM(wc))" block?
> That should be always the case at this point.
> >=20
> > WC_MODE_PMEM(wc) retrurns true if we are using persistent memory as a=
=20
> > cache device, otherwise we are using generic block device as a cache=20
> > device.
>
> This is to prevent the situation where we have WC_MODE_PMEM(wc) but
> cannot guarantee consistency because the async flush is not handled.

The writecache operates in 2 modes.  SSD or PMEM.  Mikulas is saying
your dax_synchronous() check should go within a WC_MODE_PMEM(wc) block
because it doesn't make sense to do the check when in SSD mode.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

