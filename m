Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19232476BDB
	for <lists+dm-devel@lfdr.de>; Thu, 16 Dec 2021 09:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639643247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=57dYTjZENt2Spm7BKAj0aO4Pi4FPgW5+ee2P39M//jA=;
	b=Z9PwFhZ9Um1PqFNuT4yJEuBhkXgYTxArSarglN+bg814/w75crjoHVsLraa2S9itb6ctYm
	P+vbAlsCTRngvNI7xlYK8Ypi9xapmvz1HBe+iTNqv2Ob/svSyledvH6C+HmgW9sQEbxJ9U
	mBmVH7ONZEUwQfoJkTgZsHJRGz+uSTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-j-69S5beMsOn-kqqEP-rCQ-1; Thu, 16 Dec 2021 03:27:23 -0500
X-MC-Unique: j-69S5beMsOn-kqqEP-rCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08856801962;
	Thu, 16 Dec 2021 08:27:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A45E84D3B;
	Thu, 16 Dec 2021 08:27:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E64741809CB8;
	Thu, 16 Dec 2021 08:26:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BFAV82T026127 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Dec 2021 05:31:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 828157745F; Wed, 15 Dec 2021 10:31:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.39.195.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A249674EB5;
	Wed, 15 Dec 2021 10:30:52 +0000 (UTC)
Date: Wed, 15 Dec 2021 10:30:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <YbnD2iDmN92Bure9@stefanha-x1.localdomain>
References: <20211209063828.18944-1-hch@lst.de>
	<20211209063828.18944-5-hch@lst.de> <YbNhPXBg7G/ridkV@redhat.com>
	<CAPcyv4g4_yFqDeS+pnAZOxcB=Ua+iArK5mqn0iMG4PX6oL=F_A@mail.gmail.com>
	<20211213082318.GB21462@lst.de> <YbiosqZoG8e6rDkj@redhat.com>
	<CAPcyv4hFjKsPrPTB4NtLHiY8gyaELz9+45N1OFj3hz+uJ=9JnA@mail.gmail.com>
	<Ybj/azxrUyU4PZEr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Ybj/azxrUyU4PZEr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 16 Dec 2021 03:25:06 -0500
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
	linux-s390 <linux-s390@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Mike Snitzer <snitzer@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>,
	virtualization@lists.linux-foundation.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/5] dax: remove the copy_from_iter and
 copy_to_iter methods
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
Content-Type: multipart/mixed; boundary="===============6922649471587579776=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13


--===============6922649471587579776==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fVCyKoqL/Gzi3K+T"
Content-Disposition: inline


--fVCyKoqL/Gzi3K+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 03:32:43PM -0500, Vivek Goyal wrote:
> On Tue, Dec 14, 2021 at 08:41:30AM -0800, Dan Williams wrote:
> > On Tue, Dec 14, 2021 at 6:23 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> > >
> > > On Mon, Dec 13, 2021 at 09:23:18AM +0100, Christoph Hellwig wrote:
> > > > On Sun, Dec 12, 2021 at 06:44:26AM -0800, Dan Williams wrote:
> > > > > On Fri, Dec 10, 2021 at 6:17 AM Vivek Goyal <vgoyal@redhat.com> w=
rote:
> > > > > > Going forward, I am wondering should virtiofs use flushcache ve=
rsion as
> > > > > > well. What if host filesystem is using DAX and mapping persiste=
nt memory
> > > > > > pfn directly into qemu address space. I have never tested that.
> > > > > >
> > > > > > Right now we are relying on applications to do fsync/msync on v=
irtiofs
> > > > > > for data persistence.
> > > > >
> > > > > This sounds like it would need coordination with a paravirtualized
> > > > > driver that can indicate whether the host side is pmem or not, li=
ke
> > > > > the virtio_pmem driver. However, if the guest sends any fsync/msy=
nc
> > > > > you would still need to go explicitly cache flush any dirty page
> > > > > because you can't necessarily trust that the guest did that alrea=
dy.
> > > >
> > > > Do we?  The application can't really know what backend it is on, so
> > > > it sounds like the current virtiofs implementation doesn't really, =
does it?
> > >
> > > Agreed that application does not know what backend it is on. So virti=
ofs
> > > just offers regular posix API where applications have to do fsync/msy=
nc
> > > for data persistence. No support for mmap(MAP_SYNC). We don't offer p=
ersistent
> > > memory programming model on virtiofs. That's not the expectation. DAX
> > > is used only to bypass guest page cache.
> > >
> > > With this assumption, I think we might not have to use flushcache ver=
sion
> > > at all even if shared filesystem is on persistent memory on host.
> > >
> > > - We mmap() host files into qemu address space. So any dax store in v=
irtiofs
> > >   should make corresponding pages dirty in page cache on host and when
> > >   and fsync()/msync() comes later, it should flush all the data to PM=
EM.
> > >
> > > - In case of file extending writes, virtiofs falls back to regular
> > >   FUSE_WRITE path (and not use DAX), and in that case host pmem driver
> > >   should make sure writes are flushed to pmem immediately.
> > >
> > > Are there any other path I am missing. If not, looks like we might not
> > > have to use flushcache version in virtiofs at all as long as we are n=
ot
> > > offering guest applications user space flushes and MAP_SYNC support.
> > >
> > > We still might have to use machine check safe variant though as loads
> > > might generate synchronous machine check. What's not clear to me is
> > > that if this MC safe variant should be used only in case of PMEM or
> > > should it be used in case of non-PMEM as well.
> >=20
> > It should be used on any memory address that can throw exception on
> > load, which is any physical address, in paths that can tolerate
> > memcpy() returning an error code, most I/O paths, and can tolerate
> > slower copy performance on older platforms that do not support MC
> > recovery with fast string operations, to date that's only PMEM users.
>=20
> Ok, So basically latest cpus can do fast string operations with MC
> recovery so that using MC safe variant is not a problem.
>=20
> Then there is range of cpus which can do MC recovery but do slower
> versions of memcpy and that's where the issue is.
>=20
> So if we knew that virtiofs dax window is backed by a pmem device
> then we should always use MC safe variant. Even if it means paying
> the price of slow version for the sake of correctness.=20
>=20
> But if we are not using pmem on host, then there is no point in
> using MC safe variant.
>=20
> IOW.
>=20
> 	if (virtiofs_backed_by_pmem) {
> 		use_mc_safe_version
> 	else
> 		use_non_mc_safe_version
> 	}
>=20
> Now question is, how do we know if virtiofs dax window is backed by
> a pmem or not. I checked virtio_pmem driver and that does not seem
> to communicate anything like that. It just communicates start of the
> range and size of range, nothing else.
>=20
> I don't have full handle on stack of modules of virtio_pmem, but my guess
> is it probably is using MC safe version always (because it does not
> know anthing about the backing storage).
>=20
> /me will definitely like to pay penalty of slower memcpy if virtiofs
> device is not backed by a pmem.

Reads from the page cache handle machine checks (filemap_read() ->
raw_copy_to_user()). I think virtiofs should therefore always handle
machine checks when reading from the DAX Window.

Stefan

--fVCyKoqL/Gzi3K+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG5w9oACgkQnKSrs4Gr
c8j4SQf/fNuEZjHQ7MgEmyQ7cl+ER5jQ4O1RsP/Y0hXNm9hU5bbbbeRF+BIcSsj7
cmU9GGe6McyCdpHBOjaUPbRJkEmwA3F6Sbr4c8xm8dL21fPP6TNJu/4gLXmI6+KY
kNihoEXb/lWXT8YQcngs3s1pkScfsZaxPnUo6m4E/dMLbxkikpIDqfQI9m6KzSUL
uqODFy0itv0pIKrN+OGweqx+UKBZ3DofuOzUUAGZRae/WENY7fRhVzPH359eDfXO
aDPOB9PFwnNxHYiNpQDgyhoOeG0B6+erdSDHzPcYvOoXWHbsaHKI854Ocg3i1sah
QCfMd4tH3XVaVS1cwnupcnXt9IFNmg==
=ySzP
-----END PGP SIGNATURE-----

--fVCyKoqL/Gzi3K+T--


--===============6922649471587579776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel
--===============6922649471587579776==--

