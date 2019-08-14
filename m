Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E38D75C
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 17:42:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C80B630A7BB3;
	Wed, 14 Aug 2019 15:42:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 724E438E3A;
	Wed, 14 Aug 2019 15:42:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8586B18089C8;
	Wed, 14 Aug 2019 15:41:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EFfFpi025607 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 11:41:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E009410013A1; Wed, 14 Aug 2019 15:41:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87BA61001DE4;
	Wed, 14 Aug 2019 15:41:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7EFfCY2031357; 
	Wed, 14 Aug 2019 10:41:12 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7EFfBVm031356;
	Wed, 14 Aug 2019 10:41:11 -0500
Date: Wed, 14 Aug 2019 10:41:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <20190814154111.GE25414@octiron.msp.redhat.com>
References: <20190801172138.15049-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801172138.15049-1-xose.vazquez@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Brian King <brking@linux.vnet.ibm.com>, DM-DEVEL ML <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipath-tools: reorder NVDISK devices
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 14 Aug 2019 15:42:08 +0000 (UTC)

On Thu, Aug 01, 2019 at 07:21:38PM +0200, Xose Vazquez Perez wrote:
> Otherwise "3303[ ]+NVDISK" is never reached, because "NVDISK" regex takes
> priority over it.

Huh? I don't understand why this is necessary. First off, with Martin's
hwentry code, all matching hardware entries are used, not just the
latest. But second, and more importantly, the AIX NVDISK entry won't
ever match the same disks as the IBM 3303[ ]+NVDISK, since they have
different vendors.  Right?

-Ben

> 
> Cc: Brian King <brking@linux.vnet.ibm.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
>  libmultipath/hwtable.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> index a06872e..8209554 100644
> --- a/libmultipath/hwtable.c
> +++ b/libmultipath/hwtable.c
> @@ -696,12 +696,6 @@ static struct hwentry default_hw[] = {
>  		.pgpolicy      = MULTIBUS,
>  		.no_path_retry = (300 / DEFAULT_CHECKINT),
>  	},
> -	{
> -		/* 3303 NVDISK */
> -		.vendor        = "IBM",
> -		.product       = "3303[ ]+NVDISK",
> -		.no_path_retry = (300 / DEFAULT_CHECKINT),
> -	},
>  	{
>  		/* AIX NVDISK */
>  		.vendor        = "AIX",
> @@ -712,6 +706,12 @@ static struct hwentry default_hw[] = {
>  		.no_path_retry = (300 / DEFAULT_CHECKINT),
>  		.prio_name     = PRIO_ALUA,
>  	},
> +	{
> +		/* 3303 NVDISK */
> +		.vendor        = "IBM",
> +		.product       = "3303[ ]+NVDISK",
> +		.no_path_retry = (300 / DEFAULT_CHECKINT),
> +	},
>          /*
>           * Lenovo
>           */
> -- 
> 2.21.0
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
