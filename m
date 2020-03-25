Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6D21E193234
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 21:53:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585169623;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JDixkKhVs5ka0UPBwf5jN1oapUE7QW7eWQKaVcKHwrs=;
	b=OM3B2fTlKX6ZCLHyVUUiiskh9CRvxhQ8ZhXX7fYan9Vj9VB5s8iHJilVnYUL+Wg+hDrQpI
	dkjZmXFV2gw11Vh7f6A2FWPlOEqEqZMvJMErou0ircwggKO9PCW7jqsJ7n6AztV574gtLb
	ukC1g6hzvWn/jbeN9tGYIgNMPVxT26c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-tvNTjxPHPdWIq1-wR0eX6A-1; Wed, 25 Mar 2020 16:53:41 -0400
X-MC-Unique: tvNTjxPHPdWIq1-wR0eX6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB3BE100DFD7;
	Wed, 25 Mar 2020 20:53:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E18D953AF;
	Wed, 25 Mar 2020 20:53:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBC471809567;
	Wed, 25 Mar 2020 20:53:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PKqwaC023782 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 16:52:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D020060BF7; Wed, 25 Mar 2020 20:52:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7404B60BF3;
	Wed, 25 Mar 2020 20:52:58 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02PKqvsL021682; 
	Wed, 25 Mar 2020 15:52:57 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02PKquck021681;
	Wed, 25 Mar 2020 15:52:56 -0500
Date: Wed, 25 Mar 2020 15:52:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200325205255.GB17313@octiron.msp.redhat.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
	<1585083834-14237-2-git-send-email-bmarzins@redhat.com>
	<ebfcb22b005314635b77e4820e205971d708d07d.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <ebfcb22b005314635b77e4820e205971d708d07d.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] libmutipath: don't close fd on
	dm_lib_release
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Mar 25, 2020 at 03:16:50PM +0000, Martin Wilck wrote:
> On Tue, 2020-03-24 at 16:03 -0500, Benjamin Marzinski wrote:
> > If dm_hold_control_open() isn't set, when dm_lib_release() is called,
> > it
> > will close the control fd. The control fd will get re-opened on the
> > next
> > dm_task_run() call, but if there is a dm_task_run() call already
> > in progress in another thread, it can fail. Since many of the
> > device-mapper callouts happen with the vecs lock held, this wasn't
> > too
> > noticeable, but there is code that calls dm_task_run() without the
> > vecs lock held, notably the dmevent waiter code.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/devmapper.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> > index bed8ddc6..d96472fe 100644
> > --- a/libmultipath/devmapper.c
> > +++ b/libmultipath/devmapper.c
> > @@ -254,6 +254,7 @@ void libmp_dm_init(void)
> >  =09memcpy(conf->version, version, sizeof(version));
> >  =09put_multipath_config(conf);
> >  =09dm_init(verbosity);
> > +=09dm_hold_control_dev(1);
> >  =09dm_udev_set_sync_support(libmp_dm_udev_sync);
> >  }
>=20
> AFAICS, this function has been in libdm since 1.02.111. We support
> 1.02.89 (if all features enabled, otherwise even older). Perhaps we
> should make this function call conditional on the libdm verson?
>=20
> But perhaps more importantly, why do we still need to call
> dm_lib_release()? AFAICS it's only needed for systems that have no udev
> support for creating device nodes (to call update_devs() via
> dm_lib_release()), and we don't support that anymore anyway, do we?=20
>=20
> Since 26c4bb0, we're always setting the
> DM_UDEV_DISABLE_LIBRARY_FALLBACK flag, and the cookie, too
> (we aren't setting it for DM_DEVICE_RELOAD, but it isn't needed for
> that, either, since no device nodes need to be created or removed); so
> dm_lib_release() should really have no effect.
>=20
> Regards
> Martin

Good call. I'll redo this patch.

-Ben

>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix
> Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

