Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1F8140F69
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 17:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579280161;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YuLvgTkXdC748JuthSGX93srIwdqNuyZTYa20B8b3gQ=;
	b=TOvgriZ3bx6/u0Ot/p/Xz0V6D63WApB18nTuZu46Cb0ErSr7LRMiZs2uPPHGyqmqT/v4ks
	5/cprprg5qO9WldKOSE24WJNTGCSH+kQnc3crKz6phFZJVSVuIVgvQXtWcPX1ynhtR5Dkp
	H7fslhFu57xLHWGdJkeKRSIcsrb+g7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-PJud2VsfM0SycEYyRluigQ-1; Fri, 17 Jan 2020 11:56:00 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D12F1800A02;
	Fri, 17 Jan 2020 16:55:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 425107DB34;
	Fri, 17 Jan 2020 16:55:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9095318089CD;
	Fri, 17 Jan 2020 16:55:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HGtWL1022098 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 11:55:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D63F2166B2B; Fri, 17 Jan 2020 16:55:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A2282166B2E
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 16:55:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E56085A33E
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 16:55:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-58-9PpfIfxGM3q6FQAfJELZng-1;
	Fri, 17 Jan 2020 11:55:26 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id AFC84B1E7;
	Fri, 17 Jan 2020 16:55:24 +0000 (UTC)
Message-ID: <6d1c7f92c9d68c8a1e602ecb36cc1390e0f936de.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 17:56:40 +0100
In-Reply-To: <1579227500-17196-10-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-10-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: 9PpfIfxGM3q6FQAfJELZng-1
X-MC-Unique: PJud2VsfM0SycEYyRluigQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HGtWL1022098
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> This adds the wildcard 'g' for multipath and path formatted printing,
> which returns extra data from a device's vendor specific vpd
> page.  The
> specific vendor vpd page to use, and the vendor/product id to decode
> it
> can be set in the hwentry with vpd_vendor_pg and vpd_vendor_id. It
> can
> be configured in the devices section of multipath.conf with the
> vpd_vendor parameter. Currently, the only devices that use this are
> HPE
> 3PAR arrays, to return the Volume Name.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.c      |  4 ++++
>  libmultipath/config.h      |  2 ++
>  libmultipath/dict.c        | 34 ++++++++++++++++++++++++++++++++++
>  libmultipath/discovery.c   | 34 +++++++++++++++++++++++++++++++++-
>  libmultipath/hwtable.c     |  2 ++
>  libmultipath/print.c       | 27 +++++++++++++++++++++++++++
>  libmultipath/propsel.c     | 24 ++++++++++++++++++++++++
>  libmultipath/propsel.h     |  2 ++
>  libmultipath/structs.h     |  9 +++++++++
>  multipath/multipath.conf.5 |  8 ++++++++
>  10 files changed, 145 insertions(+), 1 deletion(-)
>=20
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 85626e96..72b8d37c 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -369,6 +369,8 @@ merge_hwe (struct hwentry * dst, struct hwentry *
> src)
>  =09merge_num(max_sectors_kb);
>  =09merge_num(ghost_delay);
>  =09merge_num(all_tg_pt);
> +=09merge_num(vpd_vendor_pg);
> +=09merge_num(vpd_vendor_id);
>  =09merge_num(san_path_err_threshold);
>  =09merge_num(san_path_err_forget_rate);
>  =09merge_num(san_path_err_recovery_time);
> @@ -517,6 +519,8 @@ store_hwe (vector hwtable, struct hwentry * dhwe)
>  =09hwe->detect_prio =3D dhwe->detect_prio;
>  =09hwe->detect_checker =3D dhwe->detect_checker;
>  =09hwe->ghost_delay =3D dhwe->ghost_delay;
> +=09hwe->vpd_vendor_pg =3D dhwe->vpd_vendor_pg;
> +=09hwe->vpd_vendor_id =3D dhwe->vpd_vendor_id;
> =20
>  =09if (dhwe->bl_product && !(hwe->bl_product =3D set_param_str(dhwe-
> >bl_product)))
>  =09=09goto out;
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index e69aa07c..589146de 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -87,6 +87,8 @@ struct hwentry {
>  =09int max_sectors_kb;
>  =09int ghost_delay;
>  =09int all_tg_pt;
> +=09int vpd_vendor_pg;
> +=09int vpd_vendor_id;
>  =09char * bl_product;
>  };
> =20
> diff --git a/libmultipath/dict.c b/libmultipath/dict.c
> index 2b046e1d..d6d8b79b 100644
> --- a/libmultipath/dict.c
> +++ b/libmultipath/dict.c
> @@ -1366,6 +1366,39 @@ def_uxsock_timeout_handler(struct config
> *conf, vector strvec)
>  =09return 0;
>  }
> =20
> +static int
> +hw_vpd_vendor_handler(struct config *conf, vector strvec)
> +{
> +=09int rc =3D 0;
> +=09char *buff;
> +
> +=09struct hwentry * hwe =3D VECTOR_LAST_SLOT(conf->hwtable);
> +=09if (!hwe)
> +=09=09return 1;
> +
> +=09buff =3D set_value(strvec);
> +=09if (!buff)
> +=09=09return 1;
> +=09if (strcmp(buff, "hp3par") =3D=3D 0) {
> +=09=09hwe->vpd_vendor_pg =3D 0xc0;
> +=09=09hwe->vpd_vendor_id =3D VPD_VP_HP3PAR;
> +=09} else
> +=09=09rc =3D 1;
> +=09FREE(buff);
> +=09return rc;
> +}
> +
> +static int
> +snprint_hw_vpd_vendor(struct config *conf, char * buff, int len,
> +=09=09      const void * data)
> +{
> +=09const struct hwentry * hwe =3D (const struct hwentry *)data;
> +
> +=09if (hwe->vpd_vendor_pg =3D=3D 0xc0 && hwe->vpd_vendor_id =3D=3D
> VPD_VP_HP3PAR)
> +=09=09return snprintf(buff, len, "hp3par");
> +=09return 0;
> +}

I don't understand this design. The way you set up the hwe, it would be
logical to add "vpd_vendor_page" and "vpd_vendor_id" properties for
device entries.

BUT ok, that's overengineered with just one supported combination of
page and vendor. I can understand that. But then, it seems also
overengineered to carry around vpd_vendor_pg and vpd_vendor_id in the
hwe.=20

I'd suggest creating a hard-coded table with "vendor vpd schemes",

struct {
=09int pg;
=09int vendor_id;
=09const char *name;
} vendor_vpd_schemes[]  =3D {=20
    { 0xc0, VPD_VP_HP3PAR, "hp3par", },=20
    { 0, },=20
};

and in the hwentry, only carry around the index into this table,
and look up the page and vendor ID there. Actually, with just that
single user, we might as well not introduce a new device property at
all, but simply use a separate hardcoded table with lookup values for
vendor and product ID. I'm unsure if it's wise to make this
configurable via multipath.conf.

Regards,
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE
Software Solutions Germany GmbH=20
HRB 36809 (AG N=FCrnberg) GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

