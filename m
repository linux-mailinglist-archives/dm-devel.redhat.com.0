Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 21341249281
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 03:43:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-7jB7flc2Pk6Ks64T2U-pCA-1; Tue, 18 Aug 2020 21:43:54 -0400
X-MC-Unique: 7jB7flc2Pk6Ks64T2U-pCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF8FD186A561;
	Wed, 19 Aug 2020 01:43:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F3027BE86;
	Wed, 19 Aug 2020 01:43:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 065441832FC2;
	Wed, 19 Aug 2020 01:43:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07J1hFPc010396 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 21:43:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E61C3110F723; Wed, 19 Aug 2020 01:43:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0D431004145
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 01:43:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20ECE8785C4
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 01:43:12 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-51-1SXytCErNCuXkkPWOuIfQQ-1; Tue, 18 Aug 2020 21:43:07 -0400
X-MC-Unique: 1SXytCErNCuXkkPWOuIfQQ-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 53B5D82F46464E0C69FF;
	Wed, 19 Aug 2020 09:43:04 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 19 Aug 2020
	09:42:56 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<61f78db1-c481-292f-eb6f-bce69d66b8ab@huawei.com>
Message-ID: <1c0d627e-3d7b-8971-04b5-f3815f142621@huawei.com>
Date: Wed, 19 Aug 2020 09:42:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61f78db1-c481-292f-eb6f-bce69d66b8ab@huawei.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
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
Subject: Re: [dm-devel] [PATCH 5/5] libmultipath fix daemon memory leak in
 disassemble_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi
  I'm sorry for subject with Re. I will send it  again.

On 2020/8/18 21:11, lixiaokeng wrote:
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
> If checking is_deamon is deleted, there are many other things need be done like in
> https://www.redhat.com/archives/dm-devel/2020-July/msg00245.html. And this
> branch develops from 0.8.3 but upstream_queue is mainline which develops from
> 0.8.4.
> Here, we skip alloc_path if pp isn't find in pathvec and process is daemon.  In
> daemon, we should not store path with incomplete information to pathvec.  The
> pathvec stores all paths in daemon, so it is reasonable keep same with pathvec.
> 
> Reported-by: Tianxiong Li <lutianxiong@huawei.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> ---
>  libmultipath/dmparser.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index f02c551..0f370e9 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -314,6 +314,16 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>  			}
> 
>  			if (!pp) {
> +				/* daemon should keep same with pathvec */
> +				/* pp is not find in pathvec, skip it */
> +				if (is_daemon) {
> +					FREE(word);
> +					for (k = 0; k < num_paths_args; k++) {
> +						p += get_word(p, NULL);
> +					}
> +					continue;
> +				}
> +
>  				pp_unfound = 1;
>  				pp = alloc_path();
> 
> @@ -326,8 +336,8 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
>  					strncpy(pp->wwid, mpp->wwid,
>  						WWID_SIZE - 1);
>  				}
> -				/* Only call this in multipath client mode */
> -				if (!is_daemon && store_path(pathvec, pp)) {
> +
> +				if (store_path(pathvec, pp)) {
>  					free_path(pp);
>  					goto out1;
>  				}
> --
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

