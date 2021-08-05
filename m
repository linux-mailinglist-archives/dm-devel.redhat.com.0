Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC8A3E408A
	for <lists+dm-devel@lfdr.de>; Mon,  9 Aug 2021 08:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628492026;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hm3xOkBuFnYNNDxmkqeG5QW3t2VDKSyDbJ/PibLu4JI=;
	b=dtL1dyRKU+hCK2no6F+1uQDNY0Uy/Nmavcos5stkRfyRb6hQV2/Qb10XYOyWppggJBP6xt
	cVWjuSaWomQvBFFqsT7o7u1xLdQEZN3uHQ3UzDlRVSq2IHspTyDGtZ5tr2q2Df2Qye2k0f
	749Tf3sasUtgX/uETv3opKTU7bYGUaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-h5UzwgjmM_GstJj6d6PwUA-1; Mon, 09 Aug 2021 02:53:42 -0400
X-MC-Unique: h5UzwgjmM_GstJj6d6PwUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1588B94EE1;
	Mon,  9 Aug 2021 06:53:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DADFE1036D36;
	Mon,  9 Aug 2021 06:53:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 95CAF4BB7C;
	Mon,  9 Aug 2021 06:53:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 175EI0ow018817 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Aug 2021 10:18:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0E3C6A904; Thu,  5 Aug 2021 14:18:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.39.193.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A98375D6A1;
	Thu,  5 Aug 2021 14:17:52 +0000 (UTC)
Date: Thu, 5 Aug 2021 15:17:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YQvzD4FlF7+AgrSw@stefanha-x1.localdomain>
References: <20210804095634.460779-1-hch@lst.de>
	<20210804095634.460779-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210804095634.460779-9-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 09 Aug 2021 02:53:04 -0400
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Ilya Dryomov <idryomov@gmail.com>, linux-um@lists.infradead.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, Stefan Haberland <sth@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, ceph-devel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Geoff Levand <geoff@infradead.org>,
	Phillip Lougher <phillip@squashfs.org.uk>
Subject: Re: [dm-devel] [PATCH 08/15] virtio_blk: use bvec_virt
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
Content-Type: multipart/mixed; boundary="===============7072026790979487166=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22


--===============7072026790979487166==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZDhkEMoj7rmqL+Fh"
Content-Disposition: inline


--ZDhkEMoj7rmqL+Fh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 11:56:27AM +0200, Christoph Hellwig wrote:
> Use bvec_virt instead of open coding it.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/virtio_blk.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ZDhkEMoj7rmqL+Fh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEL8w8ACgkQnKSrs4Gr
c8jPdgf+PcMouWs94g0uS6wpaN9fVvtvzsyRrLa0a4jPqggbtSulcjUYQzYZ9BGX
1xnrp3ABDt4KhYhX+iAsAxc4LmWEAYUruE6WxqsxaPKE19XcFuwM/tpwcv5U8/x+
2GvsXderla2RbbwTzdCFUf1m538Dw+eqH8+6Dt0Q6QjCC4EAX3ubWU+pX0K5rLNX
d7M7JCyOzOdU/VJYYVQDs1Vkpu/2AFtQT+hnq7veWzgQD+iFkLNZUEBVFm4jRbkC
5cfC+IUVtDkCjhD2offyhX+djtvDy5IZAnHEMv/ulIMmCzc0o1VgEy/5zNiKnjgg
5CdxbrfAKcA734P4gNIy/UD+hGlM6g==
=Cztj
-----END PGP SIGNATURE-----

--ZDhkEMoj7rmqL+Fh--


--===============7072026790979487166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel
--===============7072026790979487166==--

