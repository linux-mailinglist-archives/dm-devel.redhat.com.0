Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E4EEE25E2F0
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 22:42:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-JwLp72F2N6mtu6ImeCNwTw-1; Fri, 04 Sep 2020 16:42:51 -0400
X-MC-Unique: JwLp72F2N6mtu6ImeCNwTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA3B2802B48;
	Fri,  4 Sep 2020 20:42:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBBFC7EEAE;
	Fri,  4 Sep 2020 20:42:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A523972E4;
	Fri,  4 Sep 2020 20:42:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083G7jBG013233 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 12:07:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0E4D2166BB3; Thu,  3 Sep 2020 16:07:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC542166BA4
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 16:07:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C0B5811E76
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 16:07:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-466-tJi6lr3LN0KLUdVHMsBTMQ-1; Thu, 03 Sep 2020 12:07:14 -0400
X-MC-Unique: tJi6lr3LN0KLUdVHMsBTMQ-1
IronPort-SDR: 3m0Hwb8vocneLQ49Yz3zCb1XZ/91gZAfamffqnTZN3c3lrO0cdFC2Zd5vHTCYhLXKzDMUQjDyE
	u3x3s/aDZ3pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="158590045"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="158590045"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	03 Sep 2020 09:06:09 -0700
IronPort-SDR: z1gjdGA9MAKoCWyApsGlxTYzXecXmk3TxjxKu0Ur/4UxT/z3/PJMSuI3W5A0oAjmK10ZXzovxd
	WZuiP/MFZ8Wg==
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="478099625"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga005-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 09:06:09 -0700
Date: Thu, 3 Sep 2020 09:06:08 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Coly Li <colyli@suse.de>
Message-ID: <20200903160608.GU878166@iweiny-DESK2.sc.intel.com>
References: <20200903115549.17845-1-colyli@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200903115549.17845-1-colyli@suse.de>
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
X-Mailman-Approved-At: Fri, 04 Sep 2020 16:37:05 -0400
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	Vishal Verma <vishal.l.verma@intel.com>, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, Jan Kara <jack@suse.com>
Subject: Re: [dm-devel] [PATCH] dax: fix for do not print error message for
 non-persistent memory block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 03, 2020 at 07:55:49PM +0800, Coly Li wrote:
> When calling __generic_fsdax_supported(), a dax-unsupported device may
> not have dax_dev as NULL, e.g. the dax related code block is not enabled
> by Kconfig.
> 
> Therefore in __generic_fsdax_supported(), to check whether a device
> supports DAX or not, the following order should be performed,
> - If dax_dev pointer is NULL, it means the device driver explicitly
>   announce it doesn't support DAX. Then it is OK to directly return
>   false from __generic_fsdax_supported().
> - If dax_dev pointer is NOT NULL, it might be because the driver doesn't
>   support DAX and not explicitly initialize related data structure. Then
>   bdev_dax_supported() should be called for further check.
> 
> IMHO if device driver desn't explicitly set its dax_dev pointer to NULL,
> this is not a bug. Calling bdev_dax_supported() makes sure they can be
> recognized as dax-unsupported eventually.
> 
> This patch does the following change for the above purpose,
>     -       if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
>     +       if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
> 
> 
> Fixes: c2affe920b0e ("dax: do not print error message for non-persistent memory block device")
> Signed-off-by: Coly Li <colyli@suse.de>

I hate to do this because I realize this is a bug which people really need
fixed.

However, shouldn't we also check (!dax_dev || !bdev_dax_supported()) as the
_first_ check in __generic_fsdax_supported()?

It seems like the other pr_info's could also be called when DAX is not
supported and we probably don't want them to be?

Perhaps that should be a follow on patch though.  So...

As a direct fix to c2affe920b0e

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Cc: Adrian Huang <ahuang12@lenovo.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Jan Kara <jack@suse.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> ---
>  drivers/dax/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 32642634c1bb..e5767c83ea23 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -100,7 +100,7 @@ bool __generic_fsdax_supported(struct dax_device *dax_dev,
>  		return false;
>  	}
>  
> -	if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
> +	if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
>  		pr_debug("%s: error: dax unsupported by block device\n",
>  				bdevname(bdev, buf));
>  		return false;
> -- 
> 2.26.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

