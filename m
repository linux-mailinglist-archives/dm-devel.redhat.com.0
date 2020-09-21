Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCC6271F7B
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 11:58:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-hhYb-ROjMHyGHDztvD4qqw-1; Mon, 21 Sep 2020 05:58:31 -0400
X-MC-Unique: hhYb-ROjMHyGHDztvD4qqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E10F7186DD38;
	Mon, 21 Sep 2020 09:58:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A5835D9CD;
	Mon, 21 Sep 2020 09:58:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05F0F8C7CE;
	Mon, 21 Sep 2020 09:58:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L9wE0P030748 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 05:58:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D91420244F7; Mon, 21 Sep 2020 09:58:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A1A2028E91
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 09:58:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F216F185A78B
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 09:58:11 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-412-q_VhYLwMMWCSIPOrRn9e1g-1;
	Mon, 21 Sep 2020 05:58:05 -0400
X-MC-Unique: q_VhYLwMMWCSIPOrRn9e1g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9BB5BB019;
	Mon, 21 Sep 2020 09:58:39 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 4361B1E12E1; Mon, 21 Sep 2020 11:58:03 +0200 (CEST)
Date: Mon, 21 Sep 2020 11:58:03 +0200
From: Jan Kara <jack@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200921095803.GE5862@quack2.suse.cz>
References: <160040692945.25320.13233625491405115889.stgit@dwillia2-desk3.amr.corp.intel.com>
	<CA+G9fYud7x0TfTDNWHa_0hzYHNQyet-a2==gQzDaZKXywY1meg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYud7x0TfTDNWHa_0hzYHNQyet-a2==gQzDaZKXywY1meg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvdimm@lists.01.org, open list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, lkft-triage@lists.linaro.org,
	mpatocka@redhat.com, Dan Williams <dan.j.williams@intel.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] [PATCH v2] dm: Call proper helper to determine dax
	support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline

--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 21-09-20 11:23:07, Naresh Kamboju wrote:
> On Fri, 18 Sep 2020 at 11:18, Dan Williams <dan.j.williams@intel.com> wro=
te:
> >
> > From: Jan Kara <jack@suse.cz>
> >
> > DM was calling generic_fsdax_supported() to determine whether a device
> > referenced in the DM table supports DAX. However this is a helper for "=
leaf" device drivers so that
> > they don't have to duplicate common generic checks. High level code
> > should call dax_supported() helper which that calls into appropriate
> > helper for the particular device. This problem manifested itself as
> > kernel messages:
> >
> > dm-3: error: dax access failed (-95)
> >
> > when lvm2-testsuite run in cases where a DM device was stacked on top o=
f
> > another DM device.
> >
> > Fixes: 7bf7eac8d648 ("dax: Arrange for dax_supported check to span mult=
iple devices")
> > Cc: <stable@vger.kernel.org>
> > Tested-by: Adrian Huang <ahuang12@lenovo.com>
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > Acked-by: Mike Snitzer <snitzer@redhat.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> > Changes since v1 [1]:
> > - Add missing dax_read_lock() around dax_supported()
> >
> > [1]: http://lore.kernel.org/r/20200916151445.450-1-jack@suse.cz
> >
> >  drivers/dax/super.c   |    4 ++++
> >  drivers/md/dm-table.c |   10 +++++++---
> >  include/linux/dax.h   |   11 +++++++++--
> >  3 files changed, 20 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> > index e5767c83ea23..b6284c5cae0a 100644
> > --- a/drivers/dax/super.c
> > +++ b/drivers/dax/super.c
> > @@ -325,11 +325,15 @@ EXPORT_SYMBOL_GPL(dax_direct_access);
> >  bool dax_supported(struct dax_device *dax_dev, struct block_device *bd=
ev,
> >                 int blocksize, sector_t start, sector_t len)
> >  {
> > +       if (!dax_dev)
> > +               return false;
> > +
> >         if (!dax_alive(dax_dev))
> >                 return false;
> >
> >         return dax_dev->ops->dax_supported(dax_dev, bdev, blocksize, st=
art, len);
> >  }
> > +EXPORT_SYMBOL_GPL(dax_supported);
>=20
> arm build error while building with allmodconfig.
>=20
> ../drivers/dax/super.c:325:6: error: redefinition of =E2=80=98dax_support=
ed=E2=80=99
>   325 | bool dax_supported(struct dax_device *dax_dev, struct
> block_device *bdev,
>       |      ^~~~~~~~~~~~~
> In file included from ../drivers/dax/super.c:16:
> ../include/linux/dax.h:162:20: note: previous definition of
> =E2=80=98dax_supported=E2=80=99 was here
>   162 | static inline bool dax_supported(struct dax_device *dax_dev,
>       |                    ^~~~~~~~~~~~~
> make[3]: *** [../scripts/Makefile.build:283: drivers/dax/super.o] Error 1
>=20
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>=20
> Ref:
> https://builds.tuxbuild.com/IO690jFQDp0qP9zFuWBqpA/build.log

Thanks for report! Attached patch should fix the build (at least I've
tested it with CONFIG_DAX && CONFIG_FS_DAX, CONFIG_DAX && !CONFIG_FS_DAX,
and !CONFIG_DAX cases). Dan can you please merge the fix?

=09=09=09=09=09=09=09=09Honza
--=20
Jan Kara <jack@suse.com>
SUSE Labs, CR

--Pk6IbRAofICFmK5e
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-dax-Fix-compilation-for-CONFIG_DAX-CONFIG_FS_DAX.patch"

>From c48c9d1ee41ca17561dfd7ec5247b5afc527d40e Mon Sep 17 00:00:00 2001
From: Jan Kara <jack@suse.cz>
Date: Mon, 21 Sep 2020 11:33:23 +0200
Subject: [PATCH] dax: Fix compilation for CONFIG_DAX && !CONFIG_FS_DAX

dax_supported() is defined whenever CONFIG_DAX is enabled. So dummy
implementation should be defined only in !CONFIG_DAX case, not in
!CONFIG_FS_DAX case.

Fixes: e2ec51282545 ("dm: Call proper helper to determine dax support")
Cc: <stable@vger.kernel.org>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 include/linux/dax.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/linux/dax.h b/include/linux/dax.h
index 497031392e0a..43b39ab9de1a 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -58,6 +58,8 @@ static inline void set_dax_synchronous(struct dax_device *dax_dev)
 {
 	__set_dax_synchronous(dax_dev);
 }
+bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
+		int blocksize, sector_t start, sector_t len);
 /*
  * Check if given mapping is supported by the file / underlying device.
  */
@@ -104,6 +106,12 @@ static inline bool dax_synchronous(struct dax_device *dax_dev)
 static inline void set_dax_synchronous(struct dax_device *dax_dev)
 {
 }
+static inline bool dax_supported(struct dax_device *dax_dev,
+		struct block_device *bdev, int blocksize, sector_t start,
+		sector_t len)
+{
+	return false;
+}
 static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
 				struct dax_device *dax_dev)
 {
@@ -130,8 +138,6 @@ static inline bool generic_fsdax_supported(struct dax_device *dax_dev,
 	return __generic_fsdax_supported(dax_dev, bdev, blocksize, start,
 			sectors);
 }
-bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
-		int blocksize, sector_t start, sector_t len);
 
 static inline void fs_put_dax(struct dax_device *dax_dev)
 {
@@ -159,13 +165,6 @@ static inline bool generic_fsdax_supported(struct dax_device *dax_dev,
 	return false;
 }
 
-static inline bool dax_supported(struct dax_device *dax_dev,
-		struct block_device *bdev, int blocksize, sector_t start,
-		sector_t len)
-{
-	return false;
-}
-
 static inline void fs_put_dax(struct dax_device *dax_dev)
 {
 }
-- 
2.16.4


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--Pk6IbRAofICFmK5e--

