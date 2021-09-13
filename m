Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4960540975C
	for <lists+dm-devel@lfdr.de>; Mon, 13 Sep 2021 17:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631547187;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FFq5WMncJlKuLxWqUQI1RWmhfW7YLjzzNK71qEXzm88=;
	b=CiqcaAaLWMIAR03v0tpCp6ABRQItTp04qv86rLEkctod2LyZgmSRTuAnq59mep7NI6I3sa
	2ZX0wEeQc+DX402GYCF62Cmsa8nzvfETuyh7sDAfBHlAtfi+/VLpS3cCGA39zlwphfs6So
	WXYvu/eHykak9Pr99c6GhVgHHC6QdIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-avJSjE7wM_ygqBTPzn8R_w-1; Mon, 13 Sep 2021 11:33:05 -0400
X-MC-Unique: avJSjE7wM_ygqBTPzn8R_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77973802CBD;
	Mon, 13 Sep 2021 15:32:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9BCA6D987;
	Mon, 13 Sep 2021 15:32:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 718604E58F;
	Mon, 13 Sep 2021 15:32:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18DFWfGN026348 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Sep 2021 11:32:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBDD16A8F5; Mon, 13 Sep 2021 15:32:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0BA35D6A8;
	Mon, 13 Sep 2021 15:32:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18DFWeCj022950; 
	Mon, 13 Sep 2021 10:32:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18DFWdSJ022949;
	Mon, 13 Sep 2021 10:32:39 -0500
Date: Mon, 13 Sep 2021 10:32:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210913153239.GL3087@octiron.msp.redhat.com>
References: <c0ee4284-c2af-e7d4-29c0-fc800a8d2c94@huawei.com>
	<d8fa8e17f4ec92eba1e51c1054283688b294c9f0.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <d8fa8e17f4ec92eba1e51c1054283688b294c9f0.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH v2] multipathd: fix missing persistent
 reseravtion for active path
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 09:01:11AM +0200, Martin Wilck wrote:
> Hello lixiaokeng,
>=20
> On Mon, 2021-09-13 at 10:43 +0800, lixiaokeng wrote:
> > There are two paths(sucu as sda and adb) for one LUN. The two
> > paths log in, but before the two uevents have been processed
> > (for example there are many uevent), users use multipathd add
> > path /dev/sda to cause mpatha and use mpathpersist -o -I to
> > register prkey for mpatha. The add map uevent is after add path
> > uevent, the the uevent(add sdb) will delay and missing persistent
> > reseravtion check.
> >=20
> > Here, we add persistent reseravtion check in update_map() which
> > is called ev_add_map().
> >=20
> > Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
>=20
> Thank you, this looks ok to me. Have you tested it?
>=20
> I'll wait for Ben's opinion nonetheless, because he's more exprerienced
> with this part of the code than myself.
>=20
> This said, I would like to have multipathd record which paths have
> already registered the key, to avoid doing that repeatedly.
>
Other than adding this, the patch looks fine.
=20
> Additional question to Ben in this context: what's the reason that we
> don't actively register keys (that we found in multipath.conf or
> prkeys) during multipathd startup / reconfigure?

Like I said in my reply to the first patch, the goal was to make
persitent reservations to multipath devices work just like with scsi
devices.

-Ben

> Regards
> Martin
>=20
>=20
>=20
> > ---
> > =A0multipathd/main.c | 11 +++++++++++
> > =A01 file changed, 11 insertions(+)
> >=20
> > diff --git a/multipathd/main.c b/multipathd/main.c
> > index 3aff241d..1defeaf1 100644
> > --- a/multipathd/main.c
> > +++ b/multipathd/main.c
> > @@ -490,6 +490,8 @@ update_map (struct multipath *mpp, struct vectors
> > *vecs, int new_map)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0int retries =3D 3;
> > =A0=A0=A0=A0=A0=A0=A0=A0char *params __attribute__((cleanup(cleanup_cha=
rp))) =3D NULL;
> > +=A0=A0=A0=A0=A0=A0=A0struct path *pp;
> > +=A0=A0=A0=A0=A0=A0=A0int i;
> >=20
> > =A0retry:
> > =A0=A0=A0=A0=A0=A0=A0=A0condlog(4, "%s: updating new map", mpp->alias);
> > @@ -502,6 +504,15 @@ retry:
> > =A0=A0=A0=A0=A0=A0=A0=A0verify_paths(mpp);
> > =A0=A0=A0=A0=A0=A0=A0=A0mpp->action =3D ACT_RELOAD;
> >=20
> > +=A0=A0=A0=A0=A0=A0=A0if (mpp->prflag) {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0vector_foreach_slot(mpp->=
paths, pp, i) {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0i=
f ((pp->state =3D=3D PATH_UP)=A0 || (pp->state =3D=3D
> > PATH_GHOST)) {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0/* persistent reseravtion check*/
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0mpath_pr_event_handle(pp);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > +=A0=A0=A0=A0=A0=A0=A0}
> > +
> > =A0=A0=A0=A0=A0=A0=A0=A0if (setup_map(mpp, &params, vecs)) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0condlog(0, "%s: failed =
to setup new map in update",
> > mpp->alias);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0retries =3D -1;
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

