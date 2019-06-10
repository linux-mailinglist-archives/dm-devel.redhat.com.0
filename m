Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF23BCD8
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jun 2019 21:32:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8229308404C;
	Mon, 10 Jun 2019 19:31:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6865B1001B14;
	Mon, 10 Jun 2019 19:30:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F39E1806B15;
	Mon, 10 Jun 2019 19:29:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5AJSNxq004332 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jun 2019 15:28:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D713960C68; Mon, 10 Jun 2019 19:28:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A734160C47;
	Mon, 10 Jun 2019 19:28:04 +0000 (UTC)
Date: Mon, 10 Jun 2019 15:28:03 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190610192803.GA29002@redhat.com>
References: <20190610090730.8589-1-pagupta@redhat.com>
	<20190610090730.8589-5-pagupta@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610090730.8589-5-pagupta@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: cohuck@redhat.com, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
	jasowang@redhat.com, david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, zwisler@kernel.org,
	aarcange@redhat.com, dave.jiang@intel.com, jstaron@google.com,
	linux-nvdimm@lists.01.org, vishal.l.verma@intel.com,
	david@redhat.com, willy@infradead.org, hch@infradead.org,
	linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	rdunlap@infradead.org, riel@surriel.com, yuval.shaia@oracle.com,
	stefanha@redhat.com, pbonzini@redhat.com,
	dan.j.williams@intel.com, lcapitulino@redhat.com,
	kwolf@redhat.com, nilal@redhat.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, darrick.wong@oracle.com,
	rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	imammedo@redhat.com
Subject: Re: [dm-devel] [PATCH v11 4/7] dm: enable synchronous dax
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 10 Jun 2019 19:31:58 +0000 (UTC)

On Mon, Jun 10 2019 at  5:07am -0400,
Pankaj Gupta <pagupta@redhat.com> wrote:

>  This patch sets dax device 'DAXDEV_SYNC' flag if all the target
>  devices of device mapper support synchrononous DAX. If device
>  mapper consists of both synchronous and asynchronous dax devices,
>  we don't set 'DAXDEV_SYNC' flag.
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
>  drivers/md/dm-table.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 350cf0451456..c5160d846fe6 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -890,10 +890,17 @@ static int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
>  			start, len);
>  }
>  
> +static int device_synchronous(struct dm_target *ti, struct dm_dev *dev,
> +				       sector_t start, sector_t len, void *data)
> +{
> +	return dax_synchronous(dev->dax_dev);
> +}
> +
>  bool dm_table_supports_dax(struct dm_table *t, int blocksize)
>  {
>  	struct dm_target *ti;
>  	unsigned i;
> +	bool dax_sync = true;
>  
>  	/* Ensure that all targets support DAX. */
>  	for (i = 0; i < dm_table_get_num_targets(t); i++) {
> @@ -906,7 +913,14 @@ bool dm_table_supports_dax(struct dm_table *t, int blocksize)
>  		    !ti->type->iterate_devices(ti, device_supports_dax,
>  			    &blocksize))
>  			return false;
> +
> +		/* Check devices support synchronous DAX */
> +		if (dax_sync &&
> +		    !ti->type->iterate_devices(ti, device_synchronous, NULL))
> +			dax_sync = false;
>  	}
> +	if (dax_sync)
> +		set_dax_synchronous(t->md->dax_dev);
>  
>  	return true;
>  }
> -- 
> 2.20.1
> 

dm_table_supports_dax() is called multiple times (from
dm_table_set_restrictions and dm_table_determine_type).  It is strange
to have a getter have a side-effect of being a setter too.  Overloading
like this could get you in trouble in the future.

Are you certain this is what you want?

Or would it be better to refactor dm_table_supports_dax() to take an
iterate_devices_fn arg and have callers pass the appropriate function?
Then have dm_table_set_restrictions() caller do:

     if (dm_table_supports_dax(t, device_synchronous, NULL))
     	  set_dax_synchronous(t->md->dax_dev);

(NULL arg implies dm_table_supports_dax() refactoring would take a int
*data pointer rather than int type).

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
