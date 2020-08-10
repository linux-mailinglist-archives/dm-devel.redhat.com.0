Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D937C2405B7
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 14:21:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-hilTZ9xYOjWRaoIblt1Osg-1; Mon, 10 Aug 2020 08:21:01 -0400
X-MC-Unique: hilTZ9xYOjWRaoIblt1Osg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 972E71902EA4;
	Mon, 10 Aug 2020 12:20:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B16DB19D7D;
	Mon, 10 Aug 2020 12:20:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81D4A1809554;
	Mon, 10 Aug 2020 12:20:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ACKaNh015824 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 08:20:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 678332166BA4; Mon, 10 Aug 2020 12:20:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 227B52166BA0
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 12:20:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA623805BC5
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 12:20:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-224-Q6uk3LqsNr2pKpkpRCAkHw-1;
	Mon, 10 Aug 2020 08:20:29 -0400
X-MC-Unique: Q6uk3LqsNr2pKpkpRCAkHw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 735C4AC12;
	Mon, 10 Aug 2020 12:20:48 +0000 (UTC)
Message-ID: <7d0e4a58ddec95d141433c5f472865cba6961459.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, christophe.varoqui@opensvc.com, Zdenek Kabelac
	<zkabelac@redhat.com>
Date: Mon, 10 Aug 2020 14:20:27 +0200
In-Reply-To: <40a7ea22-8897-363a-5821-99add9de6dc5@huawei.com>
References: <40a7ea22-8897-363a-5821-99add9de6dc5@huawei.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, yanxiaodan@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH V2] libmultipath: free pp if store_path fails
 in disassemble_map
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Liu,

On Fri, 2020-07-24 at 09:40 +0800, Zhiqiang Liu wrote:
> In disassemble_map func, one pp will be allocated and stored in
> pgp->paths. However, if store_path fails, pp will not be freed,
> then memory leak problem occurs.
> 
> Here, we will call free_path to free pp when store_path fails.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
> V1->V2: update based on ups/submit-2007 branch.
> 
>  libmultipath/dmparser.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

thanks for the patch. I'd suggest to do this without the pp_alloc_flag
variable, by pulling the store_path() call into the if (!pp)
conditional and treating failure differently in both branches of the
conditional. (Side note: if we introduce a boolean like this, we should
use "bool" as the variable type).

Unless you object, I'll add that change on top of my submit-2007
series, giving you appropriate credits.

@Ben, @Christophe: I've been considering for some time to start
handling cases like this with __attribute__((cleanup(f)))) (
https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html).
That could reduce the amount of goto clauses for error handling
significantly. It would be a major change in coding style though. What
do you think?

Regards,
Martin


> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index b9858fa5..8a0501ba 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -143,6 +143,7 @@ int disassemble_map(const struct _vector
> *pathvec,
>  	int def_minio = 0;
>  	struct path * pp;
>  	struct pathgroup * pgp;
> +	int pp_alloc_flag = 0;
> 
>  	assert(pathvec != NULL);
>  	p = params;
> @@ -292,6 +293,7 @@ int disassemble_map(const struct _vector
> *pathvec,
> 
>  		for (j = 0; j < num_paths; j++) {
>  			pp = NULL;
> +			pp_alloc_flag = 0;
>  			p += get_word(p, &word);
> 
>  			if (!word)
> @@ -304,13 +306,16 @@ int disassemble_map(const struct _vector
> *pathvec,
> 
>  				if (!pp)
>  					goto out1;
> -
> +				pp_alloc_flag = 1;
>  				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
>  			}
>  			FREE(word);
> 
> -			if (store_path(pgp->paths, pp))
> +			if (store_path(pgp->paths, pp)) {
> +				if (pp_alloc_flag)
> +					free_path(pp);
>  				goto out;
> +			}
> 
>  			pgp->id ^= (long)pp;
>  			pp->pgindex = i + 1;


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

