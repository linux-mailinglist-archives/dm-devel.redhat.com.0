Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B4DF9D
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 11:37:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F0593086224;
	Mon, 29 Apr 2019 09:37:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 734011778F;
	Mon, 29 Apr 2019 09:37:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C65B841F3D;
	Mon, 29 Apr 2019 09:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3T9b30E017337 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 05:37:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 154DB6CE54; Mon, 29 Apr 2019 09:37:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE8566CE51;
	Mon, 29 Apr 2019 09:36:58 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 932B4307D96D;
	Mon, 29 Apr 2019 09:36:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0B06FAEF8;
	Mon, 29 Apr 2019 09:36:56 +0000 (UTC)
Message-ID: <40abc8f16f781f8f6de1e9dac489fd023cc1e657.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
To: Yufen Yu <yuyufen@huawei.com>, dm-devel@redhat.com, snitzer@redhat.com
Date: Mon, 29 Apr 2019 11:36:55 +0200
In-Reply-To: <20190427105409.36721-1-yuyufen@huawei.com>
References: <20190427105409.36721-1-yuyufen@huawei.com>
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Mon, 29 Apr 2019 09:36:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 29 Apr 2019 09:36:57 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'mwilck@suse.de'
	RCPT:''
X-RedHat-Spam-Score: -2.301  (RCVD_IN_DNSWL_MED,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <mwilck@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Bart Van Assche <bart.vanassche@sandisk.com>, mpatocka@redhat.com
Subject: Re: [dm-devel] [PATCH] dm mpath: fix memory leak for
	attached_handler_name
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 29 Apr 2019 09:37:24 +0000 (UTC)

On Sat, 2019-04-27 at 18:54 +0800, Yufen Yu wrote:
> If multipath does not set flag MPATHF_RETAIN_ATTACHED_HW_HANDLER,
> parse_path() would forget to free attached_handler_name when
> successfully exit, resulting in memory leak.

I believe this should rather be done in parse_path(), as
setup_scsi_dh() nullifies the pointer anyway when it "steals" it.
I'll send a patch shortly.

Thanks,
Martin





> 
> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> ---
>  drivers/md/dm-mpath.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
> index 00e738c1222f..850a7c637a88 100644
> --- a/drivers/md/dm-mpath.c
> +++ b/drivers/md/dm-mpath.c
> @@ -841,6 +841,8 @@ static int setup_scsi_dh(struct block_device
> *bdev, struct multipath *m,
>  			m->hw_handler_name = *attached_handler_name;
>  			*attached_handler_name = NULL;
>  		}
> +	} else {
> +		kfree(*attached_handler_name);
>  	}
>  
>  	if (m->hw_handler_name) {


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
