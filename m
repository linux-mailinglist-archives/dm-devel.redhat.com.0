Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8EE18568F
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 00:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584227727;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K8qoJBx8oaRfSPkDucgdo3Xb1KBB1cDydHS77Lw+3XA=;
	b=YojrMpd4+gbxYQ9648jnABuIVqPeAHK/LMbjbSUqNbTJKcumhuwYGCkRpjn2N9pZ7axajF
	PB86alGcQ2F8aPgeYd5vBe5ddfA85m2HILtMRWuPE15ZStjeMhti4Noea6l7/r+SoGSON7
	2AtzfaJdizdIUozL8RWR0qOMgBhnVy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-YUVEWrBCOEq09fR6E7DqHg-1; Sat, 14 Mar 2020 19:15:24 -0400
X-MC-Unique: YUVEWrBCOEq09fR6E7DqHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0A63DB61;
	Sat, 14 Mar 2020 23:15:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B11360BE2;
	Sat, 14 Mar 2020 23:15:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23F4518089C8;
	Sat, 14 Mar 2020 23:14:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ENEKwj015631 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 14 Mar 2020 19:14:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F89191D62; Sat, 14 Mar 2020 23:14:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D188289E76;
	Sat, 14 Mar 2020 23:14:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02ENEG54027713; 
	Sat, 14 Mar 2020 18:14:16 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02ENEGWD027712;
	Sat, 14 Mar 2020 18:14:16 -0500
Date: Sat, 14 Mar 2020 18:14:15 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200314231415.GR30153@octiron.msp.redhat.com>
References: <20200306230605.3473-1-mwilck@suse.com>
	<20200306230605.3473-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200306230605.3473-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Bond <dbond@suse.com>
Subject: Re: [dm-devel] [PATCH 1/4] libmpathpersist: limit PRIN allocation
 length to 8192 bytes
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

On Sat, Mar 07, 2020 at 12:06:02AM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Some targets (notably the qemu-pr-helper) don't support PERSISTENT
> RESERVE IN  commands with more than 8192 bytes allocation length.
> While I have found no explicit requirement in the SCSI specs that
> the allocation lengh may not exceed 8k, an 8k limit is also enforced
> by sg_persist(8), and actually by mpathpersist itself for the
> --allocation-length option, but not for the auto-determined length.
> 
> Fix that.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_pr_ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
> index 74b26b0c..1a28cba7 100644
> --- a/libmpathpersist/mpath_pr_ioctl.c
> +++ b/libmpathpersist/mpath_pr_ioctl.c
> @@ -543,5 +543,7 @@ int get_prin_length(int rq_servact)
>  			mx_resp_len = 0;
>  			break;
>  	}
> +	if (mx_resp_len > MPATH_MAX_PARAM_LEN)
> +		mx_resp_len = MPATH_MAX_PARAM_LEN;
>  	return mx_resp_len;
>  }
> -- 
> 2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

