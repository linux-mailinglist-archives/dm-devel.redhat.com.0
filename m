Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 10E2230A655
	for <lists+dm-devel@lfdr.de>; Mon,  1 Feb 2021 12:17:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-STyIpWI8PWOVOFuh80B-4g-1; Mon, 01 Feb 2021 06:17:10 -0500
X-MC-Unique: STyIpWI8PWOVOFuh80B-4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFAB21005504;
	Mon,  1 Feb 2021 11:17:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D00C39A64;
	Mon,  1 Feb 2021 11:17:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11DCE180954D;
	Mon,  1 Feb 2021 11:16:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 111BGiTa000975 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Feb 2021 06:16:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5323D100CBC2; Mon,  1 Feb 2021 11:16:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F650112D177
	for <dm-devel@redhat.com>; Mon,  1 Feb 2021 11:16:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31C3F800183
	for <dm-devel@redhat.com>; Mon,  1 Feb 2021 11:16:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-472-zlUqtMrvM5KawXDVeLgcnw-1;
	Mon, 01 Feb 2021 06:16:40 -0500
X-MC-Unique: zlUqtMrvM5KawXDVeLgcnw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CB4A4AD4E;
	Mon,  1 Feb 2021 11:16:38 +0000 (UTC)
Message-ID: <3992c887b6b9a00c4faad17c1d381d2afb4a2e86.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Mon, 01 Feb 2021 12:16:38 +0100
In-Reply-To: <d6652b08-2d6c-ac46-9d73-b252bc26f41a@huawei.com>
References: <d6652b08-2d6c-ac46-9d73-b252bc26f41a@huawei.com>
User-Agent: Evolution 3.38.2
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 111BGiTa000975
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>
Subject: Re: [dm-devel] libmultipath: fix NULL dereference in get_be64
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello lixiaokeng,

On Sun, 2021-01-31 at 18:55 +0800, lixiaokeng wrote:
> When find_multipaths is no and add local path by multiapthd,
> the local path will be filtered by filter_property. The
> pp->mpp is not set in adopt_paths. Then the pp->mpp will be
> dereferenced in get_be6.
>=20
> Here add check pp->mpp in ev_add_path.
>=20
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>

I don't understand. All callers (uev_add_path(), cli_add_path(),
check_path()) call pathinfo() first, which would return
PATHINFO_SKIPPED if the path was blacklisted. How do you end up=20
in ev_add_path() with a blacklisted path?

And how is it possible that add_map_with_path(vecs, pp, 1) returns non-
NULL and pp->mpp is NULL?

Please explain.

Martin



> ---
> =A0multipathd/main.c | 2 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/multipathd/main.c b/multipathd/main.c
> index a4abbb2..8ad8bea 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -1010,7 +1010,7 @@ rescan:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
> =A0=A0=A0=A0=A0=A0=A0 }
> =A0=A0=A0=A0=A0=A0=A0 condlog(4,"%s: creating new map", pp->dev);
> -=A0=A0=A0=A0=A0=A0 if ((mpp =3D add_map_with_path(vecs, pp, 1))) {
> +=A0=A0=A0=A0=A0=A0 if ((mpp =3D add_map_with_path(vecs, pp, 1)) && pp->m=
pp) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mpp->action =3D ACT_CREATE;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * We don't depend on ACT_CREATE, as =
domap will





--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

