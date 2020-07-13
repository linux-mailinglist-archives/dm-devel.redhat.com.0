Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CA26F21D3EF
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 12:50:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-mGuImiv-O6egD7NzKG6PSg-1; Mon, 13 Jul 2020 06:50:15 -0400
X-MC-Unique: mGuImiv-O6egD7NzKG6PSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18183800597;
	Mon, 13 Jul 2020 10:50:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DADF73029;
	Mon, 13 Jul 2020 10:50:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3431180954D;
	Mon, 13 Jul 2020 10:49:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DAnhfu013488 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 06:49:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72EBDD74A4; Mon, 13 Jul 2020 10:49:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E7D8D74A2
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 10:49:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 937FB187507A
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 10:49:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-62-tqgs5w7RNLm0qEtQ-qeWFw-1;
	Mon, 13 Jul 2020 06:49:38 -0400
X-MC-Unique: tqgs5w7RNLm0qEtQ-qeWFw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 14899AE65;
	Mon, 13 Jul 2020 10:49:39 +0000 (UTC)
Message-ID: <84c1ae97f0eea8920b08cd2acbfb7092ed1465df.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Mon, 13 Jul 2020 12:49:36 +0200
In-Reply-To: <b2037975-dc52-7841-fa61-a38ec94f93a7@huawei.com>
References: <b2037975-dc52-7841-fa61-a38ec94f93a7@huawei.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, dm-devel@redhat.com, liuzhiqiang26@huawei.com,
	lutianxiong@huawei.com
Subject: Re: [dm-devel] [dm-level] master - libmultipath: fix use after free
 when iscsi logs in
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

Hello Lixiaokeng,

Thanks for the report and the analysis.

On Mon, 2020-07-13 at 10:22 +0800, lixiaokeng wrote:
> When two iscsi ips log in and out alternately and  the following
> scripts run
> at the same time,
> 
> #!/bin/bash
> interval=5
> while true
> do
>         iscsiadm -m node -p 9.41.147.171 &> /dev/null
>         iscsiadm -m node -p 9.41.148.172 &> /dev/null
>         iscsiadm -m session &> /dev/null
>         rescan-scsi-bus.sh &> /dev/null
>         multipath -v2 &> /dev/null
>         multipath -ll &> /dev/null
>         sleep $interval
> done
> 
> multipathd will have a segfault after about 30 mins.
> 
> The reason is that mpp->hwe is accessed after hwe is already freed.
> In
> extract_hwe_from_path func, mpp->hwe is set to pp->hwe, so they
> points to the
> same hwe. For some reasons, pp->mpp will be set to NULL in
> orphan_path func.
> Then, pp and hwe will be freed with (pp->mpp == NULL) in free_path
> func
> called by ev_remove_path func. However, mpp->hwe is not set to NULL
> while hwe
> is already freed. So, when iscsi device logs in and new path is added
> to mpp,
> mpp->hwe will be accessed in select_pgfailback func. Finally, use-
> after-free
> problem occurs.
> 
> The procedure details given as follows,
> 1.wait_dmevents thread
> wait_dmevents
> 	->dmevent_loop
> 		->update_multipath
> 			->__setup_multipath
> 				->update_multipath_strings
> 					 -> sync_paths
> 						->orphan_path
> 2.uevqloop thread  (iscsi log out, remove path)
> uevqloop
> ->uevent_dispatch
> 	->service_uevq
> 		->uev_remove_path
> 			->ev_remove_path  //pp->mpp is NULL
> 				->free_path(pp)
> 			//pp->hew are freed but mpp->hwe is not set to
> NULL
> 3.ev_remove_path  (iscsi log in, add path)
> uevqloop
> ->uevent_dispatch
> 	->service_uevq
> 		->ev_add_path
> 			->select_pgfailback //mpp->hwe is accessed
> 
> Here, we will set mpp->hwe to NULL before setting pp->map to NULL in
> orphan_path
> func.
> 
> Signed-off-by: Tianxiong Lu <lutianxiong@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> ---
>  libmultipath/structs_vec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 3dbbaa0..9bbe5d1 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -93,6 +93,8 @@ int adopt_paths(vector pathvec, struct multipath
> *mpp)
>  void orphan_path(struct path *pp, const char *reason)
>  {
>  	condlog(3, "%s: orphan path, %s", pp->dev, reason);
> +	if (pp->mpp && pp->mpp->hwe == pp->hwe)
> +		pp->mpp->hwe = NULL;
>  	pp->mpp = NULL;
>  	pp->dmstate = PSTATE_UNDEF;
>  	pp->uid_attribute = NULL;

This isn't wrong, but I think sync_paths() has to be fixed as well.
I'll send a small series soon, based on your patch.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

