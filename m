Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D762077
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jul 2019 16:29:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FD6DA3B69;
	Mon,  8 Jul 2019 14:28:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADD9B2D259;
	Mon,  8 Jul 2019 14:28:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 573201833001;
	Mon,  8 Jul 2019 14:28:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68EQimP029289 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 10:26:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 312545C25C; Mon,  8 Jul 2019 14:26:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 085C95C241;
	Mon,  8 Jul 2019 14:26:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x68EQbw4015329; 
	Mon, 8 Jul 2019 09:26:37 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x68EQaa6015328;
	Mon, 8 Jul 2019 09:26:36 -0500
Date: Mon, 8 Jul 2019 09:26:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190708142636.GP3251@octiron.msp.redhat.com>
References: <20190628192911.18192-1-martin.wilck@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628192911.18192-1-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] kpartx: recognize DASD on loop devices again
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 08 Jul 2019 14:29:36 +0000 (UTC)

On Fri, Jun 28, 2019 at 07:29:41PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Since 4d57b868, DASD partition tables are only recognized on
> DASD hardware. This turns out to break certain software that works
> e.g. with DASD partition tables on loop devices. The problem that
> 4d57b868 attempted to fix was that "unlabeled disk" format has
> no signature at all and is detected on any volume, including
> empty ones.
> 
> With this patch, DASD partition table formats other than "unlabeled
> disk" are detected on non-DASD devices again.
> 
> Fixes: 4d57b868 "kpartx: only recognize dasd part table on DASD"

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  kpartx/dasd.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/kpartx/dasd.c b/kpartx/dasd.c
> index 61b609a5..3fcef6ad 100644
> --- a/kpartx/dasd.c
> +++ b/kpartx/dasd.c
> @@ -133,9 +133,6 @@ read_dasd_pt(int fd, struct slice all, struct slice *sp, int ns)
>  			/* Couldn't open the device */
>  			return -1;
>  		}
> -	} else if ((unsigned int)major(sbuf.st_rdev) != 94) {
> -			/* Not a DASD */
> -			return -1;
>  	} else {
>  		fd_dasd = dup(fd);
>  	}
> @@ -277,6 +274,10 @@ read_dasd_pt(int fd, struct slice all, struct slice *sp, int ns)
>  			size = disksize;
>  			if (fmt_size < size)
>  				size = fmt_size;
> +		} else if ((unsigned int)major(sbuf.st_rdev) != 94) {
> +			/* Not a DASD */
> +			retval = -1;
> +			goto out;
>  		} else
>  			size = disksize;
>  
> -- 
> 2.21.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
