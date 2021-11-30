Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1104640E4
	for <lists+dm-devel@lfdr.de>; Tue, 30 Nov 2021 23:05:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-UJEmzoTyPs-CQroGh9oRQQ-1; Tue, 30 Nov 2021 17:05:04 -0500
X-MC-Unique: UJEmzoTyPs-CQroGh9oRQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B519584B9A2;
	Tue, 30 Nov 2021 22:04:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4CA922DEB;
	Tue, 30 Nov 2021 22:04:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB8FC1809C89;
	Tue, 30 Nov 2021 22:04:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUM4hAC005293 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 17:04:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E91FB401E3C; Tue, 30 Nov 2021 22:04:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4DC3401E32
	for <dm-devel@redhat.com>; Tue, 30 Nov 2021 22:04:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB26D80122B
	for <dm-devel@redhat.com>; Tue, 30 Nov 2021 22:04:42 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-424-L08kKRm5NHSLidjJO2HUBQ-1; Tue, 30 Nov 2021 17:04:38 -0500
X-MC-Unique: L08kKRm5NHSLidjJO2HUBQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7DE841FD5B;
	Tue, 30 Nov 2021 22:04:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A60A13D77;
	Tue, 30 Nov 2021 22:04:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id leYKEPWfpmFHeAAAMHmgww
	(envelope-from <mwilck@suse.com>); Tue, 30 Nov 2021 22:04:37 +0000
Message-ID: <874a0dc80545ed7b57ee53748c572c11f2375901.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 30 Nov 2021 23:04:36 +0100
In-Reply-To: <20211130202946.GM19591@octiron.msp.redhat.com>
References: <20211118231338.22358-1-mwilck@suse.com>
	<20211118231338.22358-8-mwilck@suse.com>
	<20211130011859.GH19591@octiron.msp.redhat.com>
	<3f1edae87ea695e5a3fe648fd8be337ac444b6c9.camel@suse.com>
	<20211130202946.GM19591@octiron.msp.redhat.com>
User-Agent: Evolution 3.42.1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AUM4hAC005293
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 07/21] libmultipath: use strbuf in
	parse_vpd_pg83()
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

On Tue, 2021-11-30 at 14:29 -0600, Benjamin Marzinski wrote:
> On Tue, Nov 30, 2021 at 12:26:47PM +0100, Martin Wilck wrote:
> > On Mon, 2021-11-29 at 19:18 -0600, Benjamin Marzinski wrote:
> > > On Fri, Nov 19, 2021 at 12:13:24AM +0100, mwilck@suse.com=A0wrote:
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0out[0] =3D '1';
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0len =3D 1;
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0while ((p =3D memchr(=
vpd, ' ', vpd_len))) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if ((err =3D fill_str=
buf(&buf, '1', 1)) < 0)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return err;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0while (vpd && (p =3D =
memchr(vpd, ' ', vpd_len)))
> > > > {
> > >=20
> > > vpd should never be zero here unless it wraps around, which seems
> > > very
> > > unlikely.=A0 Is this just to make coverity happy, or do you mean
> > > (*vpd)?
> > >=20
> >=20
> > Coverity likes arguments for memchr() to be NULL-checked
> > beforehand,=20
> > but that wasn't the main reason.
> >=20
> > See below, there's "vpd =3D p". And p can (and will sooner or later)
> > be
> > NULL, because memchr() returns NULL if it doesn't find anything.
> >=20
>=20
> Right, but don't you only execute this while loop if p isn't NULL?
> Not
> that it really matters. I'm fine with the code that way it is.

Ah, I misinterpreted your comment. This one was for coverity, IIRC;
to make it believe that it's legal to take *vpd.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

