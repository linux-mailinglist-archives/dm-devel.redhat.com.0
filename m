Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C55BDC30
	for <lists+dm-devel@lfdr.de>; Tue, 20 Sep 2022 07:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663651087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eu68UqFEbdaGYwduECNXeg2bk/8DjriPxG/mMR0bZJY=;
	b=VSfoN5JZYrVXbeq4Bg8Exe5gZPI2L7F+8hdYx+QmIrmU2XE3stghmEp1yci+Wgs3Hfr/9B
	dd4LCwW1Ia3VR6iDOg2O8fMIvu+e4xaP4D2ErNLWyQ589bdwaYg5gilYy5G24Hs6sr2poX
	qtN2Gvy14cEpZk7NCc7bp/odCtGl6B0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-HtOmnA1FMg2P5DiF6jjn-Q-1; Tue, 20 Sep 2022 01:18:04 -0400
X-MC-Unique: HtOmnA1FMg2P5DiF6jjn-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D7CA29ABA32;
	Tue, 20 Sep 2022 05:18:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73A411415102;
	Tue, 20 Sep 2022 05:17:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B0CDE1946A50;
	Tue, 20 Sep 2022 05:17:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9847319465A0
 for <dm-devel@listman.corp.redhat.com>; Mon, 19 Sep 2022 16:36:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 30570207B34B; Mon, 19 Sep 2022 16:36:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3F74207B34A;
 Mon, 19 Sep 2022 16:36:50 +0000 (UTC)
Date: Mon, 19 Sep 2022 12:36:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sarthak Kukreti <sarthakkukreti@chromium.org>
Message-ID: <YyiaoHcueK9g5KVy@fedora>
References: <20220915164826.1396245-1-sarthakkukreti@google.com>
 <YyU5CyQfS+64xmnm@magnolia>
 <CAG9=OMNPnsjaUw2EUG0XFjV94-V1eD63V+1anoGM=EWKyzXEfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAG9=OMNPnsjaUw2EUG0XFjV94-V1eD63V+1anoGM=EWKyzXEfg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 20 Sep 2022 05:17:55 +0000
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
 "Darrick J. Wong" <djwong@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Bart Van Assche <bvanassche@google.com>, Mike Snitzer <snitzer@kernel.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Evan Green <evgreen@google.com>, Daniil Lunev <dlunev@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-ext4@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Content-Type: multipart/mixed; boundary="===============2371803024365105041=="
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7


--===============2371803024365105041==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FvyRLtY8FNQa7tFK"
Content-Disposition: inline


--FvyRLtY8FNQa7tFK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2022 at 12:46:33PM -0700, Sarthak Kukreti wrote:
> On Fri, Sep 16, 2022 at 8:03 PM Darrick J. Wong <djwong@kernel.org> wrote:
> >
> > On Thu, Sep 15, 2022 at 09:48:18AM -0700, Sarthak Kukreti wrote:
> > > From: Sarthak Kukreti <sarthakkukreti@chromium.org>
> > >
> > > Hi,
> > >
> > > This patch series is an RFC of a mechanism to pass through provision
> > > requests on stacked thinly provisioned storage devices/filesystems.
> >
> > [Reflowed text]
> >
> > > The linux kernel provides several mechanisms to set up thinly
> > > provisioned block storage abstractions (eg. dm-thin, loop devices over
> > > sparse files), either directly as block devices or backing storage for
> > > filesystems. Currently, short of writing data to either the device or
> > > filesystem, there is no way for users to pre-allocate space for use in
> > > such storage setups. Consider the following use-cases:
> > >
> > > 1) Suspend-to-disk and resume from a dm-thin device: In order to
> > > ensure that the underlying thinpool metadata is not modified during
> > > the suspend mechanism, the dm-thin device needs to be fully
> > > provisioned.
> > > 2) If a filesystem uses a loop device over a sparse file, fallocate()
> > > on the filesystem will allocate blocks for files but the underlying
> > > sparse file will remain intact.
> > > 3) Another example is virtual machine using a sparse file/dm-thin as a
> > > storage device; by default, allocations within the VM boundaries will
> > > not affect the host.
> > > 4) Several storage standards support mechanisms for thin provisioning
> > > on real hardware devices. For example:
> > >   a. The NVMe spec 1.0b section 2.1.1 loosely talks about thin
> > >   provisioning: "When the THINP bit in the NSFEAT field of the
> > >   Identify Namespace data structure is set to =E2=80=981=E2=80=99, th=
e controller ...
> > >   shall track the number of allocated blocks in the Namespace
> > >   Utilization field"
> > >   b. The SCSi Block Commands reference - 4 section references "Thin
> > >   provisioned logical units",
> > >   c. UFS 3.0 spec section 13.3.3 references "Thin provisioning".
> > >
> > > In all of the above situations, currently the only way for
> > > pre-allocating space is to issue writes (or use
> > > WRITE_ZEROES/WRITE_SAME). However, that does not scale well with
> > > larger pre-allocation sizes.
> > >
> > > This patchset introduces primitives to support block-level
> > > provisioning (note: the term 'provisioning' is used to prevent
> > > overloading the term 'allocations/pre-allocations') requests across
> > > filesystems and block devices. This allows fallocate() and file
> > > creation requests to reserve space across stacked layers of block
> > > devices and filesystems. Currently, the patchset covers a prototype on
> > > the device-mapper targets, loop device and ext4, but the same
> > > mechanism can be extended to other filesystems/block devices as well
> > > as extended for use with devices in 4 a-c.
> >
> > If you call REQ_OP_PROVISION on an unmapped LBA range of a block device
> > and then try to read the provisioned blocks, what do you get?  Zeroes?
> > Random stale disk contents?
> >
> > I think I saw elsewhere in the thread that any mapped LBAs within the
> > provisioning range are left alone (i.e. not zeroed) so I'll proceed on
> > that basis.
> >
> For block devices, I'd say it's definitely possible to get stale data, de=
pending
> on the implementation of the allocation layer; for example, with dm-thinp=
ool,
> the default setting via using LVM2 tools is to zero out blocks on allocat=
ion.
> But that's configurable and can be turned off to improve performance.
>=20
> Similarly, for actual devices that end up supporting thin provisioning, u=
nless
> the specification absolutely mandates that an LBA contains zeroes post
> allocation, some implementations will definitely miss out on that (probab=
ly
> similar to the semantics of discard_zeroes_data today). I'm operating und=
er
> the assumption that it's possible to get stale data from LBAs allocated u=
sing
> provision requests at the block layer and trying to see if we can create a
> safe default operating model from that.

Please explain the semantics of REQ_OP_PROVISION in the
code/documentation in the next revision.

Thanks,
Stefan

--FvyRLtY8FNQa7tFK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMomqAACgkQnKSrs4Gr
c8g4vQf/TYZDC6JT8LCVfsDWkwegZYqhX4pz86cryayWYFUYe3u9UmLPrY/TuE1y
XQwzM9jsI+LdCcQtLZtvre/JsJB6esC/LGv+FTGOSju2n0FLXTS7v80LujcoHnKE
7RZ0eliz4XGK/X1Q6rLVgNFhFUcQIM4yYNKsAklXpSApXwgQ5W8mKI7GVqi+rhds
UynMkkK2XKPIeBVRJg7gNCx4vTnwas+AQ5QCuAoGpRxvTcPmKlP9krCi0owiGZKR
08ORDLnl4g8uxmkJQoYR6Ep6bnJY4mq9XSeNMYwOEWAd63h3aYO27kxvClgMo0mV
wb0jbsC1V0Qd8XvrdufP80ym3TVKCg==
=HyVg
-----END PGP SIGNATURE-----

--FvyRLtY8FNQa7tFK--

--===============2371803024365105041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============2371803024365105041==--

