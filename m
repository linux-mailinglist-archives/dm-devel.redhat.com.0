Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C0B1F264D66
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 20:41:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-MmXpBGQyMG6HmrLFoDoqsw-1; Thu, 10 Sep 2020 14:41:41 -0400
X-MC-Unique: MmXpBGQyMG6HmrLFoDoqsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A0021074640;
	Thu, 10 Sep 2020 18:41:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A1619C78;
	Thu, 10 Sep 2020 18:41:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B28B183D021;
	Thu, 10 Sep 2020 18:41:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AIf588018515 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 14:41:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7292B2022780; Thu, 10 Sep 2020 18:41:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DB72202A97B
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 18:41:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCDD9906381
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 18:41:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-179-TEd7o_NjOYm72WwVel4cVg-1;
	Thu, 10 Sep 2020 14:41:00 -0400
X-MC-Unique: TEd7o_NjOYm72WwVel4cVg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C27B5AE53;
	Thu, 10 Sep 2020 18:41:14 +0000 (UTC)
Message-ID: <4c55ba6dcf80faed5859f9e8b6ed71ca49beaed1.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 10 Sep 2020 20:40:57 +0200
In-Reply-To: <3f34cd14-17a0-f7a4-6cdb-7a37aa5c31b4@huawei.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
	<3f34cd14-17a0-f7a4-6cdb-7a37aa5c31b4@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V4 11/14] mpathpersist: check whether malloc
 paramp->trnptid_list fails in handle_args func
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-10 at 18:52 +0800, lixiaokeng wrote:
> In handle_args func, we donot check whether malloc paramp and
> each paramp->trnptid_list[j] fails before using them, it may
> cause access NULL pointer.
> 
> Here, we add alloc_prout_param_descriptor to allocate and init
> paramp, and we add free_prout_param_descriptor to free paramp
> and each paramp->trnptid_list[j].
> 
> We change num_transport to num_transportids to combine them.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  mpathpersist/main.c | 65 ++++++++++++++++++++++++++++++++++---------
> --
>  1 file changed, 50 insertions(+), 15 deletions(-)
> 
> diff --git a/mpathpersist/main.c b/mpathpersist/main.c
> index 28bfe410..da67c15c 100644
> --- a/mpathpersist/main.c
> +++ b/mpathpersist/main.c
> @@ -153,6 +153,38 @@ static int do_batch_file(const char *batch_fn)
>  	return ret;
>  }
> 
> +static struct prout_param_descriptor *
> +alloc_prout_param_descriptor(int num_transportid)
> +{
> +	struct prout_param_descriptor *paramp;
> +
> +	if (num_transportid < 0 || num_transportid > MPATH_MX_TIDS)
> +		return NULL;
> +
> +	paramp= malloc(sizeof(struct prout_param_descriptor) +
> +				(sizeof(struct transportid *) *
> num_transportid));
> +
> +	if (!paramp)
> +		return NULL;
> +
> +	paramp->num_transportid = num_transportid;
> +	memset(paramp, 0, sizeof(struct prout_param_descriptor) +
> +			(sizeof(struct transportid *) *
> num_transportid));

Here you overwrite paramp->num_transportid, which you just set.
Otherwise, the patch looks ok.

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

