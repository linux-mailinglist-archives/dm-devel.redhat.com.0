Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEF625E462
	for <lists+dm-devel@lfdr.de>; Sat,  5 Sep 2020 01:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599263646;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4AuwXS6wirjtKQ8dgVWwnNDmB+SOSDVbVojyZjqv/uU=;
	b=AHbfZ7QKSC2+Vqk4bMSb69rRn7tvRb78zxwj8TCjv1s3Gecnv3zeUxMMPmAdoI5ABQFOiU
	DAPK2IRv1jOxWYY1LYyc9s0U2AUcXKLOknwXgwED4sS/wEhT0sLeo+HZxAUPCiPZ3IqKAO
	W4onhWwZb+qyTW4MtYdYqrkPDoAplW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-WPYA8AG0OfC8W8VaRk9P_g-1; Fri, 04 Sep 2020 19:54:04 -0400
X-MC-Unique: WPYA8AG0OfC8W8VaRk9P_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F689801ABB;
	Fri,  4 Sep 2020 23:53:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A226D19D7D;
	Fri,  4 Sep 2020 23:53:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA2977A30E;
	Fri,  4 Sep 2020 23:53:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084Nqwtj009162 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 19:52:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CE201002382; Fri,  4 Sep 2020 23:52:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C4A10013D7;
	Fri,  4 Sep 2020 23:52:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 084NqrdG025757; 
	Fri, 4 Sep 2020 18:52:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 084NqrwF025756;
	Fri, 4 Sep 2020 18:52:53 -0500
Date: Fri, 4 Sep 2020 18:52:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200904235252.GG11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<eeea4f08-bcb1-65b6-2fe8-b078961a07d3@huawei.com>
MIME-Version: 1.0
In-Reply-To: <eeea4f08-bcb1-65b6-2fe8-b078961a07d3@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 11/14] mpathpersist: check whether malloc
 paramp->trnptid_list, fails in handle_args func
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
Content-Disposition: inline

On Wed, Sep 02, 2020 at 03:23:42PM +0800, lixiaokeng wrote:
> In handle_args func, we donot check whether malloc paramp and
> each paramp->trnptid_list[j] fails before using them, it may
> cause access NULL pointer.
> 
> Here, we add alloc_prout_param_descriptor to allocate and init
> paramp, and we add free_prout_param_descriptor to free paramp
> and each paramp->trnptid_list[j].

This looks mostly fine to me. I have some minor nitpicks. But they
don't actually effect the correctness of the patch.

-Ben

> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  mpathpersist/main.c | 55 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/mpathpersist/main.c b/mpathpersist/main.c
> index 28bfe410..f20c902c 100644
> --- a/mpathpersist/main.c
> +++ b/mpathpersist/main.c
> @@ -153,6 +153,39 @@ static int do_batch_file(const char *batch_fn)
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
> +				(sizeof(struct transportid *) * num_transportid));
> +
> +	if (!paramp)
> +		return NULL;
> +
> +	paramp->num_transportid = num_transportid;
> +	memset(paramp, 0, sizeof(struct prout_param_descriptor) +
> +			(sizeof(struct transportid *) * num_transportid));
> +	return paramp;
> +}
> +
> +static void free_prout_param_descriptor(struct prout_param_descriptor *paramp)
> +{
> +	int i;
> +	if (!paramp)
> +		return;
> +
> +	for (i = 0; i < paramp->num_transportid; i++)
> +		free(paramp->trnptid_list[i]);
> +
> +	free(paramp);

Setting paramp to NULL here doesn't actually do anything.

> +	paramp = NULL;
> +}
> +
>  static int handle_args(int argc, char * argv[], int nline)
>  {
>  	int c;
> @@ -525,9 +558,12 @@ static int handle_args(int argc, char * argv[], int nline)
>  		int j;
>  		struct prout_param_descriptor *paramp;
> 
> -		paramp= malloc(sizeof(struct prout_param_descriptor) + (sizeof(struct transportid *)*(MPATH_MX_TIDS )));
> -
> -		memset(paramp, 0, sizeof(struct prout_param_descriptor) + (sizeof(struct transportid *)*(MPATH_MX_TIDS)));

When looking at your patch, I noticed that this function has both
num_transport and num_transportids, but only num_transport is used,
while num_transportids is reported back to the user.  I realize that
this is only tangentially related to your patch, but if you could
combine these two varaiables, that would be helpful.

> +		paramp = alloc_prout_param_descriptor(num_transport);
> +		if (!paramp) {
> +			fprintf(stderr, "malloc paramp failed\n");
> +			ret = MPATH_PR_OTHER;
> +			goto out_fd;
> +		}
> 
>  		for (j = 7; j >= 0; --j) {
>  			paramp->key[j] = (param_rk & 0xff);
> @@ -551,6 +587,12 @@ static int handle_args(int argc, char * argv[], int nline)
>  			for (j = 0 ; j < num_transport; j++)
>  			{
>  				paramp->trnptid_list[j] = (struct transportid *)malloc(sizeof(struct transportid));
> +				if (!paramp->trnptid_list[j]) {
> +					fprintf(stderr, "malloc paramp->trnptid_list[%d] failed.\n", j);
> +					ret = MPATH_PR_OTHER;
> +					free_prout_param_descriptor(paramp);
> +					goto out_fd;
> +				}
>  				memcpy(paramp->trnptid_list[j], &transportids[j],sizeof(struct transportid));
>  			}
>  		}
> @@ -558,12 +600,7 @@ static int handle_args(int argc, char * argv[], int nline)
>  		/* PROUT commands other than 'register and move' */
>  		ret = __mpath_persistent_reserve_out (fd, prout_sa, 0, prout_type,
>  				paramp, noisy);
> -		for (j = 0 ; j < num_transport; j++)
> -		{
> -			tmp = paramp->trnptid_list[j];
> -			free(tmp);
> -		}
> -		free(paramp);
> +		free_prout_param_descriptor(paramp);
>  	}
> 
>  	if (ret != MPATH_PR_SUCCESS)
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

