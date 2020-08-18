Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 25781248E9F
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 21:25:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-MewN5AKVMt6a876TJEDISg-1; Tue, 18 Aug 2020 15:25:50 -0400
X-MC-Unique: MewN5AKVMt6a876TJEDISg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BE4685B686;
	Tue, 18 Aug 2020 19:25:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB1B910027AB;
	Tue, 18 Aug 2020 19:25:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B223485CD;
	Tue, 18 Aug 2020 19:25:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07IJO4YR004221 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 15:24:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03E2C6353B; Tue, 18 Aug 2020 19:24:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2B6EA7FCC
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 19:24:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36E0F9B4482
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 19:24:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-121-mgUQc-j6NtWbazqHMTUeWg-1;
	Tue, 18 Aug 2020 15:23:53 -0400
X-MC-Unique: mgUQc-j6NtWbazqHMTUeWg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 65ECDAB7D;
	Tue, 18 Aug 2020 19:24:18 +0000 (UTC)
Message-ID: <9e4b52381f72c8ba6bae6b614daa26cc82ede88d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel@redhat.com
Date: Tue, 18 Aug 2020 21:23:51 +0200
In-Reply-To: <178ce8f8-cf74-bb32-1e5c-41674f493a24@huawei.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<178ce8f8-cf74-bb32-1e5c-41674f493a24@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
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
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Subject: Re: [dm-devel] [PATCH 4/5] multipathd: disable queueing for
 recreated map in uev_remove_map
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Lixiaokeng,

On Tue, 2020-08-18 at 21:09 +0800, lixiaokeng wrote:
> There may be a race window here:
> 1. all paths gone, causing map flushed both from multipathd and
> kernel
> 2. paths regenerated, causing multipathd creating the map again.
> 
> 1 will generate a remove uevent which can be handled after 2, so we
> can
> disable queueing for the map created by 2 here temporarily and let
> the
> change uevent (generated by 2) calling uev_add_map->setup_multipath
> to set queueing again. This can prevent the deadlock in this race
> window.
> 
> The possible deadlock is: all udevd workers hangs in devices because
> of
> queue_if_no_path, so no udevd workers can handle new event and since
> multipathd will remove the map, the checkerloop cannot check this
> map's
> retry tick timeout and cancel the io hang which makes the udevd
> worker
> hang forever. multipathd cannot receive any uevent from udevd because
> all udevd workers hang there so the map cannot be recreated again
> which
> makes a deadlock.
> 
> Signed-off-by: Lixiaokeng@huawei.com

A map which is removed and not yet re-added again (as far as udev is
concerned) doesn't need to queue because it can't possibly be in use.
So I think the patch can't hurt in other scenarios, at it makes sense
in the situation you describe. However I have a few questions.

Have you observed this, or is it theory? I'm wondering: After 2) there
should be some paths again, so why would the udev workers hang? 
I guess this could happen if the regenerated paths all in failed /
standby state, is that what you mean?

Note also that we set DM_NOSCAN in the udev rules when there are no
usable paths, so udev workers would only hang if the last path fails /
is removed after the "multipath -U" check.

You've certainly hit a weak spot here, and you've nicely described a
potential problem scenario. The delayed processing of uevents that
multipathd triggered itself is a recurring cause of headache.

Regards,
Martin



> ---
>  multipathd/main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index baa18183..d7e20a10 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -798,6 +798,7 @@ uev_remove_map (struct uevent * uev, struct
> vectors * vecs)
>  		goto out;
>  	}
> 
> +	dm_queue_if_no_path(alias, 0);
>  	remove_map_and_stop_waiter(mpp, vecs);
>  out:
>  	lock_cleanup_pop(vecs->lock);


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

