Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFAFD2EC588
	for <lists+dm-devel@lfdr.de>; Wed,  6 Jan 2021 22:11:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-QuG82GOFMjKiXh7YxAkOWA-1; Wed, 06 Jan 2021 16:11:18 -0500
X-MC-Unique: QuG82GOFMjKiXh7YxAkOWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5CDA800D53;
	Wed,  6 Jan 2021 21:11:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0534F106D5B1;
	Wed,  6 Jan 2021 21:11:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F4564BB7B;
	Wed,  6 Jan 2021 21:10:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 106LAixR016691 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Jan 2021 16:10:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 365261006502; Wed,  6 Jan 2021 21:10:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3236610054C8
	for <dm-devel@redhat.com>; Wed,  6 Jan 2021 21:10:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8CEC858281
	for <dm-devel@redhat.com>; Wed,  6 Jan 2021 21:10:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-304-4MJoIpAoPeGn7ZOM_bRE9Q-1;
	Wed, 06 Jan 2021 16:10:38 -0500
X-MC-Unique: 4MJoIpAoPeGn7ZOM_bRE9Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6219BAF31;
	Wed,  6 Jan 2021 21:10:37 +0000 (UTC)
Message-ID: <4c7286abbdd79fc0c726fd119fdda3b7a140e056.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Chongyun Wu <wucy11@chinatelecom.cn>, Benjamin Marzinski
	<bmarzins@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Date: Wed, 06 Jan 2021 22:10:35 +0100
In-Reply-To: <4ca7da32-5777-9089-1e96-a5dbb46c585a@chinatelecom.cn>
References: <4ca7da32-5777-9089-1e96-a5dbb46c585a@chinatelecom.cn>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 106LAixR016691
X-loop: dm-devel@redhat.com
Cc: yubin1@chinatelecom.cn, zhangzijian@chinatelecom.cn
Subject: Re: [dm-devel] [PATCH] multipathd: LUN protection by checking
 path's wwid change status
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

Hello Chongyun,

On Mon, 2020-12-28 at 11:34 +0800, Chongyun Wu wrote:
> =A0From 37c74873acfc1587e79a6504ca3d42b8fa00d49e Mon Sep 17 00:00:00
> 2001
>=20
> From: Chongyun Wu <wucy11@chinatelecom.cn>
> Date: Mon, 21 Dec 2020 09:51:20 +0800
> Subject: [PATCH] multipathd: LUN data protection by checking path's
> wwid
> =A0=A0change status
>=20
> Issue description:
> A) Device sda and sdb correspend to LUN1 and LUN2 in storage backend
> and
> the upper layer application uses those two devices.
> B) Doing illegal operation: unmapping LUN1 and LUN2 in storage
> backend,
> and export LUN2 and LUN1 to host with exchanged assignment relation
> between sda and sdb.
> C) The upper layer application run for a while and found that the
> data
> in both LUN1 and LUN2 has been corrupted.

Can you please be explicit about which multipath-tools version you have
tested? I thought we had the wwid change issues covered. Ben and I have
been putting quite some effort into this recently. Of course we can be
wrong, but I'd like to understand the issue fully.

In particular, I wonder what happens if when "unmapping LUN1 and LUN2
in storage". I would expect that this would cause "remove" uevents, and
multipathd would set these devices in INIT_REMOVED state. That should
make multipathd realize that the path WWID changed when the path
reappears.

Please confirm that you've been using the latest version from
Christophe's repo (or better even, from my upstream-queue), and provide
-v3 logs showing what goes wrong.

Martin




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

