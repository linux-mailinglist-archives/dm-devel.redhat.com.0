Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 703483026A9
	for <lists+dm-devel@lfdr.de>; Mon, 25 Jan 2021 16:05:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Kzg_C6rnNm6Of7xqEE1RPg-1; Mon, 25 Jan 2021 10:05:25 -0500
X-MC-Unique: Kzg_C6rnNm6Of7xqEE1RPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C991100976A;
	Mon, 25 Jan 2021 15:05:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E91C105C736;
	Mon, 25 Jan 2021 15:04:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCE5E4E58F;
	Mon, 25 Jan 2021 15:04:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PF4Znu010611 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 10:04:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 801542026D35; Mon, 25 Jan 2021 15:04:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B9202026D46
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 15:04:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB535858281
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 15:04:32 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-521-Yb5MTMv_N4a594c3xqdxxg-1;
	Mon, 25 Jan 2021 10:04:30 -0500
X-MC-Unique: Yb5MTMv_N4a594c3xqdxxg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D7BF4B748;
	Mon, 25 Jan 2021 15:04:28 +0000 (UTC)
Message-ID: <f9634efeb24fcfca360ab93169050c9eb276f9b7.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Mon, 25 Jan 2021 16:04:28 +0100
In-Reply-To: <20210111184239.GV3103@octiron.msp.redhat.com>
References: <3baec678cfdc3c8ed2024b2df2f316d1694fe699.camel@suse.com>
	<CABr-Gnd1TJhd7QSge+vAwrJZSHuUjW7hbKd-sFwx=zdNotv_Eg@mail.gmail.com>
	<85d7c08115fd50c413ddcd957f22f40db2215f19.camel@suse.com>
	<f74cbc725ec8cb75016e8061c46eeb628d30bb25.camel@suse.com>
	<eabe0f24-b32f-ff5f-b808-b2c501263d8f@suse.de>
	<b40493f4316db496e80f2aca8215ac52f5acb99a.camel@suse.com>
	<20210111184239.GV3103@octiron.msp.redhat.com>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10PF4Znu010611
X-loop: dm-devel@redhat.com
Cc: dm-devel mailing list <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] multipath-tools: NEW openSUSE github repo
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-01-11 at 12:42 -0600, Benjamin Marzinski wrote:
> On Mon, Jan 11, 2021 at 03:54:01PM +0100, Martin Wilck wrote:
> >=20
> > We should discuss the git workflow. Until now, I've always rebased
> > my
> > branches on Christophe's when pulling. I would like to switch to a
> > merge-based workflow for "queue" and "fixes". This would make it
> > easier
> > for third parties to pull from these branches.=C2=A0It would mean that
> > Christophe's repo won't keep a fully linear history. I'm not sure
> > if
> > that matters to anyone, but I wanted to ask anyway. The "tip"
> > branch
> > will continue to be rebased (onto "queue").
>=20
>=20
> Souds reasonable.=20

I made a first merge between "queue" and "fixes" now

Christophe, now would be the time to raise your voice if you dislike
this.

https://github.com/openSUSE/multipath-tools/commits/queue
https://github.com/openSUSE/multipath-tools/commits/tip

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

