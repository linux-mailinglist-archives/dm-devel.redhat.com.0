Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB43476BED
	for <lists+dm-devel@lfdr.de>; Thu, 16 Dec 2021 09:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639643323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PyO6wbr1cvXB2Zg2qeenZ4mpSmetI6pnZqqXEx66r/U=;
	b=IP4qGnPKQoS27vWQ9EOB63G7aMEkfx1dm+16Rn4Wqvp0NtfA7KuET1k4g02l1rQn7mTTX9
	h0b93nav+xpW5jn1PdWQ320nEVZfzyflR8wIGabr3aa1q23AmdW/jeHhGj8cvysu8przki
	9ChiDt3tzLLkpuYucoDAzr8yQUJt7Ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-rzNvkgSdPe2vzl3YLUgwyQ-1; Thu, 16 Dec 2021 03:28:41 -0500
X-MC-Unique: rzNvkgSdPe2vzl3YLUgwyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0757B1006AA0;
	Thu, 16 Dec 2021 08:28:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA9A97EBE8;
	Thu, 16 Dec 2021 08:28:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75AB71809CB9;
	Thu, 16 Dec 2021 08:28:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BFHRQCw017418 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Dec 2021 12:27:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C43A91024879; Wed, 15 Dec 2021 17:27:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.39.195.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B82A10246F6;
	Wed, 15 Dec 2021 17:27:26 +0000 (UTC)
Date: Wed, 15 Dec 2021 17:27:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <YbolfThPBPYsY42M@stefanha-x1.localdomain>
References: <20211209063828.18944-1-hch@lst.de>
	<20211209063828.18944-5-hch@lst.de> <YbNhPXBg7G/ridkV@redhat.com>
	<CAPcyv4g4_yFqDeS+pnAZOxcB=Ua+iArK5mqn0iMG4PX6oL=F_A@mail.gmail.com>
	<20211213082318.GB21462@lst.de> <YbiosqZoG8e6rDkj@redhat.com>
	<CAPcyv4hFjKsPrPTB4NtLHiY8gyaELz9+45N1OFj3hz+uJ=9JnA@mail.gmail.com>
	<Ybj/azxrUyU4PZEr@redhat.com>
	<YbnD2iDmN92Bure9@stefanha-x1.localdomain>
	<YboNJWC3jhX4Vsn7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YboNJWC3jhX4Vsn7@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Type: multipart/mixed; boundary="===============8161871511489307724=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12


--===============8161871511489307724==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mvAOsRhNR7ZRjZdj"
Content-Disposition: inline


--mvAOsRhNR7ZRjZdj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:43:33AM -0500, Vivek Goyal wrote:
> On Wed, Dec 15, 2021 at 10:30:50AM +0000, Stefan Hajnoczi wrote:
> > On Tue, Dec 14, 2021 at 03:32:43PM -0500, Vivek Goyal wrote:
> > > On Tue, Dec 14, 2021 at 08:41:30AM -0800, Dan Williams wrote:
> > > > On Tue, Dec 14, 2021 at 6:23 AM Vivek Goyal <vgoyal@redhat.com> wro=
te:
> > > > >
> > > > > On Mon, Dec 13, 2021 at 09:23:18AM +0100, Christoph Hellwig wrote:
> > > > > > On Sun, Dec 12, 2021 at 06:44:26AM -0800, Dan Williams wrote:
> > > > > > > On Fri, Dec 10, 2021 at 6:17 AM Vivek Goyal <vgoyal@redhat.co=
m> wrote:
> > > > > > > > Going forward, I am wondering should virtiofs use flushcach=
e version as
> > > > > > > > well. What if host filesystem is using DAX and mapping pers=
istent memory
> > > > > > > > pfn directly into qemu address space. I have never tested t=
hat.
> > > > > > > >
> > > > > > > > Right now we are relying on applications to do fsync/msync =
on virtiofs
> > > > > > > > for data persistence.
> > > > > > >
> > > > > > > This sounds like it would need coordination with a paravirtua=
lized
> > > > > > > driver that can indicate whether the host side is pmem or not=
, like
> > > > > > > the virtio_pmem driver. However, if the guest sends any fsync=
/msync
> > > > > > > you would still need to go explicitly cache flush any dirty p=
age
> > > > > > > because you can't necessarily trust that the guest did that a=
lready.
> > > > > >
> > > > > > Do we?  The application can't really know what backend it is on=
, so
> > > > > > it sounds like the current virtiofs implementation doesn't real=
ly, does it?
> > > > >
> > > > > Agreed that application does not know what backend it is on. So v=
irtiofs
> > > > > just offers regular posix API where applications have to do fsync=
/msync
> > > > > for data persistence. No support for mmap(MAP_SYNC). We don't off=
er persistent
> > > > > memory programming model on virtiofs. That's not the expectation.=
 DAX
> > > > > is used only to bypass guest page cache.
> > > > >
> > > > > With this assumption, I think we might not have to use flushcache=
 version
> > > > > at all even if shared filesystem is on persistent memory on host.
> > > > >
> > > > > - We mmap() host files into qemu address space. So any dax store =
in virtiofs
> > > > >   should make corresponding pages dirty in page cache on host and=
 when
> > > > >   and fsync()/msync() comes later, it should flush all the data t=
o PMEM.
> > > > >
> > > > > - In case of file extending writes, virtiofs falls back to regular
> > > > >   FUSE_WRITE path (and not use DAX), and in that case host pmem d=
river
> > > > >   should make sure writes are flushed to pmem immediately.
> > > > >
> > > > > Are there any other path I am missing. If not, looks like we migh=
t not
> > > > > have to use flushcache version in virtiofs at all as long as we a=
re not
> > > > > offering guest applications user space flushes and MAP_SYNC suppo=
rt.
> > > > >
> > > > > We still might have to use machine check safe variant though as l=
oads
> > > > > might generate synchronous machine check. What's not clear to me =
is
> > > > > that if this MC safe variant should be used only in case of PMEM =
or
> > > > > should it be used in case of non-PMEM as well.
> > > >=20
> > > > It should be used on any memory address that can throw exception on
> > > > load, which is any physical address, in paths that can tolerate
> > > > memcpy() returning an error code, most I/O paths, and can tolerate
> > > > slower copy performance on older platforms that do not support MC
> > > > recovery with fast string operations, to date that's only PMEM user=
s.
> > >=20
> > > Ok, So basically latest cpus can do fast string operations with MC
> > > recovery so that using MC safe variant is not a problem.
> > >=20
> > > Then there is range of cpus which can do MC recovery but do slower
> > > versions of memcpy and that's where the issue is.
> > >=20
> > > So if we knew that virtiofs dax window is backed by a pmem device
> > > then we should always use MC safe variant. Even if it means paying
> > > the price of slow version for the sake of correctness.=20
> > >=20
> > > But if we are not using pmem on host, then there is no point in
> > > using MC safe variant.
> > >=20
> > > IOW.
> > >=20
> > > 	if (virtiofs_backed_by_pmem) {
> > > 		use_mc_safe_version
> > > 	else
> > > 		use_non_mc_safe_version
> > > 	}
> > >=20
> > > Now question is, how do we know if virtiofs dax window is backed by
> > > a pmem or not. I checked virtio_pmem driver and that does not seem
> > > to communicate anything like that. It just communicates start of the
> > > range and size of range, nothing else.
> > >=20
> > > I don't have full handle on stack of modules of virtio_pmem, but my g=
uess
> > > is it probably is using MC safe version always (because it does not
> > > know anthing about the backing storage).
> > >=20
> > > /me will definitely like to pay penalty of slower memcpy if virtiofs
> > > device is not backed by a pmem.
> >=20
> > Reads from the page cache handle machine checks (filemap_read() ->
> > raw_copy_to_user()). I think virtiofs should therefore always handle
> > machine checks when reading from the DAX Window.
>=20
> IIUC, raw_copy_to_user() does not handle recovery from machine check. For
> example, it can call copy_user_enhanced_fast_string() if cpu supports
> X86_FEATURE_ERMS. But equivalent machine check safe version is
> copy_mc_enhanced_fast_string() instead.
>=20
> Hence, I don't think reading from page cache is using machine check safe
> variants by default. This copy_mc_to_user() path has to be taken
> explicitly for machine check safe variants. And currently only pmem driver
> seems to take it by calling _copy_mc_to_iter().

Now I'm confused between copy_user_enhanced_fast_string() and
copy_mc_enhanced_fast_string(). The code is very similar, the main
difference being _ASM_EXTABLE_CPY() vs _ASM_EXTABLE_TYPE(..., ...,
EX_TYPE_DEFAULT_MCE_SAFE).

Both return IN_KERNEL_RECOV from error_context() and set mce->kflags |=3D
MCE_IN_KERNEL_RECOV. The difference is that
copy_user_enhanced_fast_string() also sets mce->kflags |=3D
MCE_IN_KERNEL_COPYIN in copy_user_enhanced_fast_string() whereas
copy_mc_enhanced_fast_string() does not.

I must be missing something:

1. What is the purpose of the extable in
   copy_user_enhanced_fast_string() if that function cannot recover from
   MCEs?

2. Why is there a "Don't try to copy the tail if machine check happened"
   comment in .Lcopy_user_handle_tail?

Stefan

--mvAOsRhNR7ZRjZdj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG6JXwACgkQnKSrs4Gr
c8g20gf/XF2pZS00uIMktbEkbs+5sV7r/nbUOurS2Fu+1W3U08NAPX0qjTOFGq+X
cy1g18eZGhoTCj6Qo2iHXY2UHXHUa+QAh36xdqheNNv3nfUJlYpDslUQFjs+HMlw
Oovkv3Z7Alb928XcpHcw9H9az499CObMpl8mWUTmNU2aJRejCmjlQzI6AEC7HSVa
8t0YtF88+PsD10ysO11iNU+jjMDkwReMdTwC1paIsKMk55n08pHCaDm240XZzr5S
w13vaMFqzaXB52wNO63ZLcVxcoiugjsZD59B06VNixhvib9S7NkpW96KQdrYDMIC
HG4wDWUSji5TTbO+7onWdznIC6ifUg==
=2h1S
-----END PGP SIGNATURE-----

--mvAOsRhNR7ZRjZdj--


--===============8161871511489307724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel
--===============8161871511489307724==--

