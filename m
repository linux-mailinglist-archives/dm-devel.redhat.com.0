Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EC43E20F08
	for <lists+dm-devel@lfdr.de>; Thu, 16 May 2019 21:05:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58A203086229;
	Thu, 16 May 2019 19:04:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EEF560BE0;
	Thu, 16 May 2019 19:04:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 998DF206D2;
	Thu, 16 May 2019 19:01:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GIvcsx019177 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 14:57:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9469B1973B; Thu, 16 May 2019 18:57:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 036B719C4F;
	Thu, 16 May 2019 18:57:33 +0000 (UTC)
Date: Thu, 16 May 2019 14:57:32 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190516185732.GA27796@redhat.com>
References: <155789172402.748145.11853718580748830476.stgit@dwillia2-desk3.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155789172402.748145.11853718580748830476.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pagupta@redhat.com>, Jan Kara <jack@suse.cz>,
	linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Keith Busch <keith.busch@intel.com>,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com, stable@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 16 May 2019 19:05:53 +0000 (UTC)

On Tue, May 14 2019 at 11:48pm -0400,
Dan Williams <dan.j.williams@intel.com> wrote:

> Pankaj reports that starting with commit ad428cdb525a "dax: Check the
> end of the block-device capacity with dax_direct_access()" device-mapper
> no longer allows dax operation. This results from the stricter checks in
> __bdev_dax_supported() that validate that the start and end of a
> block-device map to the same 'pagemap' instance.
> 
> Teach the dax-core and device-mapper to validate the 'pagemap' on a
> per-target basis. This is accomplished by refactoring the
> bdev_dax_supported() internals into generic_fsdax_supported() which
> takes a sector range to validate. Consequently generic_fsdax_supported()
> is suitable to be used in a device-mapper ->iterate_devices() callback.
> A new ->dax_supported() operation is added to allow composite devices to
> split and route upper-level bdev_dax_supported() requests.
> 
> Fixes: ad428cdb525a ("dax: Check the end of the block-device...")
> Cc: <stable@vger.kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: Keith Busch <keith.busch@intel.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Reported-by: Pankaj Gupta <pagupta@redhat.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
> Hi Mike,
> 
> Another day another new dax operation to allow device-mapper to better
> scope dax operations.
> 
> Let me know if the device-mapper changes look sane. This passes a new
> unit test that indeed fails on current mainline.
> 
> https://github.com/pmem/ndctl/blob/device-mapper-pending/test/dm.sh
> 
>  drivers/dax/super.c          |   88 +++++++++++++++++++++++++++---------------
>  drivers/md/dm-table.c        |   17 +++++---
>  drivers/md/dm.c              |   20 ++++++++++
>  drivers/md/dm.h              |    1 
>  drivers/nvdimm/pmem.c        |    1 
>  drivers/s390/block/dcssblk.c |    1 
>  include/linux/dax.h          |   19 +++++++++
>  7 files changed, 110 insertions(+), 37 deletions(-)
> 

...

> diff --git a/drivers/md/dm.h b/drivers/md/dm.h
> index 2d539b82ec08..e5e240bfa2d0 100644
> --- a/drivers/md/dm.h
> +++ b/drivers/md/dm.h
> @@ -78,6 +78,7 @@ void dm_unlock_md_type(struct mapped_device *md);
>  void dm_set_md_type(struct mapped_device *md, enum dm_queue_mode type);
>  enum dm_queue_mode dm_get_md_type(struct mapped_device *md);
>  struct target_type *dm_get_immutable_target_type(struct mapped_device *md);
> +bool dm_table_supports_dax(struct dm_table *t, int blocksize);
>  
>  int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t);
>  

I'd prefer to have dm_table_supports_dax come just after
dm_table_get_md_mempools in the preceding dm_table section of dm.h (just
above this mapped_device section you extended).

But other than that nit, patch looks great on a DM level:

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
