Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C5485185692
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 00:17:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584227825;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+qZUPrOBsPZHLmuPaDRr7tYwPCNfig8/sA4MUDkC9xk=;
	b=PptplFQhBnXwMrfazURcHW54pZRA3A56RXtLA+7S+Zxidz3ZUEGy0HHX0ze5JsTb3/ELs9
	1q9gLXiYXpux/BmchhQo1ix1uvb0deBMReknOAkkvLoK4c8Hzzg4ODnnRJUnllXQmYymRz
	oa2KFuJECZsPQpVML9K0UC3bOz41wkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-W_VRcn1rN5qo0I3D-wlEeQ-1; Sat, 14 Mar 2020 19:17:03 -0400
X-MC-Unique: W_VRcn1rN5qo0I3D-wlEeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 711A38017CC;
	Sat, 14 Mar 2020 23:16:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ED5760BE2;
	Sat, 14 Mar 2020 23:16:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4429985EF8;
	Sat, 14 Mar 2020 23:16:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ENGSRl015734 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 14 Mar 2020 19:16:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 944B191D82; Sat, 14 Mar 2020 23:16:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0751F89E76;
	Sat, 14 Mar 2020 23:16:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02ENGO7g027727; 
	Sat, 14 Mar 2020 18:16:25 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02ENGOQb027726;
	Sat, 14 Mar 2020 18:16:24 -0500
Date: Sat, 14 Mar 2020 18:16:24 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200314231624.GT30153@octiron.msp.redhat.com>
References: <20200306230605.3473-1-mwilck@suse.com>
	<20200306230605.3473-4-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200306230605.3473-4-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Bond <dbond@suse.com>
Subject: Re: [dm-devel] [PATCH 3/4] libmpathpersist:
 mpath_format_readfullstatus(): use real buffer size
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Mar 07, 2020 at 12:06:04AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This changes no semantics, but it will allow changing the size of
> prin_readfd.private_buffer in a follow-up patch.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_pr_ioctl.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
> index 8bf16c0d..8d8ca76f 100644
> --- a/libmpathpersist/mpath_pr_ioctl.c
> +++ b/libmpathpersist/mpath_pr_ioctl.c
> @@ -233,6 +233,8 @@ static void mpath_format_readfullstatus(struct prin_resp *pr_buff)
>  	uint32_t additional_length, k, tid_len_len = 0;
>  	char tempbuff[MPATH_MAX_PARAM_LEN];
>  	struct prin_fulldescr fdesc;
> +	static const int pbuf_size =
> +		sizeof(pr_buff->prin_descriptor.prin_readfd.private_buffer);
>  
>  	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readfd.prgeneration);
>  	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readfd.number_of_descriptor);
> @@ -244,16 +246,18 @@ static void mpath_format_readfullstatus(struct prin_resp *pr_buff)
>  	}
>  
>  	additional_length = pr_buff->prin_descriptor.prin_readfd.number_of_descriptor;
> -	if (additional_length > MPATH_MAX_PARAM_LEN) {
> +	if (additional_length > pbuf_size) {
>  		condlog(3, "PRIN length %u exceeds max length %d", additional_length,
> -			MPATH_MAX_PARAM_LEN);
> +			pbuf_size);
>  		return;
>  	}
>  
>  	memset(&fdesc, 0, sizeof(struct prin_fulldescr));
>  
> -	memcpy( tempbuff, pr_buff->prin_descriptor.prin_readfd.private_buffer,MPATH_MAX_PARAM_LEN );
> -	memset(&pr_buff->prin_descriptor.prin_readfd.private_buffer, 0, MPATH_MAX_PARAM_LEN);
> +	memcpy( tempbuff, pr_buff->prin_descriptor.prin_readfd.private_buffer,
> +		pbuf_size);
> +	memset(&pr_buff->prin_descriptor.prin_readfd.private_buffer, 0,
> +	       pbuf_size);
>  
>  	p =(unsigned char *)tempbuff;
>  	ppbuff = (char *)pr_buff->prin_descriptor.prin_readfd.private_buffer;
> -- 
> 2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

