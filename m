Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1EF3E9375
	for <lists+dm-devel@lfdr.de>; Wed, 11 Aug 2021 16:19:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-mP9CgmqfMZKZO4By4J5VcQ-1; Wed, 11 Aug 2021 10:19:14 -0400
X-MC-Unique: mP9CgmqfMZKZO4By4J5VcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 917C41853028;
	Wed, 11 Aug 2021 14:19:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04898604CC;
	Wed, 11 Aug 2021 14:19:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B12104BB7C;
	Wed, 11 Aug 2021 14:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17BEIc7N031621 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Aug 2021 10:18:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20F09FDCE8; Wed, 11 Aug 2021 14:18:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE59FDCE4
	for <dm-devel@redhat.com>; Wed, 11 Aug 2021 14:18:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7298996B052
	for <dm-devel@redhat.com>; Wed, 11 Aug 2021 14:18:35 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-70-WyujBiGnMrmFYGG5L1xdzw-1; Wed, 11 Aug 2021 10:18:33 -0400
X-MC-Unique: WyujBiGnMrmFYGG5L1xdzw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0343C1FD33;
	Wed, 11 Aug 2021 14:18:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C288113C30;
	Wed, 11 Aug 2021 14:18:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id uGpWLTfcE2GRQAAAMHmgww
	(envelope-from <mwilck@suse.com>); Wed, 11 Aug 2021 14:18:31 +0000
Message-ID: <1d469656a97a3e977c2b7aaebff8123cad19d133.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 11 Aug 2021 16:18:31 +0200
In-Reply-To: <20210726221717.GI3087@octiron.msp.redhat.com>
References: <20210715105223.30463-1-mwilck@suse.com>
	<20210715105223.30463-2-mwilck@suse.com>
	<20210726221717.GI3087@octiron.msp.redhat.com>
User-Agent: Evolution 3.40.3
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 17BEIc7N031621
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/9] libmultipath: variable-size parameters
 in dm_get_map()
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mo, 2021-07-26 at 17:17 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 15, 2021 at 12:52:15PM +0200, mwilck@suse.com=A0wrote:
> > From: Martin Wilck <mwilck@suse.com>
> >=20
> > -int dm_get_status(const char *name, char *outstatus)
> > +int dm_get_status(const char *name, char **outstatus)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0int r =3D DMP_ERR;
> > =A0=A0=A0=A0=A0=A0=A0=A0struct dm_task *dmt;
> > @@ -799,8 +800,12 @@ int dm_get_status(const char *name, char
> > *outstatus)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto out;
> > =A0=A0=A0=A0=A0=A0=A0=A0}
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0if (snprintf(outstatus, PARAMS_SIZE, "%s", status=
) <=3D
> > PARAMS_SIZE)
> > +=A0=A0=A0=A0=A0=A0=A0if (!outstatus)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0r =3D DMP_OK;
> > +=A0=A0=A0=A0=A0=A0=A0else {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0*outstatus =3D strdup(sta=
tus);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0r =3D outstatus ? DMP_OK =
: DMP_ERR;
>=20
> Missing the dereference here "r =3D *outstatus ?"

Yes. Thanks for spotting it.




--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

