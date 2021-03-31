Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E90534B3B9
	for <lists+dm-devel@lfdr.de>; Sat, 27 Mar 2021 03:19:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616811574;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H/j7ILNFLyvF7wbztM7FWKvkBYLKWWmLuBN67xKJZ0A=;
	b=UXz2AoKIRon5NPmO8nWYdo0vyLu7ad2dP7fHg4Ski8lF1qIXZsmYLBZjsuV5vYKvq4p5KJ
	DQoty3RMVdkVLkiBQVmKb4YIMQU7BmZ7aexFjNqfqRnU4LxIOA8/g6IsVFz7A/ebQv5P9v
	HEa9DUTBD5JBQ7C9gu4T4QFSc97a3f0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-GP7ozPBfNUCESiIpcePLzQ-1; Fri, 26 Mar 2021 22:19:31 -0400
X-MC-Unique: GP7ozPBfNUCESiIpcePLzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BA0E800D62;
	Sat, 27 Mar 2021 02:19:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E637A6E6F5;
	Sat, 27 Mar 2021 02:19:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 067121809C83;
	Sat, 27 Mar 2021 02:19:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12R2J0t0029916 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 22:19:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 970CC1000324; Sat, 27 Mar 2021 02:19:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 093C310013D6;
	Sat, 27 Mar 2021 02:18:55 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12R2Isjm018552; 
	Fri, 26 Mar 2021 21:18:54 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12R2IrH7018551;
	Fri, 26 Mar 2021 21:18:53 -0500
Date: Fri, 26 Mar 2021 21:18:53 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210327021853.GI15006@octiron.msp.redhat.com>
References: <1616719966-10221-1-git-send-email-bmarzins@redhat.com>
	<1616719966-10221-3-git-send-email-bmarzins@redhat.com>
	<1088f960e04492a26530385040b2485b3691c94e.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <1088f960e04492a26530385040b2485b3691c94e.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/4] libmultipath: fix priorities in
	parse_vpd_pg83
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

On Fri, Mar 26, 2021 at 05:12:36PM +0000, Martin Wilck wrote:
> On Thu, 2021-03-25 at 19:52 -0500, Benjamin Marzinski wrote:
> > The priorities for the EUI-64 (0x02) and NAME (0x08) scsi identifiers
> > in
> > parse_vpd_pg83() don't match their priorities in 55-scsi-sg3_id.rules.
> > Switch them so that they match.
>=20
> I think we should rather change the udev rules file, to be consistent
> with what the kernel does:
>=20
> https://elixir.bootlin.com/linux/latest/A/ident/designator_prio

If we were going with the kernel as a standard, we should also change
scsi_id, since it doesn't match that the kernel either (or the priority
ordering in 55-scsi-sg3_id.rules for that matter).  The bigger issue
here is that distributions would need to make special plans to take this
change, because user's devices would change uuids, which could cause
problems on existing systems. It will definitely do so on systems using
multipath. Devices will suddenly change wwids, which will rename them.
The whole reason why Red Hat installs 55-scsi-sg3_id.rules as
61-scsi-sg3_id.rules is beause we didn't initally include it, and we
don't want go changing people's device UUIDs, so is has to go after
60-persistent-storage.rules, which sets ID_SERIAL if it's not already
set.

On the other hand, it's obviously safe to make our fallback method of
getting wwids return the same wwids as the primary method does.  Since
recheck_wwids relies on both methods giving the same wwid, I would argue
that it's a bug that they don't. If we don't add this fix, then we
should add back the code that disables recheck_wwids if multipathd
doesn't see that both methods return the same wwid at least once, so we
know that we can rely on parse_vpd_pg83.

Speaking of which, I was planning on doing more work to make our
fallback method of returning wwids work more like 55-scsi-sg3_id.rules
and 60-persistent-storage.rules. For instance, both of those will fall
back to using page 0x80, if setting ID_SERIAL from page 0x83 fails.

-Ben

>=20
> Regards
> Martin
>=20
>=20
>=20
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> > =A0libmultipath/discovery.c | 16 ++++++++--------
> > =A01 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > index 5727f7a6..f8044141 100644
> > --- a/libmultipath/discovery.c
> > +++ b/libmultipath/discovery.c
> > @@ -1152,19 +1152,19 @@ parse_vpd_pg83(const unsigned char *in, size_t
> > in_len,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0vpd =3D d;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0}
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0break;
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0case 0x8:
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/=
* SCSI Name: Prio 4 */
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0i=
f (memcmp(d + 4, "eui.", 4) &&
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 memcmp(d + 4, "naa.", 4) &&
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 memcmp(d + 4, "iqn.", 4))
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0break;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0case 0x2:
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/=
* EUI-64: Prio 4 */
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0if (prio < 4) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0prio =3D 4;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0vpd =3D d;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0}
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0break;
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0case 0x2:
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/=
* EUI-64: Prio 3 */
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0case 0x8:
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/=
* SCSI Name: Prio 3 */
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0i=
f (memcmp(d + 4, "eui.", 4) &&
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 memcmp(d + 4, "naa.", 4) &&
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 memcmp(d + 4, "iqn.", 4))
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0break;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0if (prio < 3) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0prio =3D 3;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0vpd =3D d;
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel.=A0+49 (0)911 74053 2107
> SUSE Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

