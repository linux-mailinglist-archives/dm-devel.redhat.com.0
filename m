Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF6645B10
	for <lists+dm-devel@lfdr.de>; Wed,  7 Dec 2022 14:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670420284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TTviTmDisuW6lLZ9/CWwIcNEQaaL3lEV9rf9vI7tVMs=;
	b=FWsnCl2VVQN/ZdbTt/uwOVvR7n2VdJHj9nwqrn+fs/ZlDV0VfuugRzNZ63IH9gXGeief44
	UhIMpGUMbOOu021tOeuAEpTxewspaemEyOPOvogmmK2JGnAJctXmh0exEB33cg5OI9qj3A
	zIut8zLI4v5ye7eZadte26/pKMPTelY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-t8YeS0xtPteiXqymFVeRJg-1; Wed, 07 Dec 2022 08:37:25 -0500
X-MC-Unique: t8YeS0xtPteiXqymFVeRJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5612D101AA4A;
	Wed,  7 Dec 2022 13:37:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A62072166B29;
	Wed,  7 Dec 2022 13:37:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6843F1946A4B;
	Wed,  7 Dec 2022 13:37:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E0B891946586
 for <dm-devel@listman.corp.redhat.com>; Tue,  6 Dec 2022 16:31:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB7792024CBE; Tue,  6 Dec 2022 16:31:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.39.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 090482028CE4;
 Tue,  6 Dec 2022 16:31:47 +0000 (UTC)
Date: Tue, 6 Dec 2022 11:31:44 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Message-ID: <Y49ucLGtCOtnbM0K@fedora>
References: <20221205162035.2261037-1-alvaro.karsz@solid-run.com>
MIME-Version: 1.0
In-Reply-To: <20221205162035.2261037-1-alvaro.karsz@solid-run.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 07 Dec 2022 13:37:16 +0000
Subject: Re: [dm-devel] [PATCH v3] virtio_blk: add VIRTIO_BLK_F_LIFETIME
 feature support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/mixed; boundary="===============8509410602873155565=="
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6


--===============8509410602873155565==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kf1ZFtRxkbtTQRVa"
Content-Disposition: inline


--Kf1ZFtRxkbtTQRVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 05, 2022 at 06:20:34PM +0200, Alvaro Karsz wrote:

I don't like that the ioctl lifetime struct is passed through
little-endian from the device to userspace. The point of this new ioctl
is not to be a passthrough interface. The kernel should define a proper
UABI struct for the ioctl and handle endianness conversion. But I think
Michael is happy with this approach, so nevermind.

> @@ -219,4 +247,8 @@ struct virtio_scsi_inhdr {
>  #define VIRTIO_BLK_S_OK		0
>  #define VIRTIO_BLK_S_IOERR	1
>  #define VIRTIO_BLK_S_UNSUPP	2
> +
> +/* Virtblk ioctl commands */
> +#define VBLK_GET_LIFETIME	_IOR('r', 0, struct virtio_blk_lifetime)

Does something include <linux/ioctl.h> for _IOR()? Failure to include
the necessary header file could break userspace applications that
include <linux/virtio_blk.h>.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Kf1ZFtRxkbtTQRVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOPbnAACgkQnKSrs4Gr
c8iLOggAsIIn2qOsdq8S+xOJLEgfRN7/BoDt8YZ8CMsipVZs0G2Y6iVOhZFBNe98
W/edX+RVO5c7C8wPToA0QPqxO3hw7I/g6ztXeAm4KTx2mduzxQilJRDipEfpFOXV
OnW7IUGMedQPrwbMNqeT32QpFk/OVicOH/QguVDmQajXMIPUSvfBCnsSm8aHDl9p
YvADYVTPdoxJt3OTCGKXU7pfUwSC6/w8KVfxk3jnNKkuCDoEEeuCgkhyEc+CpGlo
i6z4bn23yupNn/d9CPROsEYRSB07OI8iAj7n6r1QMP2TG9+dOHgA4nnd0kcSWwYO
ZOnWHf2RJzEb34YNO5Bm0pio+X7vYQ==
=PdE9
-----END PGP SIGNATURE-----

--Kf1ZFtRxkbtTQRVa--

--===============8509410602873155565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============8509410602873155565==--

