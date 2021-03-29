Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2721E34D45E
	for <lists+dm-devel@lfdr.de>; Mon, 29 Mar 2021 17:58:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-brWEmX98OZSc7bItRYdzjg-1; Mon, 29 Mar 2021 11:58:06 -0400
X-MC-Unique: brWEmX98OZSc7bItRYdzjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E38211005D57;
	Mon, 29 Mar 2021 15:57:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E56511975F;
	Mon, 29 Mar 2021 15:57:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E75C4BB7B;
	Mon, 29 Mar 2021 15:57:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12TFvhPH021773 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 11:57:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8851B1111C60; Mon, 29 Mar 2021 15:57:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83CCA111287F
	for <dm-devel@redhat.com>; Mon, 29 Mar 2021 15:57:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39A5C80A1D2
	for <dm-devel@redhat.com>; Mon, 29 Mar 2021 15:57:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-55-SeUI4PYVOlCK4jmumo62xw-1;
	Mon, 29 Mar 2021 11:57:29 -0400
X-MC-Unique: SeUI4PYVOlCK4jmumo62xw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5BB22AEB3;
	Mon, 29 Mar 2021 15:57:28 +0000 (UTC)
Message-ID: <e06fd988d59d553759c0d9dad0b048c7308319c4.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	Helmut Grohne <helmutg@debian.org>
Date: Mon, 29 Mar 2021 17:57:27 +0200
In-Reply-To: <a4b71ca9-2b8b-5515-b895-8f66d200cc8b@gmail.com>
References: <20210326212944.3136-1-mwilck@suse.com>
	<20210326212944.3136-2-mwilck@suse.com>
	<a4b71ca9-2b8b-5515-b895-8f66d200cc8b@gmail.com>
User-Agent: Evolution 3.38.4
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12TFvhPH021773
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/7] multipath-tools Makefiles: make
 pkg-config configurable
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-03-29 at 17:44 +0200, Xose Vazquez Perez wrote:
> On 3/26/21 10:29 PM, mwilck@suse.com=A0wrote:
>=20
> > From: Martin Wilck <mwilck@suse.com>
> >=20
> > This is useful for building in a cross-compilation environment.
>=20
> Debian has a similar patch:
> https://salsa.debian.org/linux-blocks-team/multipath-tools/-/blob/master/=
debian/patches/0008-Bug-916521-FTCBFS-uses-the-wrong-pkg-config.patch

Does this mean you disapprove of mine?

Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

