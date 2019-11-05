Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 33D3EF048B
	for <lists+dm-devel@lfdr.de>; Tue,  5 Nov 2019 18:57:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572976664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C+VUpkEOysCfDa2ecFHCbbYJD2hITKKPFmQTMgOkXXE=;
	b=Oo6MHL9NTqeG4+77Q1yTwtzU++92Nbm8F/bquqRoTYGsCIKp2bUHhT7cHdrsmA3W4D9Qg0
	DqWL0ZfeUaK/pub/QRoupac09in+HlImedcDItsclXn9VCJru9n+Oq2BS0PcYwFLWzgQgw
	DGRmgyRBO60pkxT5EIhC1SeZHguXDdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-APH-7Jo0NVuWj55dfmzkLA-1; Tue, 05 Nov 2019 12:57:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEDC38017DD;
	Tue,  5 Nov 2019 17:57:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 653645C557;
	Tue,  5 Nov 2019 17:57:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A5CF18034EA;
	Tue,  5 Nov 2019 17:57:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA5Hv1Mo022742 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Nov 2019 12:57:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DD6CE5DA7C; Tue,  5 Nov 2019 17:57:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 228B65DA2C;
	Tue,  5 Nov 2019 17:56:59 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xA5Huwok024069; Tue, 5 Nov 2019 12:56:58 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xA5HuwEU024065; Tue, 5 Nov 2019 12:56:58 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 5 Nov 2019 12:56:58 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Maged Mokhtar <mmokhtar@petasan.org>, Mike Snitzer <msnitzer@redhat.com>
In-Reply-To: <be77e96c-5d37-a9de-b0ed-ee15d0c59215@petasan.org>
Message-ID: <alpine.LRH.2.02.1911051255320.23929@file01.intranet.prod.int.rdu2.redhat.com>
References: <be77e96c-5d37-a9de-b0ed-ee15d0c59215@petasan.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm writecache: handle REQ_FUA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: APH-7Jo0NVuWj55dfmzkLA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Acked-By: Mikulas Patocka <mpatocka@redhat.com>

=09Also add this line, so that it gets backported:

Cc: stable@vger.kernel.org=09# 4.18+

On Wed, 23 Oct 2019, Maged Mokhtar wrote:

> Call writecache_flush() on REQ_FUA.
>=20
> Signed-off-by: Maged Mokhtar <mmokhtar@petasan.org>
> ---
>  drivers/md/dm-writecache.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> --- a/drivers/md/dm-writecache.c=092019-10-23 22:01:18.480115962 +0200
> +++ b/drivers/md/dm-writecache.c=092019-10-23 22:02:08.616113729 +0200
> @@ -1218,7 +1218,8 @@ bio_copy:
>  =09=09=09}
>  =09=09} while (bio->bi_iter.bi_size);
>=20
> -=09=09if (unlikely(wc->uncommitted_blocks >=3D wc->autocommit_blocks))
> +=09=09if (unlikely(bio->bi_opf & REQ_FUA ||
> +=09=09=09=09wc->uncommitted_blocks >=3D
> wc->autocommit_blocks))
>  =09=09=09writecache_flush(wc);
>  =09=09else
>  =09=09=09writecache_schedule_autocommit(wc);
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

