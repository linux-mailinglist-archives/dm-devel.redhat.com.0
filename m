Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 78D2140D1AD
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 04:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631759524;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D9bxwgMCANOiEIhtohp+ckASwuRfm0aJH78d26CQ928=;
	b=hfHey6Fu1eLVWGF622qHPtjNQumRxDLJhvV/bNmGWgiZXi/uj2N1oEjMYHfsAIyVCEbODb
	o2vPiOujhvb8x564ruKYO6EqBaz4eX2GuxkSGOM458/AxIfHvyZoXcQ9SDfGrj1Os69Irl
	DHfjPEfjn2QnIzLmjlNbzk1IkEwNhKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-I_hfsNTMNsCNywNFmvLgsA-1; Wed, 15 Sep 2021 22:32:02 -0400
X-MC-Unique: I_hfsNTMNsCNywNFmvLgsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54254362FF;
	Thu, 16 Sep 2021 02:31:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2388360C9F;
	Thu, 16 Sep 2021 02:31:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B795180142F;
	Thu, 16 Sep 2021 02:31:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G2TQ2U028516 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 22:29:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62C9F3AC0; Thu, 16 Sep 2021 02:29:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C544F6A912;
	Thu, 16 Sep 2021 02:29:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G2TLE5007428; 
	Wed, 15 Sep 2021 21:29:21 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G2TKTe007427;
	Wed, 15 Sep 2021 21:29:20 -0500
Date: Wed, 15 Sep 2021 21:29:20 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916022920.GO3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-30-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-30-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 29/35] multipathd: uxlsnr: use parser to
 determine non-root commands
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:41:14PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Rather than using a separate poor-man's parser for checking root
> commands, use the real parser. It will return "LIST" as first verb
> for the read-only commands that non-root users may execute.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/uxlsnr.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index cfff0ae..ff9604f 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -362,16 +362,15 @@ static int uxsock_trigger(struct client *c, void *trigger_data)
>  
>  	vecs = (struct vectors *)trigger_data;
>  
> -
> -	if (!c->is_root &&
> -	    (strncmp(c->cmd, "list", strlen("list")) != 0) &&
> -	    (strncmp(c->cmd, "show", strlen("show")) != 0)) {
> -		append_strbuf_str(&c->reply, "permission deny: need to be root");
> -		return r;
> -	}
> -
>  	r = parse_cmd(c);
>  
> +	if (r == 0 && c->cmdvec && VECTOR_SIZE(c->cmdvec) > 0) {
> +		struct key *kw = VECTOR_SLOT(c->cmdvec, 0);
> +
> +		if (!c->is_root && kw->code != LIST)
> +			r = EPERM;
> +	}
> +
>  	if (r == 0 && c->handler)
>  		r = execute_handler(c, vecs, uxsock_timeout / 1000);
>  
> @@ -381,10 +380,18 @@ static int uxsock_trigger(struct client *c, void *trigger_data)
>  	}
>  
>  	if (r > 0) {
> -		if (r == ETIMEDOUT)
> +		switch(r) {
> +		case ETIMEDOUT:
>  			append_strbuf_str(&c->reply, "timeout\n");
> -		else
> +			break;
> +		case EPERM:
> +			append_strbuf_str(&c->reply,
> +					  "permission deny: need to be root\n");
> +			break;
> +		default:
>  			append_strbuf_str(&c->reply, "fail\n");
> +			break;
> +		}
>  	}
>  	else if (!r && get_strbuf_len(&c->reply) == 0) {
>  		append_strbuf_str(&c->reply, "ok\n");
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

