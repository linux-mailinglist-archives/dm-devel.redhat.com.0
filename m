Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 73BF9312DEB
	for <lists+dm-devel@lfdr.de>; Mon,  8 Feb 2021 10:51:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-e_aLFJtFOe2Pl0Bum26DWQ-1; Mon, 08 Feb 2021 04:51:12 -0500
X-MC-Unique: e_aLFJtFOe2Pl0Bum26DWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FDA31936B6A;
	Mon,  8 Feb 2021 09:51:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3297957;
	Mon,  8 Feb 2021 09:51:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64A664E58D;
	Mon,  8 Feb 2021 09:50:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1189oU7B004566 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Feb 2021 04:50:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AC6681111A6B; Mon,  8 Feb 2021 09:50:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A895B1111A6D
	for <dm-devel@redhat.com>; Mon,  8 Feb 2021 09:50:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DB9C858F1B
	for <dm-devel@redhat.com>; Mon,  8 Feb 2021 09:50:28 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-253-sW-9Rjk4ODq05103R2xLgg-1;
	Mon, 08 Feb 2021 04:50:26 -0500
X-MC-Unique: sW-9Rjk4ODq05103R2xLgg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 85BDAAD62;
	Mon,  8 Feb 2021 09:50:24 +0000 (UTC)
Message-ID: <05408634d2361998782d80b34b7de64d452ba09c.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 08 Feb 2021 10:50:23 +0100
In-Reply-To: <15415073-3b0b-c5a3-ec1d-ced704a42a86@huawei.com>
References: <20210128210852.23207-1-mwilck@suse.com>
	<c1dddccecfe0e12a2fe2dca66faad740a30acd53.camel@suse.com>
	<99488b1b-2339-338d-e951-0b8f3e78449b@huawei.com>
	<15415073-3b0b-c5a3-ec1d-ced704a42a86@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1189oU7B004566
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd: avoid crash in uevent_cleanup()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-02-08 at 15:41 +0800, lixiaokeng wrote:
>=20
> Hi Martin,
>=20
> There is a _cleanup_ in device_new_from_nulstr. If uevent_thr exit in
> device_new_from_nulstr and some keys is not be append to sd_device,
> the _cleanup_ will be called, which leads to multipathd crashes with
> the stack.
>=20
> When I use your advice,
>=20
>=20
> On 2021/1/26 16:34, Martin Wilck wrote:
> > =A0=A0=A0 int oldstate;
> >=20
> > =A0=A0=A0 pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &oldstate);
> >=20
> > =A0=A0=A0 udev_monitor_receive_device(...)
> >=20
> > =A0=A0=A0 pthread_setcancelstate(oldstate, NULL);
> > =A0=A0=A0 pthread_testcancel();
>=20
> this coredump does not seem to appear anymore (several hours with
> test scripts).

Thanks for your continued hard work on this, but I can't follow you. In
this post:

https://listman.redhat.com/archives/dm-devel/2021-January/msg00396.html

you said that this advice did _not_ help. Please clarify.

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

