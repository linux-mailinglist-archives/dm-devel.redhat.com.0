Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 09EBB102F4D
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 23:30:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574202624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pnYiEO/L3vV42gN1tTZoIPR84asyNxLdtxD8mCfQS5w=;
	b=Igx7WlrivpL9ZV6nl+YBsOf2CcrVPY5FBHvywvxJLcpDtX+oCLs5HacCFOPbtcFkmp0eFn
	Ng+lqG6AO7PCnXqJ0oR2OIi82frCkNZCJpM7PgcTk6u2L6pv0Rt8XzrDCqelAPkENCvV+p
	n/1i5PFz7+GjzDCm2hEZkbErbOrHA+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-O7IwToBiMTG3LIlsEUDU4w-1; Tue, 19 Nov 2019 17:30:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA92F184CAA0;
	Tue, 19 Nov 2019 22:30:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CFE3691BB;
	Tue, 19 Nov 2019 22:30:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAF744BB65;
	Tue, 19 Nov 2019 22:30:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMU0l0009130 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:30:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 497FB5E258; Tue, 19 Nov 2019 22:30:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90AFD5E7A6;
	Tue, 19 Nov 2019 22:29:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id xAJMTtTW010933; 
	Tue, 19 Nov 2019 16:29:56 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id xAJMTsnw010932;
	Tue, 19 Nov 2019 16:29:54 -0600
Date: Tue, 19 Nov 2019 16:29:54 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191119222954.GM30153@octiron.msp.redhat.com>
References: <20191115143403.31692-1-martin.wilck@suse.com>
	<20191115143403.31692-6-martin.wilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20191115143403.31692-6-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Chongyun Wu <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>
Subject: Re: [dm-devel] [PATCH 5/5] libmultipath: fix ALUA autodetection
 when paths are down
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: O7IwToBiMTG3LIlsEUDU4w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Nov 15, 2019 at 02:41:54PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
>=20
> If a single path was offline when detect_alua() was called,
> multipathd would assume ALUA was generally unsupported.
>=20
> Fix that by assuming that if at least one path has ALUA support and
> no path explicitly does not have it, ALUA is supported.
>=20
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/discovery.c | 22 +++++++++++++++++++++-
>  libmultipath/propsel.c   | 20 +++++++++++++++++---
>  2 files changed, 38 insertions(+), 4 deletions(-)
>=20
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 4288c9fd..5f41dcb7 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -871,6 +871,10 @@ get_serial (char * str, int maxlen, int fd)
>  =09return 1;
>  }
> =20
> +/*
> + * Side effect: sets pp->tpgs if it could be determined.
> + * If ALUA calls fail because paths are unreachable, pp->tpgs remains un=
changed.
> + */
>  static void
>  detect_alua(struct path * pp)
>  {
> @@ -881,12 +885,28 @@ detect_alua(struct path * pp)
>  =09if (sysfs_get_timeout(pp, &timeout) <=3D 0)
>  =09=09timeout =3D DEF_TIMEOUT;
> =20
> -=09if ((tpgs =3D get_target_port_group_support(pp, timeout)) <=3D 0) {
> +=09tpgs =3D get_target_port_group_support(pp, timeout);
> +=09if (tpgs =3D=3D -RTPG_INQUIRY_FAILED)
> +=09=09return;
> +=09else if (tpgs <=3D 0) {
>  =09=09pp->tpgs =3D TPGS_NONE;
>  =09=09return;
>  =09}
> +
> +=09if (pp->fd =3D=3D -1 || pp->offline)
> +=09=09return;
> +
=20
This is just a nitpick, but won't tpgs already be -RTPG_INQUIRY_FAILED
if pp->fd =3D=3D -1. This check makes more sense before
get_target_port_group_support().

-Ben
=20
>  =09ret =3D get_target_port_group(pp, timeout);
>  =09if (ret < 0 || get_asymmetric_access_state(pp, ret, timeout) < 0) {
> +=09=09int state;
> +
> +=09=09if (ret =3D=3D -RTPG_INQUIRY_FAILED)
> +=09=09=09return;
> +
> +=09=09state =3D path_offline(pp);
> +=09=09if (state =3D=3D PATH_DOWN || state =3D=3D PATH_PENDING)
> +=09=09=09return;
> +
>  =09=09pp->tpgs =3D TPGS_NONE;
>  =09=09return;
>  =09}
> diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
> index 27e8d68a..a5fc6ba0 100644
> --- a/libmultipath/propsel.c
> +++ b/libmultipath/propsel.c
> @@ -432,12 +432,26 @@ int select_hwhandler(struct config *conf, struct mu=
ltipath *mp)
>  =09static const char tpgs_origin[]=3D "(setting: autodetected from TPGS)=
";
>  =09char *dh_state;
>  =09int i;
> -=09bool all_tpgs =3D true;
> +=09bool all_tpgs =3D true, one_tpgs =3D false;
> =20
>  =09dh_state =3D &handler[2];
> =20
> -=09vector_foreach_slot(mp->paths, pp, i)
> -=09=09all_tpgs =3D all_tpgs && (path_get_tpgs(pp) > 0);
> +=09/*
> +=09 * TPGS_UNDEF means that ALUA support couldn't determined either way
> +=09 * yet, probably because the path was always down.
> +=09 * If at least one path does have TPGS support, and no path has
> +=09 * TPGS_NONE, assume that TPGS would be supported by all paths if
> +=09 * all were up.
> +=09 */
> +=09vector_foreach_slot(mp->paths, pp, i) {
> +=09=09int tpgs =3D path_get_tpgs(pp);
> +
> +=09=09all_tpgs =3D all_tpgs && tpgs !=3D TPGS_NONE;
> +=09=09one_tpgs =3D one_tpgs ||
> +=09=09=09(tpgs !=3D TPGS_NONE && tpgs !=3D TPGS_UNDEF);
> +=09}
> +=09all_tpgs =3D all_tpgs && one_tpgs;
> +
>  =09if (mp->retain_hwhandler !=3D RETAIN_HWHANDLER_OFF) {
>  =09=09vector_foreach_slot(mp->paths, pp, i) {
>  =09=09=09if (get_dh_state(pp, dh_state, sizeof(handler) - 2) > 0
> --=20
> 2.24.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

