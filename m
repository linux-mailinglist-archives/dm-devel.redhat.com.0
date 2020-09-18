Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF96271C6C
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 09:58:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-cSHRUvItMiGy8WR-B6heOw-1; Mon, 21 Sep 2020 03:57:58 -0400
X-MC-Unique: cSHRUvItMiGy8WR-B6heOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B4CF884DD5;
	Mon, 21 Sep 2020 07:57:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D905B19D6C;
	Mon, 21 Sep 2020 07:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11A16183D041;
	Mon, 21 Sep 2020 07:57:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08IKOi4a009957 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 16:24:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20CA52156A34; Fri, 18 Sep 2020 20:24:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC0F2156A30
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 20:24:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADA9A18AE948
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 20:24:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-367-NgEjuskcNHa6q8GdrCQskA-1;
	Fri, 18 Sep 2020 16:24:39 -0400
X-MC-Unique: NgEjuskcNHa6q8GdrCQskA-1
IronPort-SDR: GtjCsgz/0YKPyT8jdIeXRASKQpMR3Q4d3wrRCFel2U4Z4aDPZugz51nBbm1pOhTi0PF+2+UXrg
	d0eqYCVZDaVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="178115088"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="178115088"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Sep 2020 13:23:26 -0700
IronPort-SDR: juwBc6KyoAHzehehZe3ddvi6QBHz3lSczwM2mLOQX/j+FZulSTgAk1lDQ+l5a15RtLoCIJdpwC
	AUJLkA9mUqlw==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="509028963"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga005-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 13:23:24 -0700
Date: Fri, 18 Sep 2020 13:23:23 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20200918202323.GL2540965@iweiny-DESK2.sc.intel.com>
References: <160045867590.25663.7548541079217827340.stgit@dwillia2-desk3.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <160045867590.25663.7548541079217827340.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 21 Sep 2020 03:57:37 -0400
Cc: Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm/dax: Fix table reference counts
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Sep 18, 2020 at 12:51:15PM -0700, Dan Williams wrote:
> A recent fix to the dm_dax_supported() flow uncovered a latent bug. When
> dm_get_live_table() fails it is still required to drop the
> srcu_read_lock(). Without this change the lvm2 test-suite triggers this
> warning:
> 
>     # lvm2-testsuite --only pvmove-abort-all.sh
> 
>     WARNING: lock held when returning to user space!
>     5.9.0-rc5+ #251 Tainted: G           OE
>     ------------------------------------------------
>     lvm/1318 is leaving the kernel with locks still held!
>     1 lock held by lvm/1318:
>      #0: ffff9372abb5a340 (&md->io_barrier){....}-{0:0}, at: dm_get_live_table+0x5/0xb0 [dm_mod]
> 
> ...and later on this hang signature:
> 
>     INFO: task lvm:1344 blocked for more than 122 seconds.
>           Tainted: G           OE     5.9.0-rc5+ #251
>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>     task:lvm             state:D stack:    0 pid: 1344 ppid:     1 flags:0x00004000
>     Call Trace:
>      __schedule+0x45f/0xa80
>      ? finish_task_switch+0x249/0x2c0
>      ? wait_for_completion+0x86/0x110
>      schedule+0x5f/0xd0
>      schedule_timeout+0x212/0x2a0
>      ? __schedule+0x467/0xa80
>      ? wait_for_completion+0x86/0x110
>      wait_for_completion+0xb0/0x110
>      __synchronize_srcu+0xd1/0x160
>      ? __bpf_trace_rcu_utilization+0x10/0x10
>      __dm_suspend+0x6d/0x210 [dm_mod]
>      dm_suspend+0xf6/0x140 [dm_mod]
> 
> Fixes: 7bf7eac8d648 ("dax: Arrange for dax_supported check to span multiple devices")
> Cc: <stable@vger.kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Alasdair Kergon <agk@redhat.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Reported-by: Adrian Huang <ahuang12@lenovo.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  drivers/md/dm.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index fb0255d25e4b..4a40df8af7d3 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1136,15 +1136,16 @@ static bool dm_dax_supported(struct dax_device *dax_dev, struct block_device *bd
>  {
>  	struct mapped_device *md = dax_get_private(dax_dev);
>  	struct dm_table *map;
> +	bool ret = false;
>  	int srcu_idx;
> -	bool ret;
>  
>  	map = dm_get_live_table(md, &srcu_idx);
>  	if (!map)
> -		return false;
> +		goto out;
>  
>  	ret = dm_table_supports_dax(map, device_supports_dax, &blocksize);
>  
> +out:
>  	dm_put_live_table(md, srcu_idx);

Wow that is an odd interface for the kernel.  Especially since map is not
passed back in.  But yea looks correct.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

>  
>  	return ret;
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

