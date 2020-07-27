Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DD7F522F5A7
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jul 2020 18:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595868382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KYHLXBy8P3xkqpqMc69zGa1cWQ4B1I4/i/IblO5CrcA=;
	b=RXWBfJR93MveufunXEGg806C7SAUg0PVdtuHoa8aG6DEMsmOidbjkLIoxkTdfHL+dJmllv
	XBgPMXWyJ/ShKKsBj4hl8IlPhbyp8iMhoJcDU4MkO2jPQxhLp6MgnCFmESCyFnjKEq6r7A
	vqVOznxdcWRYfseheCrvXkA2KdiG9v0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-EjjHkeNUOoaKHx1reDVrBQ-1; Mon, 27 Jul 2020 12:46:20 -0400
X-MC-Unique: EjjHkeNUOoaKHx1reDVrBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 129BC104ECFF;
	Mon, 27 Jul 2020 16:46:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AA0D1002382;
	Mon, 27 Jul 2020 16:46:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC74D1809554;
	Mon, 27 Jul 2020 16:45:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RGjbSG006117 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 12:45:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01CEF10027A6; Mon, 27 Jul 2020 16:45:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 772341002388;
	Mon, 27 Jul 2020 16:45:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06RGjVsW004595; 
	Mon, 27 Jul 2020 11:45:32 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06RGjUY5004594;
	Mon, 27 Jul 2020 11:45:30 -0500
Date: Mon, 27 Jul 2020 11:45:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200727164530.GN11089@octiron.msp.redhat.com>
References: <1694e42f-92e7-e380-bc8c-ac3ec47cafdc@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1694e42f-92e7-e380-bc8c-ac3ec47cafdc@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: liuzhiqiang26@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>, lutianxiong@huawei.com
Subject: Re: [dm-devel] [dm-level] upstream-queue-libmultipath: fix memory
 leak when iscsi login/out and "multipath -r" executed
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Jul 25, 2020 at 01:47:01PM +0800, lixiaokeng wrote:
> When one iscsi device logs in and logs out with the "multipath -r"
> executed at the same time, memory leak happens in multipathd
> process.
> 
> The reason is following. When "multipath -r" is executed, the path
> will be free in configure function. Before path_discovery executed,
> iscsi device logs out. Then path_discovery will not find any path and
> there is no path in the gvecs->pathvec. When map_discovery function
> is executed, disassemble_map function will be called. Because
> gvecs->pathvec->slot is empty and is_deamon is 1, a path will be
> allocated and is not stored in gvecs->pathvec but store in
> mpp->pg. But when the mpp is removed and freed by remove_map
> function, the path will not be free and can't be find anymore.
> 
> The procedure details given as follows,
> 1."multipath -r" is executed
> main
> 	->child
> 		->reconfigure
> 			->configure
> 				->path_discovery //after iscsi logout
> 				->map_discovery
> 					->update_multipath_table
> 						->disassemble_map
> 							->alloc_path
> 2.then "multipath -r" is executed again
> main
> main
> 	->child
> 		->reconfigure
> 			->remove_maps_and_stop_waiters
> 				->remove_maps
> 
> Here, we delete checking is_deamon. Because whether the process is a
> daemon process or not, we think the path should be add to gvecs->pathvec.

There is more work that needs to be done to besides removing the is_daemon
check.  However, Martin already posted patches that deal with this as
part of the his large patchset.

https://www.redhat.com/archives/dm-devel/2020-July/msg00245.html

You should take a look at those, and at my comments on them, because they
should resolve your issue.

-Ben

> 
> Reported-by: Tianxiong Li <lutianxiong@huawei.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> 
> ---
>  libmultipath/dmparser.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index b856a07f..d556f642 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -315,7 +315,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>  						WWID_SIZE);
>  				}
>  				/* Only call this in multipath client mode */
> -				if (!is_daemon && store_path(pathvec, pp))
> +				if (store_path(pathvec, pp))
>  					goto out1;
>  			} else {
>  				if (!strlen(pp->wwid) &&
> --

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

