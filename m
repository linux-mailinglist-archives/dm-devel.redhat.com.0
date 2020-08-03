Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1923423ABBA
	for <lists+dm-devel@lfdr.de>; Mon,  3 Aug 2020 19:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596476235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kZh9VkXU3uxJeYt5NJmfAt0U/EmhmeC+GRe+YRAWy5M=;
	b=Q/Boxf8DJ8xLiyrB8aJOiQkcVs3C3IGTK8eeE9vAXXBHp6Fh/H2AquC2hrDH8Ge/hwzdR/
	ifn3ZfoIP9Q76WcKH/n/RNrpI3Yz1j59tmR54HKb9E8716TUFU4NpbUq86gtkTVXhSIr/D
	ZDHh5Hy6VHXahYmD5tgRTZ81VWlSsgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-1_U4MY2YMveKG7RvIa5SIA-1; Mon, 03 Aug 2020 13:36:18 -0400
X-MC-Unique: 1_U4MY2YMveKG7RvIa5SIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 378D0101C8A0;
	Mon,  3 Aug 2020 17:36:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 965297176A;
	Mon,  3 Aug 2020 17:36:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1828A1809554;
	Mon,  3 Aug 2020 17:35:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073HZf6S013496 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 13:35:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58EB38AD1C; Mon,  3 Aug 2020 17:35:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3775074F58;
	Mon,  3 Aug 2020 17:35:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 073HZa8I021110; 
	Mon, 3 Aug 2020 12:35:36 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 073HZZ5t021109;
	Mon, 3 Aug 2020 12:35:35 -0500
Date: Mon, 3 Aug 2020 12:35:35 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200803173535.GF19233@octiron.msp.redhat.com>
References: <9f10e135-348d-d11a-85cb-797522ba5210@huawei.com>
MIME-Version: 1.0
In-Reply-To: <9f10e135-348d-d11a-85cb-797522ba5210@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: liuzhiqiang26@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>, lutianxiong@huawei.com
Subject: Re: [dm-devel] [PATCH] libmultipath: fix null dereference in add
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Aug 03, 2020 at 07:57:01PM +0800, lixiaokeng wrote:
> I got a multipath segfault while running iscsi login/logout and following scripts in parallel:
> 
> #!/bin/bash
> interval=1
> while true
> do
>               multipath -F &> /dev/null
>               multipath -r &> /dev/null
>               multipath -v2 &> /dev/null
>               multipath -ll &> /dev/null
>               sleep $interval
> done
> 
> This is the debuginfo:
> #0  0x00007f3805e4df58 in add (ctx=0x55d1569e4a00, ud=0x55d1569bafd0) at nvme.c:801
> 801              if (strcmp("disk", udev_device_get_devtype(ud)))
> (gdb) bt
> #0  0x00007f3805e4df58 in add (ctx=0x55d1569e4a00, ud=0x55d1569bafd0) at nvme.c:801
> #1  0x00007f3806687a44 in add_foreign (udev=0x55d1569bafd0) at foreign.c:299
> #2  0x00007f3806665abf in is_claimed_by_foreign (ud=<optimized out>) at foreign.h:316
> #3  pathinfo (pp=0x55d1569e9f50, conf=0x55d1569b92d0, mask=69) at discovery.c:2064
> #4  0x000055d154c91cbb in check_usable_paths (conf=0x55d1569b92d0, devpath=0x55d1569e3200 "dm-6", dev_type=<optimized out>) at main.c:368
> #5  0x000055d154c910a5 in main (argc=3, argv=<optimized out>) at main.c:1057
> In add() at libmultipath/foreign/nvme.c, udev_device_get_devtype(ud) return a NULL pointer then dereferenced.
> Here, NULL check is needed.
> Check if udev_device_get_devtype return NULL before dereferencing it.

This patch looks fine. However, it has pointed out a larger problem with
the udev_device_get_* functions. This is not the only instance where we
aren't checking the return value of these functions before dereferencing
it.

-Ben

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.coM>
 
> Signed-off-by: lutianxiong <lutianxiong huawei com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/foreign/nvme.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
> index 280b6bd..6061999 100644
> --- a/libmultipath/foreign/nvme.c
> +++ b/libmultipath/foreign/nvme.c
> @@ -600,12 +600,14 @@ int add(struct context *ctx, struct udev_device *ud)
>  {
>  	struct udev_device *subsys;
>  	int rc;
> +	const char *devtype;
> 
>  	condlog(5, "%s called for \"%s\"", __func__, THIS);
> 
>  	if (ud == NULL)
>  		return FOREIGN_ERR;
> -	if (strcmp("disk", udev_device_get_devtype(ud)))
> +	if ((devtype = udev_device_get_devtype(ud)) == NULL ||
> +						strcmp("disk", devtype))
>  		return FOREIGN_IGNORED;
> 
>  	subsys = udev_device_get_parent_with_subsystem_devtype(ud,
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

