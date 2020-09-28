Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 685A127A7F7
	for <lists+dm-devel@lfdr.de>; Mon, 28 Sep 2020 08:55:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-UEzgKZnYNkar8yZ9DKsXSg-1; Mon, 28 Sep 2020 02:55:44 -0400
X-MC-Unique: UEzgKZnYNkar8yZ9DKsXSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 577F387311A;
	Mon, 28 Sep 2020 06:55:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E421619C4;
	Mon, 28 Sep 2020 06:55:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2229A44A4D;
	Mon, 28 Sep 2020 06:54:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08S6sf1e023520 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 02:54:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC12C202348E; Mon, 28 Sep 2020 06:54:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A743B2023598
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 06:54:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CD4B80351F
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 06:54:38 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-474-IycGa_JzMGmbQuSlH0zGtQ-1; Mon, 28 Sep 2020 02:54:35 -0400
X-MC-Unique: IycGa_JzMGmbQuSlH0zGtQ-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id AC08E44EBCC30A746F45;
	Mon, 28 Sep 2020 14:54:30 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 28 Sep 2020 14:54:23 +0800
To: <mwilck@suse.com>
References: <20200821135418.28138-1-mwilck@suse.com>
	<20200821135418.28138-4-mwilck@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <106bcd4a-0d3c-f758-ba0d-68e0bc2c2edc@huawei.com>
Date: Mon, 28 Sep 2020 14:54:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821135418.28138-4-mwilck@suse.com>
X-Originating-IP: [10.174.178.208]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 3/3] multipath: get_dm_mpvec: discard broken
	maps
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Martin:
  I'm sorry for forgetting to reply this. When I test with
this patch, the multipath coredump don't cause again.

Regards
Lixiaokeng

On 2020/8/21 21:54, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Use the same logic as map_discovery() to discard maps that
> couldn't be parsed successfully. If map parsing fails,
> certain vital fields of the mpp, like features or hwhandler,
> will not be set, which might cause multipath to crash later on.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipath/main.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/multipath/main.c b/multipath/main.c
> index 80bc4b5..2d7ec74 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -193,7 +193,7 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
>  {
>  	int i;
>  	struct multipath * mpp;
> -	char params[PARAMS_SIZE], status[PARAMS_SIZE];
> +	int flags = (cmd == CMD_LIST_SHORT ? DI_NOIO : DI_ALL);
>  
>  	if (dm_get_maps(curmp))
>  		return 1;
> @@ -205,27 +205,22 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
>  		if (refwwid && strlen(refwwid) &&
>  		    strncmp(mpp->wwid, refwwid, WWID_SIZE)) {
>  			condlog(3, "skip map %s: out of scope", mpp->alias);
> -			free_multipath(mpp, KEEP_PATHS);
> -			vector_del_slot(curmp, i);
> +			remove_map(mpp, pathvec, curmp, PURGE_VEC);
>  			i--;
>  			continue;
>  		}
>  
> -		dm_get_map(mpp->alias, &mpp->size, params);
> -		condlog(3, "params = %s", params);
> -		dm_get_status(mpp->alias, status);
> -		condlog(3, "status = %s", status);
> -
> -		disassemble_map(pathvec, params, mpp);
> -		update_pathvec_from_dm(pathvec, mpp,
> -				       (cmd == CMD_LIST_SHORT ?
> -					DI_NOIO : DI_ALL));
> +		if (update_multipath_table(mpp, pathvec, flags) != DMP_OK ||
> +		    update_multipath_status(mpp) != DMP_OK) {
> +			condlog(1, "error parsing map %s", mpp->wwid);
> +			remove_map(mpp, pathvec, curmp, PURGE_VEC);
> +			i--;
> +			continue;
> +		}
>  
>  		if (cmd == CMD_LIST_LONG)
>  			mpp->bestpg = select_path_group(mpp);
>  
> -		disassemble_status(status, mpp);
> -
>  		if (cmd == CMD_LIST_SHORT ||
>  		    cmd == CMD_LIST_LONG) {
>  			struct config *conf = get_multipath_config();
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

