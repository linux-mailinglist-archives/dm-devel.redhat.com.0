Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id BC2A4188E14
	for <lists+dm-devel@lfdr.de>; Tue, 17 Mar 2020 20:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584473625;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qOkuNeIlXiM6Dm4yDMdZUzrSXDcVNOq+SZQ4aUzTC6Y=;
	b=aLJYjjqtbPf2WwJrIKu1nl7Fa8++E1iu+xmNnstMyJzmaDibuYtEhgprWveLseaBrz/zI2
	i+b9Rfsb1uQRAohQPwBqkfj6t4KJcF8NX7hlFIphx2r8MVvk/KZ85HDirXsLE7gAo64Uhs
	ikc95WjZwQs3VW/s49rOp6JuW7UO2NA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-Te8RWXerMcyq-SSuBF52_A-1; Tue, 17 Mar 2020 15:33:43 -0400
X-MC-Unique: Te8RWXerMcyq-SSuBF52_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0C06477;
	Tue, 17 Mar 2020 19:33:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 571E919C4F;
	Tue, 17 Mar 2020 19:33:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E45BD18089CD;
	Tue, 17 Mar 2020 19:33:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HJXSsp015675 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 15:33:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F21D919C58; Tue, 17 Mar 2020 19:33:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 327CD19C70;
	Tue, 17 Mar 2020 19:33:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02HJXO01026103; 
	Tue, 17 Mar 2020 14:33:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02HJXNs9026102;
	Tue, 17 Mar 2020 14:33:23 -0500
Date: Tue, 17 Mar 2020 14:33:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200317193323.GX30153@octiron.msp.redhat.com>
References: <20200315210521.12109-1-mwilck@suse.com>
	<20200315210521.12109-5-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200315210521.12109-5-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 4/4] libmpathpersist: ABI change: limit
 data-in/out size to 8192 bytes
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Mar 15, 2020 at 10:05:21PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Make sure that data structures used for PERSISTENT RESERVE IN/OUT
> fit into 8k buffers.
> 
> This patch breaks the libmpathpersist ABI, because the offsets of
> struct print_fulldescr_list.descriptors and of the fields num_transportid and
> trnptid_list in struct prout_param_descriptor change.

I agree with the idea of holding off on this unless we actually bump the
version number on libmpathpersist

-Ben

> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_persist.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_persist.h b/libmpathpersist/mpath_persist.h
> index 7cf4faf9..bdf4069d 100644
> --- a/libmpathpersist/mpath_persist.h
> +++ b/libmpathpersist/mpath_persist.h
> @@ -92,7 +92,7 @@ struct prin_readdescr
>  	uint32_t prgeneration;
>  	uint32_t additional_length;	/* The value should be either 0 or divisible by 8.
>  					   0 indicates no registered reservation key. */
> -	uint8_t	 key_list[MPATH_MAX_PARAM_LEN];
> +	uint8_t	 key_list[MPATH_MAX_PARAM_LEN - 2 * sizeof(uint32_t)];
>  };
>  
>  struct prin_resvdescr
> @@ -141,7 +141,9 @@ struct print_fulldescr_list
>  {
>  	uint32_t prgeneration;
>  	uint32_t number_of_descriptor;
> -	uint8_t private_buffer[MPATH_MAX_PARAM_LEN]; /*Private buffer for list storage*/
> +	/* Data-in; Private buffer for list storage */
> +	uint8_t private_buffer[MPATH_MAX_PARAM_LEN - 2 * sizeof(uint32_t)];
> +	/* array of pointers into private_buffer */
>  	struct prin_fulldescr *descriptors[];
>  };
>  
> @@ -163,8 +165,13 @@ struct prout_param_descriptor {		/* PROUT parameter descriptor */
>  	uint8_t	 sa_flags;
>  	uint8_t _reserved;
>  	uint16_t _obsolete1;
> -	uint8_t  private_buffer[MPATH_MAX_PARAM_LEN]; /*private buffer for list storage*/
> -	uint32_t num_transportid;	/* Number of Transport ID listed in trnptid_list[]*/
> +	/*private buffer for list storage; data-out */
> +	/* 24: offsetof (struct prout_param_descriptor, private_buffer) */
> +	uint8_t  private_buffer[MPATH_MAX_PARAM_LEN - 24];
> +	/* Internal use below here */
> +	/* Number of Transport ID listed in trnptid_list[] */
> +	uint32_t num_transportid;
> +	/* pointers into private_buffer */
>  	struct transportid *trnptid_list[];
>  };
>  
> -- 
> 2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

