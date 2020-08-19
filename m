Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3AC249952
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 11:28:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-iKouGjH5Pv6RCSwuIThwpg-1; Wed, 19 Aug 2020 05:28:15 -0400
X-MC-Unique: iKouGjH5Pv6RCSwuIThwpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A76951005E66;
	Wed, 19 Aug 2020 09:28:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D52C756C3;
	Wed, 19 Aug 2020 09:28:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54148180B656;
	Wed, 19 Aug 2020 09:27:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07J9RgfR021656 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 05:27:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D23C4110F0D2; Wed, 19 Aug 2020 09:27:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE346110F0A7
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 09:27:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56040811E9B
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 09:27:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-564-mss2E1z0OfupALh-JosZWQ-1;
	Wed, 19 Aug 2020 05:27:36 -0400
X-MC-Unique: mss2E1z0OfupALh-JosZWQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5372CADC1;
	Wed, 19 Aug 2020 09:28:01 +0000 (UTC)
Message-ID: <5ca4ef4256899586729d3ac21546671b6124937c.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel@redhat.com
Date: Wed, 19 Aug 2020 11:27:33 +0200
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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

As noted in my other reply, I don't fully understand how this deadlock
actually came to pass. But disabling queuing on a map which can't be
in use at the given point in time can't do no harm. So:

Reviewed-by: Martin Wilck <mwilck@suse.com>

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

