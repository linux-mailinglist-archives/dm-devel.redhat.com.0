Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E55BA86B
	for <lists+dm-devel@lfdr.de>; Fri, 16 Sep 2022 10:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663317963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3E4KExRIuO+iOb5UxsqYn9YUcmP/QlT21Hz2CgkEPNI=;
	b=I850wKifX9Symcs3Lm7mfOT9z4Ab/Ot+V34f5TT36DP7x80fjjxWI0T6cuwlycKlIuEaLg
	JZHAe55IV/IyKvnhfRTsxsU94D6rn1Ceg4R4VDuKvhz+71W1El/EvEneJHPPaf7obob7BM
	GZ6LtUUrpvDdLjD3ZlHZ5oMnHee12RM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-Ers9QDGpPkWlCgJFmpaojA-1; Fri, 16 Sep 2022 04:45:07 -0400
X-MC-Unique: Ers9QDGpPkWlCgJFmpaojA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36FF61C05EB3;
	Fri, 16 Sep 2022 08:45:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECA6140C6EC2;
	Fri, 16 Sep 2022 08:44:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 94F78194658F;
	Fri, 16 Sep 2022 08:44:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9A5421946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 16 Sep 2022 06:09:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7BA96C15BB2; Fri, 16 Sep 2022 06:09:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46FC3C15BA4;
 Fri, 16 Sep 2022 06:09:56 +0000 (UTC)
Date: Fri, 16 Sep 2022 07:09:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sarthak Kukreti <sarthakkukreti@chromium.org>
Message-ID: <YyQTM5PRT2o/GDwy@fedora>
References: <20220915164826.1396245-1-sarthakkukreti@google.com>
MIME-Version: 1.0
In-Reply-To: <20220915164826.1396245-1-sarthakkukreti@google.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Fri, 16 Sep 2022 08:44:55 +0000
Subject: Re: [dm-devel] [PATCH RFC 0/8] Introduce provisioning primitives
 for thinly provisioned storage
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
Cc: Jens Axboe <axboe@kernel.dk>, Gwendal Grignou <gwendal@google.com>,
 Theodore Ts'o <tytso@mit.edu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bart Van Assche <bvanassche@google.com>,
 Mike Snitzer <snitzer@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
 Daniil Lunev <dlunev@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-ext4@vger.kernel.org, Evan Green <evgreen@google.com>,
 Alasdair Kergon <agk@redhat.com>
Content-Type: multipart/mixed; boundary="===============2498237334590000574=="
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2


--===============2498237334590000574==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w/wnRFkY16cMLsvF"
Content-Disposition: inline


--w/wnRFkY16cMLsvF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 09:48:18AM -0700, Sarthak Kukreti wrote:
> From: Sarthak Kukreti <sarthakkukreti@chromium.org>
>=20
> Hi,
>=20
> This patch series is an RFC of a mechanism to pass through provision requ=
ests on stacked thinly provisioned storage devices/filesystems.
>=20
> The linux kernel provides several mechanisms to set up thinly provisioned=
 block storage abstractions (eg. dm-thin, loop devices over sparse files), =
either directly as block devices or backing storage for filesystems. Curren=
tly, short of writing data to either the device or filesystem, there is no =
way for users to pre-allocate space for use in such storage setups. Conside=
r the following use-cases:
>=20
> 1) Suspend-to-disk and resume from a dm-thin device: In order to ensure t=
hat the underlying thinpool metadata is not modified during the suspend mec=
hanism, the dm-thin device needs to be fully provisioned.
> 2) If a filesystem uses a loop device over a sparse file, fallocate() on =
the filesystem will allocate blocks for files but the underlying sparse fil=
e will remain intact.
> 3) Another example is virtual machine using a sparse file/dm-thin as a st=
orage device; by default, allocations within the VM boundaries will not aff=
ect the host.
> 4) Several storage standards support mechanisms for thin provisioning on =
real hardware devices. For example:
>   a. The NVMe spec 1.0b section 2.1.1 loosely talks about thin provisioni=
ng: "When the THINP bit in the NSFEAT field of the Identify Namespace data =
structure is set to =E2=80=981=E2=80=99, the controller ... shall track the=
 number of allocated blocks in the Namespace Utilization field"
>   b. The SCSi Block Commands reference - 4 section references "Thin provi=
sioned logical units",
>   c. UFS 3.0 spec section 13.3.3 references "Thin provisioning".

When REQ_OP_PROVISION is sent on an already-allocated range of blocks,
are those blocks zeroed? NVMe Write Zeroes with Deallocate=3D0 works this
way, for example. That behavior is counterintuitive since the operation
name suggests it just affects the logical block's provisioning state,
not the contents of the blocks.

> In all of the above situations, currently the only way for pre-allocating=
 space is to issue writes (or use WRITE_ZEROES/WRITE_SAME). However, that d=
oes not scale well with larger pre-allocation sizes.=20

What exactly is the issue with WRITE_ZEROES scalability? Are you
referring to cases where the device doesn't support an efficient
WRITE_ZEROES command and actually writes blocks filled with zeroes
instead of updating internal allocation metadata cheaply?

Stefan

--w/wnRFkY16cMLsvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMkEzMACgkQnKSrs4Gr
c8hn3wgAjJDAhaMbZwpCmdUdohpKtyMia1I6OsTlcURdfUV2iu1afmfcG5c7Q2pV
ZPZC+DZhgUOEkpD1Aj5gCjpi8/1EXpmCwDGB36AgVnwzCMV9QLdW7B3xoCvJipNa
b+KGhLFliE0pBX9ZGYqCZ7a8Tuz2OGtNhpAsd/tUOMYCLzc6WTqTIeB6Wv6rYrw4
kIF+kP7pEK4INQYAav+pYDzZxqd4yrKINa6PEOZUMxzuLnH4eW8l+xrsTDIMbA+e
ummgls1ZrhgPhUJNqscmevqfJMLqMsZTxN6+B9zH+G6GrxAc1rqeRTdlMAwwYxYg
DIMeBAXmfutiQDOVF8Tj6W1p7wrNLw==
=s/zf
-----END PGP SIGNATURE-----

--w/wnRFkY16cMLsvF--

--===============2498237334590000574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============2498237334590000574==--

