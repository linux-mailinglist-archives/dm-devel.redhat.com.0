Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 79620102F54
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 23:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574202653;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KHZbHUGVsyB5bGScW1THGKrcSJzFHotUtzAx1orgdQU=;
	b=iYXcm/yL3UuqCCX3Sor7nE78O3yXtJG3iwyyG/A9431d1xnCbpFxt8APfnjnGNzXGH1kkP
	uMOq/WcpUSKJjz/kJfv0nVLlXBgTq3J5GUP8GgVuU1JOHJhQjH86i628p3H4In13nZXZzI
	d9Inh7SoVponSGjSBKpXi9WuL+Po3Sk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-zDOiDWD3N_y8mqQPtUrc7Q-1; Tue, 19 Nov 2019 17:30:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14C7B184CAA4;
	Tue, 19 Nov 2019 22:30:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE9A61001E75;
	Tue, 19 Nov 2019 22:30:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 204F818095FF;
	Tue, 19 Nov 2019 22:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMUgh2009180 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:30:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6F82B503B3; Tue, 19 Nov 2019 22:30:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED7BB503F2;
	Tue, 19 Nov 2019 22:30:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id xAJMUct5010939; 
	Tue, 19 Nov 2019 16:30:38 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id xAJMUbW4010938;
	Tue, 19 Nov 2019 16:30:37 -0600
Date: Tue, 19 Nov 2019 16:30:37 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191119223037.GN30153@octiron.msp.redhat.com>
References: <20191115143403.31692-1-martin.wilck@suse.com>
	<20191115143403.31692-2-martin.wilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20191115143403.31692-2-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Chongyun Wu <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>
Subject: Re: [dm-devel] [PATCH 1/5] multipathd: move set_no_path_retry()
 back to libmultipath
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
X-MC-Unique: zDOiDWD3N_y8mqQPtUrc7Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Nov 15, 2019 at 02:41:46PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
>=20
> This function is useful elsewhere, too. No code changes except
> for changing the linkage.
>=20
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 30 ++++++++++++++++++++++++++++++
>  libmultipath/structs_vec.h |  1 +
>  multipathd/main.c          | 30 ------------------------------
>  3 files changed, 31 insertions(+), 30 deletions(-)
>=20
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 6991f9ac..fbe97662 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -308,6 +308,36 @@ void enter_recovery_mode(struct multipath *mpp)
>  =09=09mpp->alias, mpp->no_path_retry);
>  }
> =20
> +void set_no_path_retry(struct multipath *mpp)
> +{
> +=09char is_queueing =3D 0;
> +
> +=09mpp->nr_active =3D pathcount(mpp, PATH_UP) + pathcount(mpp, PATH_GHOS=
T);
> +=09if (mpp->features && strstr(mpp->features, "queue_if_no_path"))
> +=09=09is_queueing =3D 1;
> +
> +=09switch (mpp->no_path_retry) {
> +=09case NO_PATH_RETRY_UNDEF:
> +=09=09break;
> +=09case NO_PATH_RETRY_FAIL:
> +=09=09if (is_queueing)
> +=09=09=09dm_queue_if_no_path(mpp->alias, 0);
> +=09=09break;
> +=09case NO_PATH_RETRY_QUEUE:
> +=09=09if (!is_queueing)
> +=09=09=09dm_queue_if_no_path(mpp->alias, 1);
> +=09=09break;
> +=09default:
> +=09=09if (mpp->nr_active > 0) {
> +=09=09=09mpp->retry_tick =3D 0;
> +=09=09=09if (!is_queueing)
> +=09=09=09=09dm_queue_if_no_path(mpp->alias, 1);
> +=09=09} else if (is_queueing && mpp->retry_tick =3D=3D 0)
> +=09=09=09enter_recovery_mode(mpp);
> +=09=09break;
> +=09}
> +}
> +
>  void
>  sync_map_state(struct multipath *mpp)
>  {
> diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
> index f8b9f63e..d3219278 100644
> --- a/libmultipath/structs_vec.h
> +++ b/libmultipath/structs_vec.h
> @@ -11,6 +11,7 @@ struct vectors {
>  =09vector mpvec;
>  };
> =20
> +void set_no_path_retry(struct multipath *mpp);
>  void enter_recovery_mode(struct multipath *mpp);
> =20
>  int adopt_paths (vector pathvec, struct multipath * mpp);
> diff --git a/multipathd/main.c b/multipathd/main.c
> index bb5c1f1d..a21d96e4 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -409,36 +409,6 @@ set_multipath_wwid (struct multipath * mpp)
>  =09dm_get_uuid(mpp->alias, mpp->wwid, WWID_SIZE);
>  }
> =20
> -static void set_no_path_retry(struct multipath *mpp)
> -{
> -=09char is_queueing =3D 0;
> -
> -=09mpp->nr_active =3D pathcount(mpp, PATH_UP) + pathcount(mpp, PATH_GHOS=
T);
> -=09if (mpp->features && strstr(mpp->features, "queue_if_no_path"))
> -=09=09is_queueing =3D 1;
> -
> -=09switch (mpp->no_path_retry) {
> -=09case NO_PATH_RETRY_UNDEF:
> -=09=09break;
> -=09case NO_PATH_RETRY_FAIL:
> -=09=09if (is_queueing)
> -=09=09=09dm_queue_if_no_path(mpp->alias, 0);
> -=09=09break;
> -=09case NO_PATH_RETRY_QUEUE:
> -=09=09if (!is_queueing)
> -=09=09=09dm_queue_if_no_path(mpp->alias, 1);
> -=09=09break;
> -=09default:
> -=09=09if (mpp->nr_active > 0) {
> -=09=09=09mpp->retry_tick =3D 0;
> -=09=09=09if (!is_queueing)
> -=09=09=09=09dm_queue_if_no_path(mpp->alias, 1);
> -=09=09} else if (is_queueing && mpp->retry_tick =3D=3D 0)
> -=09=09=09enter_recovery_mode(mpp);
> -=09=09break;
> -=09}
> -}
> -
>  int __setup_multipath(struct vectors *vecs, struct multipath *mpp,
>  =09=09      int reset)
>  {
> --=20
> 2.24.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

