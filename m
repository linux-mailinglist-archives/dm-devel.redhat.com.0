Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A6F87201840
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 18:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592585598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6NK/bUMqVaL1YeHbj5x55wXHu9syP2kIEDFqcub4fsU=;
	b=Dl8uhtM+zFhLt52CJJEgPpJc8kp8zFwsqhX58yFVcj1bSfAs7IJSpyrEpqC4Y4ZHqxH+vz
	NUu95H+/WnHHV2X+cwJL4b00j2Q2z+whYNdU8NCcLfPU9ZUJ9Z4eMYmg0z7yjL29OqH77z
	9f3SCSFwStFO4j3QNIIe0WuMIx1SwAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-DoJ8lAc2OMat4bhE4Re8CA-1; Fri, 19 Jun 2020 12:53:16 -0400
X-MC-Unique: DoJ8lAc2OMat4bhE4Re8CA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6693F83DB39;
	Fri, 19 Jun 2020 16:53:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 128551001E91;
	Fri, 19 Jun 2020 16:53:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 447541809547;
	Fri, 19 Jun 2020 16:52:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JGqgHc032154 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 12:52:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54D0E60CCC; Fri, 19 Jun 2020 16:52:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16E7E60BE1;
	Fri, 19 Jun 2020 16:52:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05JGqbhp031884; 
	Fri, 19 Jun 2020 11:52:37 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05JGqaBs031883;
	Fri, 19 Jun 2020 11:52:36 -0500
Date: Fri, 19 Jun 2020 11:52:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200619165236.GP5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-3-git-send-email-bmarzins@redhat.com>
	<f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
	<20200618231711.GM5894@octiron.msp.redhat.com>
	<6f9284eeec0dda69e8e4dd4b2858f02d3c31fb8b.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <6f9284eeec0dda69e8e4dd4b2858f02d3c31fb8b.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
 removed map
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Jun 19, 2020 at 01:42:47PM +0000, Martin Wilck wrote:
> On Thu, 2020-06-18 at 18:17 -0500, Benjamin Marzinski wrote:
> > On Thu, Jun 18, 2020 at 07:34:38PM +0000, Martin Wilck wrote:
> > > On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> > > >=20
> > > >  static void
> > > > @@ -2088,8 +2084,13 @@ check_path (struct vectors * vecs, struct
> > > > path
> > > > * pp, unsigned int ticks)
> > > >  =09 * Synchronize with kernel state
> > > >  =09 */
> > > >  =09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1)) {
> > > > +=09=09struct dm_info info;
> > > >  =09=09condlog(1, "%s: Could not synchronize with kernel
> > > > state",
> > > >  =09=09=09pp->dev);
> > > > +=09=09if (pp->mpp && pp->mpp->alias &&
> > > > +=09=09    do_dm_get_info(pp->mpp->alias, &info) =3D=3D 0)
> > > > +=09=09=09/* multipath device missing. Likely removed */
> > > > +=09=09=09return 0;
> > > >  =09=09pp->dmstate =3D PSTATE_UNDEF;
> > >=20
> > > It would be more elegant if we could distinguish different failure
> > > modes from update_multipath_strings() directly, without having to
> > > call
> > > do_dm_get_info() again.
> >=20
> > Seems reasonable. I'll take a look at that.
>=20
> Yet another idea: I just discussed this with Hannes, and he pointed out
> that right below this code, we have
>=20
> =09/* if update_multipath_strings orphaned the path, quit early */
> =09if (!pp->mpp)
> =09=09return 0;
>=20
> ... which could have the same effect, if pp->mpp was reloaded. Probably
> that doesn't happen because the pp->mpp dereference is cached in a
> register, but we could simply add a READ_ONCE there.

When update_multipath_strings() calls update_multipath_table() it will
fail because the table no longer exists.  If we differentiate between
a dm error and not finding the map, we can exit early without having to
call do_dm_get_info() again. But right now, if the map is gone, but we
haven't got the uevent removing it, then nothing will clear pp->mpp. If
we did get the uevent, then it must have grabbed the vecs lock. That
better have caused a memory barrier, which will guarantee that
check_path() sees the updated value.

-Ben
=20
> Choose what you prefer.
>=20
> Regards,
> Martin
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

