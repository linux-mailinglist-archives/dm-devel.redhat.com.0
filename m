Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FEF20FEE
	for <lists+dm-devel@lfdr.de>; Thu, 16 May 2019 23:13:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70B76306E5FA;
	Thu, 16 May 2019 21:13:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E83B65D6A9;
	Thu, 16 May 2019 21:13:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12B6B1806B12;
	Thu, 16 May 2019 21:13:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GLBBSg009213 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 17:11:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E74C60D5E; Thu, 16 May 2019 21:11:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38D6D60DCF
	for <dm-devel@redhat.com>; Thu, 16 May 2019 21:11:08 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 483DD307D848
	for <dm-devel@redhat.com>; Thu, 16 May 2019 21:11:03 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c3so4817100otr.3
	for <dm-devel@redhat.com>; Thu, 16 May 2019 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rncqV+v/sler+WaccX6aFzyW2GBZSvBqWUUQAw2Omxg=;
	b=sBwrHSYohh/5AbGwZanEBCpP/ONR4apwYXhQR3Gh/nmGJtaYsMQTILIps0vPrhK0t4
	CFYcTvs94aN+IOc+2QZpIXl51EU5IBQlgFonCamtkrRCVj/m9LnNsdaUArIfw/wnVMX1
	it246fg4xNMigWkvBlEoYYGsJfwssAsUdk0iD+mLFtO/R/3IlWHbu3tqxSmWEw6cY0BX
	4XjHiTUAOuJdPSch+xJSHicRb+bZZ3UaTbvFnIGhFEKbOFTSbXlsjy65Yr90mqwgS0g+
	F54PjHp1w24jDlC42LFHVVZElkpBuaZb2H3aaORxH/+8FksYfNLY93NcnkFWw0Yb3+aM
	op3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rncqV+v/sler+WaccX6aFzyW2GBZSvBqWUUQAw2Omxg=;
	b=F6rC/LqIcFyeSCz4smXPxqxhZMM9BvpkYttF0DDhKGykMdBBrg622RV8co9Fs4Q9pN
	zGr8xWvfZZ1ssYnS8UYWvJBZHDgeLQJf6dSloElYm6TZCzm7wYv1639YgIDkCn38CvqY
	i7IX27YCMuqnt2EETmpv9OXLti1Y6suuKF07FOfKRLMwR1YXOq2zwpulQJMLANM2Ng7Y
	saqXeyi3pyS05TpyJTnjmhDOf+8IL4l3b26Xy00NRIiuppqfEDUvYGDoNu3GfPGrePjU
	Myg+T2K3Vlvs9lWSJLSaC/g1fgyv2CDAYaegiN7nn7Ev6y9xGqLUo32a/rX6nsZaOqwu
	0UlA==
X-Gm-Message-State: APjAAAUWuJZmr3MdtHHkTvw4QfGNmTtlUkxfz+NxisZPLTpCTb+e+MX5
	/7anTicMKM5aSHTKbtWaBVsR2PMJq4dXs/P996tNGg==
X-Google-Smtp-Source: APXvYqxulCJOUDUzJnfXBMN0SCHXR6S91sR3HjlOoR5MHBwl1p8VnIbStmYVv5DJAXlVl4H2Wm68Ee2JYrTDQVx19M4=
X-Received: by 2002:a9d:61ca:: with SMTP id h10mr3517132otk.247.1558041062704; 
	Thu, 16 May 2019 14:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <155789172402.748145.11853718580748830476.stgit@dwillia2-desk3.amr.corp.intel.com>
	<20190516185732.GA27796@redhat.com>
In-Reply-To: <20190516185732.GA27796@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 16 May 2019 14:10:51 -0700
Message-ID: <CAPcyv4j5M7ZgJqFtRxw1t2p4tb579azdb6=FedV-rcqJ3GJPNw@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 16 May 2019 21:11:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 16 May 2019 21:11:03 +0000 (UTC) for IP:'209.85.210.65'
	DOMAIN:'mail-ot1-f65.google.com' HELO:'mail-ot1-f65.google.com'
	FROM:'dan.j.williams@intel.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.210.65 mail-ot1-f65.google.com
	209.85.210.65 mail-ot1-f65.google.com
	<dan.j.williams@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pagupta@redhat.com>, Jan Kara <jack@suse.cz>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Keith Busch <keith.busch@intel.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	stable <stable@vger.kernel.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] dax: Arrange for dax_supported check to span
	multiple devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 16 May 2019 21:13:56 +0000 (UTC)

On Thu, May 16, 2019 at 11:58 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Tue, May 14 2019 at 11:48pm -0400,
> Dan Williams <dan.j.williams@intel.com> wrote:
>
> > Pankaj reports that starting with commit ad428cdb525a "dax: Check the
> > end of the block-device capacity with dax_direct_access()" device-mapper
> > no longer allows dax operation. This results from the stricter checks in
> > __bdev_dax_supported() that validate that the start and end of a
> > block-device map to the same 'pagemap' instance.
> >
> > Teach the dax-core and device-mapper to validate the 'pagemap' on a
> > per-target basis. This is accomplished by refactoring the
> > bdev_dax_supported() internals into generic_fsdax_supported() which
> > takes a sector range to validate. Consequently generic_fsdax_supported()
> > is suitable to be used in a device-mapper ->iterate_devices() callback.
> > A new ->dax_supported() operation is added to allow composite devices to
> > split and route upper-level bdev_dax_supported() requests.
> >
> > Fixes: ad428cdb525a ("dax: Check the end of the block-device...")
> > Cc: <stable@vger.kernel.org>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Cc: Dave Jiang <dave.jiang@intel.com>
> > Cc: Mike Snitzer <snitzer@redhat.com>
> > Cc: Keith Busch <keith.busch@intel.com>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Vishal Verma <vishal.l.verma@intel.com>
> > Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> > Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> > Reported-by: Pankaj Gupta <pagupta@redhat.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> > Hi Mike,
> >
> > Another day another new dax operation to allow device-mapper to better
> > scope dax operations.
> >
> > Let me know if the device-mapper changes look sane. This passes a new
> > unit test that indeed fails on current mainline.
> >
> > https://github.com/pmem/ndctl/blob/device-mapper-pending/test/dm.sh
> >
> >  drivers/dax/super.c          |   88 +++++++++++++++++++++++++++---------------
> >  drivers/md/dm-table.c        |   17 +++++---
> >  drivers/md/dm.c              |   20 ++++++++++
> >  drivers/md/dm.h              |    1
> >  drivers/nvdimm/pmem.c        |    1
> >  drivers/s390/block/dcssblk.c |    1
> >  include/linux/dax.h          |   19 +++++++++
> >  7 files changed, 110 insertions(+), 37 deletions(-)
> >
>
> ...
>
> > diff --git a/drivers/md/dm.h b/drivers/md/dm.h
> > index 2d539b82ec08..e5e240bfa2d0 100644
> > --- a/drivers/md/dm.h
> > +++ b/drivers/md/dm.h
> > @@ -78,6 +78,7 @@ void dm_unlock_md_type(struct mapped_device *md);
> >  void dm_set_md_type(struct mapped_device *md, enum dm_queue_mode type);
> >  enum dm_queue_mode dm_get_md_type(struct mapped_device *md);
> >  struct target_type *dm_get_immutable_target_type(struct mapped_device *md);
> > +bool dm_table_supports_dax(struct dm_table *t, int blocksize);
> >
> >  int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t);
> >
>
> I'd prefer to have dm_table_supports_dax come just after
> dm_table_get_md_mempools in the preceding dm_table section of dm.h (just
> above this mapped_device section you extended).
>
> But other than that nit, patch looks great on a DM level:
>
> Reviewed-by: Mike Snitzer <snitzer@redhat.com>

Thanks Mike, I folded in this change:

@@ -72,13 +72,13 @@ bool dm_table_bio_based(struct dm_table *t);
 bool dm_table_request_based(struct dm_table *t);
 void dm_table_free_md_mempools(struct dm_table *t);
 struct dm_md_mempools *dm_table_get_md_mempools(struct dm_table *t);
+bool dm_table_supports_dax(struct dm_table *t, int blocksize);

 void dm_lock_md_type(struct mapped_device *md);
 void dm_unlock_md_type(struct mapped_device *md);
 void dm_set_md_type(struct mapped_device *md, enum dm_queue_mode type);
 enum dm_queue_mode dm_get_md_type(struct mapped_device *md);
 struct target_type *dm_get_immutable_target_type(struct mapped_device *md);
-bool dm_table_supports_dax(struct dm_table *t, int blocksize);

 int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
