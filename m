Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 90324144DF6
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 09:52:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579683135;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3q6ActFCiKM6sSMBkL490EqRRkSjkrIAY6LeLDIDgdo=;
	b=VF+UPEN1ZG5yYCEfDu5y2NTWFzuq/Sw1e7IsXFjE46QIwMM/8TuGatYREBgleRsFiDucKk
	E1Lmequx3uVkSIhsm4wyC9Z4VTKf/qrKoZvPsPenEkY4fLmAlGdDSmC7UwFA4xo8BdFKQN
	5d/d7AsGvC4dvz/xkICbWlQuB5kwPro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-lhD-3o9IPJam47hAl_EKJA-1; Wed, 22 Jan 2020 03:52:12 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A97FB2F60;
	Wed, 22 Jan 2020 08:52:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6535DA66;
	Wed, 22 Jan 2020 08:52:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C181845C8;
	Wed, 22 Jan 2020 08:51:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00M8ppVj027422 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 03:51:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 31B1C2898C; Wed, 22 Jan 2020 08:51:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7109B19C69;
	Wed, 22 Jan 2020 08:51:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00M8pjZC023374; 
	Wed, 22 Jan 2020 02:51:45 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00M8piAx023373;
	Wed, 22 Jan 2020 02:51:44 -0600
Date: Wed, 22 Jan 2020 02:51:44 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200122085143.GW30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-10-git-send-email-bmarzins@redhat.com>
	<6d1c7f92c9d68c8a1e602ecb36cc1390e0f936de.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <6d1c7f92c9d68c8a1e602ecb36cc1390e0f936de.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 09/15] libmultipath: add code to get vendor
 specific vpd data
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: lhD-3o9IPJam47hAl_EKJA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Jan 17, 2020 at 05:56:40PM +0100, Martin Wilck wrote:
> On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> > This adds the wildcard 'g' for multipath and path formatted printing,
> > which returns extra data from a device's vendor specific vpd
> > page.  The
> > specific vendor vpd page to use, and the vendor/product id to decode
> > it
> > can be set in the hwentry with vpd_vendor_pg and vpd_vendor_id. It
> > can
> > be configured in the devices section of multipath.conf with the
> > vpd_vendor parameter. Currently, the only devices that use this are
> > HPE
> > 3PAR arrays, to return the Volume Name.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/config.c      |  4 ++++
> >  libmultipath/config.h      |  2 ++
> >  libmultipath/dict.c        | 34 ++++++++++++++++++++++++++++++++++
> >  libmultipath/discovery.c   | 34 +++++++++++++++++++++++++++++++++-
> >  libmultipath/hwtable.c     |  2 ++
> >  libmultipath/print.c       | 27 +++++++++++++++++++++++++++
> >  libmultipath/propsel.c     | 24 ++++++++++++++++++++++++
> >  libmultipath/propsel.h     |  2 ++
> >  libmultipath/structs.h     |  9 +++++++++
> >  multipath/multipath.conf.5 |  8 ++++++++
> >  10 files changed, 145 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/libmultipath/config.c b/libmultipath/config.c
> > index 85626e96..72b8d37c 100644
> > --- a/libmultipath/config.c
> > +++ b/libmultipath/config.c
> > @@ -369,6 +369,8 @@ merge_hwe (struct hwentry * dst, struct hwentry *
> > src)
> >  =09merge_num(max_sectors_kb);
> >  =09merge_num(ghost_delay);
> >  =09merge_num(all_tg_pt);
> > +=09merge_num(vpd_vendor_pg);
> > +=09merge_num(vpd_vendor_id);
> >  =09merge_num(san_path_err_threshold);
> >  =09merge_num(san_path_err_forget_rate);
> >  =09merge_num(san_path_err_recovery_time);
> > @@ -517,6 +519,8 @@ store_hwe (vector hwtable, struct hwentry * dhwe)
> >  =09hwe->detect_prio =3D dhwe->detect_prio;
> >  =09hwe->detect_checker =3D dhwe->detect_checker;
> >  =09hwe->ghost_delay =3D dhwe->ghost_delay;
> > +=09hwe->vpd_vendor_pg =3D dhwe->vpd_vendor_pg;
> > +=09hwe->vpd_vendor_id =3D dhwe->vpd_vendor_id;
> > =20
> >  =09if (dhwe->bl_product && !(hwe->bl_product =3D set_param_str(dhwe-
> > >bl_product)))
> >  =09=09goto out;
> > diff --git a/libmultipath/config.h b/libmultipath/config.h
> > index e69aa07c..589146de 100644
> > --- a/libmultipath/config.h
> > +++ b/libmultipath/config.h
> > @@ -87,6 +87,8 @@ struct hwentry {
> >  =09int max_sectors_kb;
> >  =09int ghost_delay;
> >  =09int all_tg_pt;
> > +=09int vpd_vendor_pg;
> > +=09int vpd_vendor_id;
> >  =09char * bl_product;
> >  };
> > =20
> > diff --git a/libmultipath/dict.c b/libmultipath/dict.c
> > index 2b046e1d..d6d8b79b 100644
> > --- a/libmultipath/dict.c
> > +++ b/libmultipath/dict.c
> > @@ -1366,6 +1366,39 @@ def_uxsock_timeout_handler(struct config
> > *conf, vector strvec)
> >  =09return 0;
> >  }
> > =20
> > +static int
> > +hw_vpd_vendor_handler(struct config *conf, vector strvec)
> > +{
> > +=09int rc =3D 0;
> > +=09char *buff;
> > +
> > +=09struct hwentry * hwe =3D VECTOR_LAST_SLOT(conf->hwtable);
> > +=09if (!hwe)
> > +=09=09return 1;
> > +
> > +=09buff =3D set_value(strvec);
> > +=09if (!buff)
> > +=09=09return 1;
> > +=09if (strcmp(buff, "hp3par") =3D=3D 0) {
> > +=09=09hwe->vpd_vendor_pg =3D 0xc0;
> > +=09=09hwe->vpd_vendor_id =3D VPD_VP_HP3PAR;
> > +=09} else
> > +=09=09rc =3D 1;
> > +=09FREE(buff);
> > +=09return rc;
> > +}
> > +
> > +static int
> > +snprint_hw_vpd_vendor(struct config *conf, char * buff, int len,
> > +=09=09      const void * data)
> > +{
> > +=09const struct hwentry * hwe =3D (const struct hwentry *)data;
> > +
> > +=09if (hwe->vpd_vendor_pg =3D=3D 0xc0 && hwe->vpd_vendor_id =3D=3D
> > VPD_VP_HP3PAR)
> > +=09=09return snprintf(buff, len, "hp3par");
> > +=09return 0;
> > +}
>=20
> I don't understand this design. The way you set up the hwe, it would be
> logical to add "vpd_vendor_page" and "vpd_vendor_id" properties for
> device entries.

The vpd page abbreviations specify both the page to read, and the vendor
id to use to decode it, and they are more user readable. It seemed like
a much more foolproof way to have people specify this.
=20
> BUT ok, that's overengineered with just one supported combination of
> page and vendor. I can understand that. But then, it seems also
> overengineered to carry around vpd_vendor_pg and vpd_vendor_id in the
> hwe.=20
>=20
> I'd suggest creating a hard-coded table with "vendor vpd schemes",
>=20
> struct {
> =09int pg;
> =09int vendor_id;
> =09const char *name;
> } vendor_vpd_schemes[]  =3D {=20
>     { 0xc0, VPD_VP_HP3PAR, "hp3par", },=20
>     { 0, },=20
> };
>=20
> and in the hwentry, only carry around the index into this table,
> and look up the page and vendor ID there. Actually, with just that
> single user, we might as well not introduce a new device property at
> all, but simply use a separate hardcoded table with lookup values for
> vendor and product ID. I'm unsure if it's wise to make this
> configurable via multipath.conf.

Sure. I can make the hwe change. The reason why I added this to
multipath.conf is that I'm not sure what devices actually support these
vpd information pages.  So, if we miss one, or a new device comes out
that isn't in the built-in config, the user can still get this info.

> Regards,
> Martin
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE
> Software Solutions Germany GmbH=20
> HRB 36809 (AG N=FCrnberg) GF: Felix
> Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

