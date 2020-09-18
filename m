Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 242CF270874
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 23:40:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-kZAI7Y5-Pji7RjFyY_8Qtg-1; Fri, 18 Sep 2020 17:40:52 -0400
X-MC-Unique: kZAI7Y5-Pji7RjFyY_8Qtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA9131084D78;
	Fri, 18 Sep 2020 21:40:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47E1C55765;
	Fri, 18 Sep 2020 21:40:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 147118C7C9;
	Fri, 18 Sep 2020 21:40:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ILeIYO021313 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 17:40:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 667D8113F9E; Fri, 18 Sep 2020 21:40:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61D6811E5D3
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 21:40:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58BC3805B97
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 21:40:16 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-527-Zks_gW83Pa2T2pmUtVs7Nw-1; Fri, 18 Sep 2020 17:40:12 -0400
X-MC-Unique: Zks_gW83Pa2T2pmUtVs7Nw-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08IFPkTY152993; Fri, 18 Sep 2020 15:30:48 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 33gnrrfwp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 18 Sep 2020 15:30:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08IFQ4BM109038; Fri, 18 Sep 2020 15:30:47 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3020.oracle.com with ESMTP id 33hm371cuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2020 15:30:47 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08IFUhOE005759;
	Fri, 18 Sep 2020 15:30:44 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 18 Sep 2020 15:30:43 +0000
Date: Fri, 18 Sep 2020 08:30:41 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20200918153041.GN7954@magnolia>
References: <160040692945.25320.13233625491405115889.stgit@dwillia2-desk3.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <160040692945.25320.13233625491405115889.stgit@dwillia2-desk3.amr.corp.intel.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9748
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	bulkscore=0 mlxlogscore=999
	malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009180126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9748
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0
	lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
	clxscore=1011 mlxlogscore=999 adultscore=0 priorityscore=1501
	impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009180126
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, snitzer@redhat.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	dm-devel@redhat.com, Adrian Huang <ahuang12@lenovo.com>,
	mpatocka@redhat.com, ira.weiny@intel.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 17, 2020 at 10:30:03PM -0700, Dan Williams wrote:
> From: Jan Kara <jack@suse.cz>
> 
> DM was calling generic_fsdax_supported() to determine whether a device
> referenced in the DM table supports DAX. However this is a helper for "leaf" device drivers so that
> they don't have to duplicate common generic checks. High level code
> should call dax_supported() helper which that calls into appropriate
> helper for the particular device. This problem manifested itself as
> kernel messages:
> 
> dm-3: error: dax access failed (-95)
> 
> when lvm2-testsuite run in cases where a DM device was stacked on top of
> another DM device.

Is there somewhere where it is documented which of:

bdev_dax_supported, generic_fsdax_supported, and dax_supported

one is supposed to use for a given circumstance?

I guess the last two can test a given range w/ blocksize; the first one
only does blocksize; and the middle one also checks with whatever fs
might be mounted? <shrug>

(I ask because it took me a while to figure out how to revert correctly
the brokenness in rc3-5 that broke my nightly dax fstesting.)

--D

> 
> Fixes: 7bf7eac8d648 ("dax: Arrange for dax_supported check to span multiple devices")
> Cc: <stable@vger.kernel.org>
> Tested-by: Adrian Huang <ahuang12@lenovo.com>
> Signed-off-by: Jan Kara <jack@suse.cz>
> Acked-by: Mike Snitzer <snitzer@redhat.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
> Changes since v1 [1]:
> - Add missing dax_read_lock() around dax_supported()
> 
> [1]: http://lore.kernel.org/r/20200916151445.450-1-jack@suse.cz
> 
>  drivers/dax/super.c   |    4 ++++
>  drivers/md/dm-table.c |   10 +++++++---
>  include/linux/dax.h   |   11 +++++++++--
>  3 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index e5767c83ea23..b6284c5cae0a 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -325,11 +325,15 @@ EXPORT_SYMBOL_GPL(dax_direct_access);
>  bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
>  		int blocksize, sector_t start, sector_t len)
>  {
> +	if (!dax_dev)
> +		return false;
> +
>  	if (!dax_alive(dax_dev))
>  		return false;
>  
>  	return dax_dev->ops->dax_supported(dax_dev, bdev, blocksize, start, len);
>  }
> +EXPORT_SYMBOL_GPL(dax_supported);
>  
>  size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
>  		size_t bytes, struct iov_iter *i)
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 5edc3079e7c1..229f461e7def 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -860,10 +860,14 @@ EXPORT_SYMBOL_GPL(dm_table_set_type);
>  int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
>  			sector_t start, sector_t len, void *data)
>  {
> -	int blocksize = *(int *) data;
> +	int blocksize = *(int *) data, id;
> +	bool rc;
>  
> -	return generic_fsdax_supported(dev->dax_dev, dev->bdev, blocksize,
> -				       start, len);
> +	id = dax_read_lock();
> +	rc = dax_supported(dev->dax_dev, dev->bdev, blocksize, start, len);
> +	dax_read_unlock(id);
> +
> +	return rc;
>  }
>  
>  /* Check devices support synchronous DAX */
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index 6904d4e0b2e0..9f916326814a 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -130,6 +130,8 @@ static inline bool generic_fsdax_supported(struct dax_device *dax_dev,
>  	return __generic_fsdax_supported(dax_dev, bdev, blocksize, start,
>  			sectors);
>  }
> +bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
> +		int blocksize, sector_t start, sector_t len);
>  
>  static inline void fs_put_dax(struct dax_device *dax_dev)
>  {
> @@ -157,6 +159,13 @@ static inline bool generic_fsdax_supported(struct dax_device *dax_dev,
>  	return false;
>  }
>  
> +static inline bool dax_supported(struct dax_device *dax_dev,
> +		struct block_device *bdev, int blocksize, sector_t start,
> +		sector_t len)
> +{
> +	return false;
> +}
> +
>  static inline void fs_put_dax(struct dax_device *dax_dev)
>  {
>  }
> @@ -195,8 +204,6 @@ bool dax_alive(struct dax_device *dax_dev);
>  void *dax_get_private(struct dax_device *dax_dev);
>  long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
>  		void **kaddr, pfn_t *pfn);
> -bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
> -		int blocksize, sector_t start, sector_t len);
>  size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
>  		size_t bytes, struct iov_iter *i);
>  size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

